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
public class NganhDAO {

    public ArrayList<Nganh> getListNganh() {
        ArrayList<Nganh> list = new ArrayList<>();
        String query = "select * from nganh";
        try {

            Connection conn = new JDBCUtil().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Nganh(rs.getString(1),
                        rs.getString(2)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Nganh getListNganhById(Nganh t) {
        Nganh ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM nganh WHERE manganh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaNganh());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Nganh(rs.getString(1),
                        rs.getString(2));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }
    public Nganh getListNganhByIdString(String t) {
        Nganh ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM nganh WHERE manganh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Nganh(rs.getString(1),
                        rs.getString(2));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public int delete(String maNganh) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "DELETE from nganh  WHERE manganh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maNganh);
            System.out.println(sql);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int insert(Nganh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "INSERT INTO nganh (manganh, tennganh)  VALUES (?,?)";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaNganh());
            st.setString(2, t.getTenNganh());
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int insertAll(ArrayList<Nganh> arr) {
        int dem = 0;
        for (final Nganh nganh : arr) {
            dem += this.insert(nganh);
        }
        return dem;
    }

    public int update(Nganh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE nganh  SET  tennganh=? WHERE manganh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(2, t.getMaNganh());
            st.setString(1, t.getTenNganh());
            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }
    public boolean kiemTraMaNganh(final String maNganh) {
        boolean ketQua = false;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM nganh WHERE manganh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maNganh);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ketQua = true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

}
