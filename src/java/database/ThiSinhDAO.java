/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.Date;
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
public class ThiSinhDAO {

    public ArrayList<ThiSinh> getListThiSinh() {
        ArrayList<ThiSinh> list = new ArrayList<>();
        String query = "select * from thisinh";
        try {
            Connection conn = new JDBCUtil().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Truong t1 = new Truong();
                t1.setMaTruong(rs.getString(15));
                Nganh n1 = new Nganh();
                n1.setMaNganh(rs.getString(26));
                Truong t2 = new TruongDAO().getListTruongById(t1);
                Nganh n2 = new NganhDAO().getListNganhById(n1);
                ThiSinh thiSinh = new ThiSinh(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), t2, rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), n2, rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30), rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36), rs.getString(37), rs.getString(38), rs.getString(39), rs.getString(40), rs.getString(41));
                list.add(thiSinh);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public ThiSinh getListThiSinhById(ThiSinh t) {
        ThiSinh ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM thisinh WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaThiSinh());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Truong t1 = new Truong();
                t1.setMaTruong(rs.getString(15));
                Nganh n1 = new Nganh();
                n1.setMaNganh(rs.getString(26));
                Truong t2 = new TruongDAO().getListTruongById(t1);
                Nganh n2 = new NganhDAO().getListNganhById(n1);
                ketQua = new ThiSinh(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), t2, rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), n2, rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30), rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36), rs.getString(37), rs.getString(38), rs.getString(39), rs.getString(40), rs.getString(41));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }
    public ThiSinh getListThiSinhByIdString(String t) {
        ThiSinh ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM thisinh WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Truong t1 = new Truong();
                t1.setMaTruong(rs.getString(15));
                Nganh n1 = new Nganh();
                n1.setMaNganh(rs.getString(26));
                Truong t2 = new TruongDAO().getListTruongById(t1);
                Nganh n2 = new NganhDAO().getListNganhById(n1);
                ketQua = new ThiSinh(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), t2, rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), n2, rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30), rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36), rs.getString(37), rs.getString(38), rs.getString(39), rs.getString(40), rs.getString(41));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public int delete(String maThiSinh) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "DELETE from thisinh  WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maThiSinh);
            System.out.println(sql);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int insertFull(ThiSinh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "INSERT INTO thisinh (mathisinh, hovatenthisinh, cccd, sodienthoai, email, gioitinh, ngaysinh, ngaycap, noicap, matruong, namtotnghiep, tinhthanh, quanhuyen, phuongxa, sonha, diachidaydu, noidangky, manganh, hinhthucdangky, kydutuyen, phuongthucdangky, xephang, lephidangky, noisinh, quoctich, dantoc, tongiao, hokhauthuongtru, xeploaitotnghiep, loaihanhkiem, loaihocluc, tinhtrangthanhtoandangky, tinhtrangdangky, tinhtranghoso, tinhtrangnhaphoc, tinhtrangthanhtoannhaphoc)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaThiSinh());
            st.setString(2, t.getHoVaTenThiSinh());
            st.setString(3, t.getCccd());
            st.setString(4, t.getSoDienThoai());
            st.setString(5, t.getEmail());
            st.setString(6, t.getGioiTinh());
            st.setDate(7, t.getNgaySinh());
            st.setDate(8, t.getNgayCap());
            st.setString(9, t.getNoiCap());
            st.setString(10, t.getMaTruong().getMaTruong());
            st.setString(11, t.getNamTotNghiep());
            st.setString(12, t.getTinhThanh());
            st.setString(13, t.getQuanHuyen());
            st.setString(14, t.getPhuongXa());
            st.setString(15, t.getSoNha());
            st.setString(16, t.getDiaChiDayDu());
            st.setString(17, t.getNoiDangKy());
            st.setString(18, t.getMaNganh().getMaNganh());
            st.setString(19, t.getHinhThucDangKy());
            st.setString(20, t.getKyDuTuyen());
            st.setString(21, t.getPhuongThucDangKy());
            st.setString(22, t.getXepHang());
            st.setString(23, t.getLePhiDangKy());
            st.setString(24, t.getNoiSinh());
            st.setString(25, t.getQuocTich());
            st.setString(26, t.getDanToc());
            st.setString(27, t.getTonGiao());
            st.setString(28, t.getHoKhauThuongTru());
            st.setString(29, t.getXepLoaiTotNghiep());
            st.setString(30, t.getLoaiHanhKiem());
            st.setString(31, t.getLoaiHocLuc());
            st.setString(32, t.getLoaiHanhKiem());
            st.setString(33, t.getTinhTrangThanhToanDangKy());
            st.setString(34, t.getTinhTrangDangKy());
            st.setString(35, t.getTinhTrangHoSo());
            st.setString(36, t.getTinhTrangNhapHoc());
            st.setString(37, t.getTinhTrangThanhToanNhapHoc());

            ketQua = st.executeUpdate();
            System.out.println("B\u1ea1n \u0111\u00e3 th\u1ef1c thi: " + sql);
            System.out.println("C\u00f3 " + ketQua + " d\u00f2ng b\u1ecb thay \u0111\u1ed5i!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int insert(ThiSinh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "INSERT INTO thisinh (mathisinh, hovatenthisinh, cccd, sodienthoai, email, gioitinh, ngaysinh, ngaycap, noicap, matruong, namtotnghiep, tinhthanh, quanhuyen, phuongxa, sonha, diachidaydu, noidangky, manganh, hinhthucdangky, kydutuyen, phuongthucdangky, xephang, lephidangky, tinhtrangthanhtoandangky, tinhtrangdangky,tinhtranghoso,tinhtrangnhaphoc,tinhtrangthanhtoannhaphoc)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaThiSinh());
            st.setString(2, t.getHoVaTenThiSinh());
            st.setString(3, t.getCccd());
            st.setString(4, t.getSoDienThoai());
            st.setString(5, t.getEmail());
            st.setString(6, t.getGioiTinh());
            st.setDate(7, t.getNgaySinh());
            st.setDate(8, t.getNgayCap());
            st.setString(9, t.getNoiCap());
            st.setString(10, t.getMaTruong().getMaTruong());
            st.setString(11, t.getNamTotNghiep());
            st.setString(12, t.getTinhThanh());
            st.setString(13, t.getQuanHuyen());
            st.setString(14, t.getPhuongXa());
            st.setString(15, t.getSoNha());
            st.setString(16, t.getDiaChiDayDu());
            st.setString(17, t.getNoiDangKy());
            st.setString(18, t.getMaNganh().getMaNganh());
            st.setString(19, t.getHinhThucDangKy());
            st.setString(20, t.getKyDuTuyen());
            st.setString(21, t.getPhuongThucDangKy());
            st.setString(22, t.getXepHang());
            st.setString(23, t.getLePhiDangKy());
            st.setString(24, t.getTinhTrangThanhToanDangKy());
            st.setString(25, t.getTinhTrangDangKy());
            st.setString(26, t.getTinhTrangHoSo());
            st.setString(27, t.getTinhTrangNhapHoc());
            st.setString(28, t.getTinhTrangThanhToanNhapHoc());

            ketQua = st.executeUpdate();
            System.out.println("B\u1ea1n \u0111\u00e3 th\u1ef1c thi: " + sql);
            System.out.println("C\u00f3 " + ketQua + " d\u00f2ng b\u1ecb thay \u0111\u1ed5i!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int insertAll(ArrayList<ThiSinh> arr) {
        int dem = 0;
        for (final ThiSinh thiSinh : arr) {
            dem += this.insert(thiSinh);
        }
        return dem;
    }

    public int update(ThiSinh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE thisinh  SET  noisinh=?, quoctich=?, dantoc=?, tongiao=?, hokhauthuongtru=?, xeploaitotnghiep=?, loaihanhkiem=?, loaihocluc=?, anhcccdmattruoc=?, anhcccdmatsau=?, anhschoolrank=?, anhbangdiem11=?, anhbangdiem12=?  WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaThiSinh());
            st.setString(2, t.getNoiSinh());
            st.setString(3, t.getQuocTich());
            st.setString(4, t.getDanToc());
            st.setString(5, t.getTonGiao());
            st.setString(6, t.getHoKhauThuongTru());
            st.setString(7, t.getXepLoaiTotNghiep());
            st.setString(8, t.getLoaiHanhKiem());
            st.setString(9, t.getLoaiHocLuc());
            st.setString(10, t.getAnhCCCDMatTruoc());
            st.setString(11, t.getAnhCCCDMatSau());
            st.setString(12, t.getAnhSchoolRank());
            st.setString(13, t.getAnhBangDiem11());
            st.setString(14, t.getAnhBangDiem12());
            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public boolean kiemTraCCCD(String cccd) {
        boolean ketQua = false;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM thisinh WHERE cccd=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, cccd);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ketQua = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public ThiSinh selectByCCCDAndSDT(ThiSinh t) {
        ThiSinh ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM thisinh WHERE cccd=? and sodienthoai=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getCccd());
            st.setString(2, t.getSoDienThoai());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Truong t1 = new Truong();
                t1.setMaTruong(rs.getString(15));
                Nganh n1 = new Nganh();
                n1.setMaNganh(rs.getString(26));
                Truong t2 = new TruongDAO().getListTruongById(t1);
                Nganh n2 = new NganhDAO().getListNganhById(n1);
                ketQua = new ThiSinh(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), t2, rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), n2, rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30), rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36), rs.getString(37), rs.getString(38), rs.getString(39), rs.getString(40), rs.getString(41));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public int updateThongTinXT(ThiSinh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE thisinh  SET  noisinh=?, quoctich=?, dantoc=?, tongiao=?, hokhauthuongtru=?, xeploaitotnghiep=?, loaihanhkiem=?, loaihocluc=? WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getNoiSinh());
            st.setString(2, t.getQuocTich());
            st.setString(3, t.getDanToc());
            st.setString(4, t.getTonGiao());
            st.setString(5, t.getHoKhauThuongTru());
            st.setString(6, t.getXepLoaiTotNghiep());
            st.setString(7, t.getLoaiHanhKiem());
            st.setString(8, t.getLoaiHocLuc());
            st.setString(9, t.getMaThiSinh());

            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int updateAnhXT(ThiSinh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE thisinh  SET  anhcccdmattruoc=?, anhcccdmatsau=?, anhschoolrank=?, anhbangdiem11=?, anhbangdiem12=? WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getAnhCCCDMatTruoc());
            st.setString(2, t.getAnhCCCDMatSau());
            st.setString(3, t.getAnhSchoolRank());
            st.setString(4, t.getAnhBangDiem11());
            st.setString(5, t.getAnhBangDiem12());
            st.setString(6, t.getMaThiSinh());

            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public ThiSinh selectByMaThiSinh(String t) {
        ThiSinh ketQua = null;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT * FROM thisinh WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Truong t1 = new Truong();
                t1.setMaTruong(rs.getString(15));
                Nganh n1 = new Nganh();
                n1.setMaNganh(rs.getString(26));
                Truong t2 = new TruongDAO().getListTruongById(t1);
                Nganh n2 = new NganhDAO().getListNganhById(n1);
                ketQua = new ThiSinh(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), t2, rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), n2, rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30), rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35), rs.getString(36), rs.getString(37), rs.getString(38), rs.getString(39), rs.getString(40), rs.getString(41));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public int updateThongTinXTForAdmin(ThiSinh t) {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "UPDATE thisinh  SET  hovatenthisinh =?, cccd=?, sodienthoai=?, email=?, gioitinh=?, ngaysinh=?, ngaycap=?, noicap=?, matruong=?, namtotnghiep=?, tinhthanh=?, quanhuyen=?, phuongxa=?, sonha=?, diachidaydu=?, noidangky=?, manganh=?, hinhthucdangky=?, kydutuyen=?, phuongthucdangky=?, xephang=?, lephidangky=?, noisinh=?, quoctich=?, dantoc=?, tongiao=?, hokhauthuongtru=?, xeploaitotnghiep=?, loaihanhkiem=?, loaihocluc=?, tinhtrangthanhtoandangky=?, tinhtrangdangky=?, tinhtranghoso=?, tinhtrangnhaphoc=?, tinhtrangthanhtoannhaphoc=? WHERE mathisinh=?";
            final PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getHoVaTenThiSinh());
            st.setString(2, t.getCccd());
            st.setString(3, t.getSoDienThoai());
            st.setString(4, t.getEmail());
            st.setString(5, t.getGioiTinh());
            st.setDate(6, t.getNgaySinh());
            st.setDate(7, t.getNgayCap());
            st.setString(8, t.getNoiCap());
            st.setString(9, t.getMaTruong().getMaTruong());
            st.setString(10, t.getNamTotNghiep());
            st.setString(11, t.getTinhThanh());
            st.setString(12, t.getQuanHuyen());
            st.setString(13, t.getPhuongXa());
            st.setString(14, t.getSoNha());
            st.setString(15, t.getDiaChiDayDu());
            st.setString(16, t.getNoiDangKy());
            st.setString(17, t.getMaNganh().getMaNganh());
            st.setString(18, t.getHinhThucDangKy());
            st.setString(19, t.getKyDuTuyen());
            st.setString(20, t.getPhuongThucDangKy());
            st.setString(21, t.getXepHang());
            st.setString(22, t.getLePhiDangKy());
            st.setString(23, t.getNoiSinh());
            st.setString(24, t.getQuocTich());
            st.setString(25, t.getDanToc());
            st.setString(26, t.getTonGiao());
            st.setString(27, t.getHoKhauThuongTru());
            st.setString(28, t.getXepLoaiTotNghiep());
            st.setString(29, t.getLoaiHanhKiem());
            st.setString(30, t.getLoaiHocLuc());
            st.setString(31, t.getLoaiHanhKiem());
            st.setString(32, t.getTinhTrangThanhToanDangKy());
            st.setString(33, t.getTinhTrangDangKy());
            st.setString(34, t.getTinhTrangHoSo());
            st.setString(35, t.getTinhTrangNhapHoc());
            st.setString(36, t.getTinhTrangThanhToanNhapHoc());
            st.setString(37, t.getMaThiSinh());
            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int countTS() {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT COUNT(*) FROM  thisinh";
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
    
    public int countNE() {
        int ketQua = 0;
        try {
            final Connection con = JDBCUtil.getConnection();
            final String sql = "SELECT COUNT(*) FROM  thisinh WHERE tinhtrangnhaphoc = N'Đã đăng ký nhập học'";
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
