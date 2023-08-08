/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.KeHoach;
import model.TaiKhoanAdmin;

/**
 *
 * @author phangiabao
 */
public class KeHoachDAO {
    public ArrayList<KeHoach> getListKeHoach() {
            ArrayList<KeHoach> list = new ArrayList<>();
            String query = "select * from kehoach";
        try {
            
            Connection conn = new JDBCUtil().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                TaiKhoanAdmin t1 = new TaiKhoanAdmin();
                TaiKhoanAdmin t2 = new TaiKhoanAdmin();
                t1.setMaAdmin(rs.getString(9));
                t2.setTenDangNhap(rs.getString(10));
                KeHoach kh = new KeHoach(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),t1,t2,rs.getDate(11),rs.getDate(12));
                list.add(kh);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public KeHoach getKeHoachById(KeHoach t) {
        KeHoach ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM kehoach WHERE makehoach=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaKeHoach());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TaiKhoanAdmin t1 = new TaiKhoanAdmin();
                TaiKhoanAdmin t2 = new TaiKhoanAdmin();
                t1.setMaAdmin(rs.getString(9));
                t2.setTenDangNhap(rs.getString(10));
                ketQua = new KeHoach(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),t1,t2,rs.getDate(11),rs.getDate(12));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }
    public KeHoach getKeHoachByIdString(String t) {
        KeHoach ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM kehoach WHERE makehoach=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TaiKhoanAdmin t1 = new TaiKhoanAdmin();
                TaiKhoanAdmin t2 = new TaiKhoanAdmin();
                t1.setMaAdmin(rs.getString(9));
                t2.setTenDangNhap(rs.getString(10));
                ketQua = new KeHoach(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),t1,t2,rs.getDate(11),rs.getDate(12));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }
    
    public int delete(String maKeHoach){
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "DELETE from kehoach  WHERE makehoach=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maKeHoach);
            System.out.println(sql);
            ketQua = st.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
    
     public int insert(final KeHoach t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "INSERT INTO kehoach (makehoach, hocky, tenkehoach, hinhthuc, motakehoach, filekehoach,trangthai,nguoisoan,nguoiduyet,ngaytao)  VALUES (?,?,?,?,?,?,?,?,?,?)";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaKeHoach());
            st.setString(2, t.getHocKy());
            st.setString(3, t.getTenKeHoach());
            st.setString(4, t.getHinhThuc());
            st.setString(5, t.getMoTaKeHoach());
            st.setString(6, t.getFileKeHoach());
            st.setString(7, t.getTrangThai());
            st.setString(8, t.getNguoiSoan().getMaAdmin());
            st.setString(9, t.getNguoiDuyet().getTenDangNhap());
            st.setDate(10, t.getNgayTao());
            ketQua = st.executeUpdate();
            System.out.println("B\u1ea1n \u0111\u00e3 th\u1ef1c thi: " + sql);
            System.out.println("C\u00f3 " + ketQua + " d\u00f2ng b\u1ecb thay \u0111\u1ed5i!");
            JDBCUtil.closeConnection(con);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
     
     public int insertAll( ArrayList<KeHoach> arr) {
        int dem = 0;
        for (final KeHoach keHoach : arr) {
            dem += this.insert(keHoach);
        }
        return dem;
    }
     
     public int update( KeHoach t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE kehoach  SET   hocky=?, tenkehoach=?, hinhthuc=?, motakehoach=? WHERE makehoach=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getHocKy());
            st.setString(2, t.getTenKeHoach());
            st.setString(3, t.getHinhThuc());
            st.setString(4, t.getMoTaKeHoach());
       
            st.setString(5, t.getMaKeHoach());
            System.out.println(sql);
            ketQua = st.executeUpdate();
          
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
     
      public int updateForUser( KeHoach t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE taikhoanadmin  SET   hocky=?, tenkehoach=?, hinhthuc=?, motakehoach=?, filekehoach=?, nhanxet=?,trangthai=?,nguoisoan=?,nguoiduyet=?,ngaytao=?,ngayduyet=? WHERE makehoach=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getHocKy());
            st.setString(2, t.getTenKeHoach());
            st.setString(3, t.getHinhThuc());
            st.setString(4, t.getMoTaKeHoach());
            st.setString(5, t.getFileKeHoach());
            st.setString(6, t.getNhanXet());
            st.setString(7, t.getTrangThai());
            st.setString(8, t.getNguoiSoan().getMaAdmin());
            st.setString(9, t.getNguoiDuyet().getTenDangNhap());
            st.setDate(10, t.getNgayTao());
            st.setDate(11, t.getNgayDuyet());
            st.setString(12, t.getMaKeHoach());
            System.out.println(sql);
            ketQua = st.executeUpdate();
          
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
     
     
     
     public int countKH() {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT COUNT(*) FROM  kehoach";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ketQua = rs.getInt(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
}
