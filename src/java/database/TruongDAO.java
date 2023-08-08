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
import java.util.List;
import model.Nganh;
import model.ThiSinh;
import model.Truong;

/**
 *
 * @author phangiabao
 */
public class TruongDAO {

    

    public ArrayList<Truong> getListTruong() {
            ArrayList<Truong> list = new ArrayList<>();
            String query = "select * from truong";
        try {
            
            Connection conn = new JDBCUtil().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                list.add(new Truong(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Truong getListTruongById(Truong t) {
        Truong ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM truong WHERE matruong=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaTruong());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Truong(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }
    public Truong getListTruongByIdString(String t) {
        Truong ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM truong WHERE matruong=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Truong(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }
    
    public int delete(String maTruong){
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "DELETE from truong  WHERE matruong=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maTruong);
            System.out.println(sql);
            ketQua = st.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
    
     public int insert(Truong t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "INSERT INTO truong (matruong, tentruong, tinhtruong, huyentruong, khuvuc)  VALUES (?,?,?,?,?)";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaTruong());
            st.setString(2, t.getTenTruong());
            st.setString(3, t.getTinhTruong());
            st.setString(4, t.getHuyenTruong());
            st.setString(5, t.getKhuVuc());
            ketQua = st.executeUpdate();
            
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
     
     public int insertAll( ArrayList<Truong> arr) {
        int dem = 0;
        for (final Truong truong : arr) {
            dem += this.insert(truong);
        }
        return dem;
    }
     
     public int update( Truong t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE truong  SET  tentruong=?, tinhtruong=?, huyentruong=?, khuvuc=? WHERE matruong=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(5, t.getMaTruong());
            st.setString(1, t.getTenTruong());
            st.setString(2, t.getTinhTruong());
            st.setString(3, t.getHuyenTruong());
            st.setString(4, t.getKhuVuc());
            System.out.println(sql);
            ketQua = st.executeUpdate();
          
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

}
