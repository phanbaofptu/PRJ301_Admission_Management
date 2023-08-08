/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.Objects;




/**
 *
 * @author phangiabao
 */
public class ThiSinh {
    private String maThiSinh;
    private String hoVaTenThiSinh;
    private String cccd;
    private String soDienThoai;
    private String email;
    private String gioiTinh;
    private Date ngaySinh;
    private String noiSinh;
    private Date ngayCap;
    private String noiCap;
    private String quocTich;
    private String danToc;
    private String tonGiao;
    private String hoKhauThuongTru;
    private Truong maTruong;
    private String namTotNghiep;
    private String xepLoaiTotNghiep;
    private String loaiHanhKiem;
    private String loaiHocLuc;
    private String tinhThanh;
    private String quanHuyen;
    private String phuongXa;
    private String soNha;
    private String diaChiDayDu;
    private String noiDangKy;
    private Nganh maNganh;
    private String hinhThucDangKy;
    private String kyDuTuyen;
    private String phuongThucDangKy;
    private String xepHang;
    private String anhCCCDMatTruoc;
    private String anhCCCDMatSau;
    private String anhSchoolRank;
    private String anhBangDiem11;
    private String anhBangDiem12;
    private String lePhiDangKy;
    private String tinhTrangThanhToanDangKy;
    private String tinhTrangDangKy;
    private String tinhTrangHoSo;
    private String tinhTrangNhapHoc;
    private String tinhTrangThanhToanNhapHoc;

    public ThiSinh() {
    }

    public ThiSinh(String maThiSinh, String hoVaTenThiSinh, String cccd, String soDienThoai, String email, String gioiTinh, Date ngaySinh, String noiSinh, Date ngayCap, String noiCap, String quocTich, String danToc, String tonGiao, String hoKhauThuongTru, Truong maTruong, String namTotNghiep, String xepLoaiTotNghiep, String loaiHanhKiem, String loaiHocLuc, String tinhThanh, String quanHuyen, String phuongXa, String soNha, String diaChiDayDu, String noiDangKy, Nganh maNganh, String hinhThucDangKy, String kyDuTuyen, String phuongThucDangKy, String xepHang, String anhCCCDMatTruoc, String anhCCCDMatSau, String anhSchoolRank, String anhBangDiem11, String anhBangDiem12, String lePhiDangKy, String tinhTrangThanhToanDangKy, String tinhTrangDangKy, String tinhTrangHoSo, String tinhTrangNhapHoc, String tinhTrangThanhToanNhapHoc) {
        this.maThiSinh = maThiSinh;
        this.hoVaTenThiSinh = hoVaTenThiSinh;
        this.cccd = cccd;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.noiSinh = noiSinh;
        this.ngayCap = ngayCap;
        this.noiCap = noiCap;
        this.quocTich = quocTich;
        this.danToc = danToc;
        this.tonGiao = tonGiao;
        this.hoKhauThuongTru = hoKhauThuongTru;
        this.maTruong = maTruong;
        this.namTotNghiep = namTotNghiep;
        this.xepLoaiTotNghiep = xepLoaiTotNghiep;
        this.loaiHanhKiem = loaiHanhKiem;
        this.loaiHocLuc = loaiHocLuc;
        this.tinhThanh = tinhThanh;
        this.quanHuyen = quanHuyen;
        this.phuongXa = phuongXa;
        this.soNha = soNha;
        this.diaChiDayDu = diaChiDayDu;
        this.noiDangKy = noiDangKy;
        this.maNganh = maNganh;
        this.hinhThucDangKy = hinhThucDangKy;
        this.kyDuTuyen = kyDuTuyen;
        this.phuongThucDangKy = phuongThucDangKy;
        this.xepHang = xepHang;
        this.anhCCCDMatTruoc = anhCCCDMatTruoc;
        this.anhCCCDMatSau = anhCCCDMatSau;
        this.anhSchoolRank = anhSchoolRank;
        this.anhBangDiem11 = anhBangDiem11;
        this.anhBangDiem12 = anhBangDiem12;
        this.lePhiDangKy = lePhiDangKy;
        this.tinhTrangThanhToanDangKy = tinhTrangThanhToanDangKy;
        this.tinhTrangDangKy = tinhTrangDangKy;
        this.tinhTrangHoSo = tinhTrangHoSo;
        this.tinhTrangNhapHoc = tinhTrangNhapHoc;
        this.tinhTrangThanhToanNhapHoc = tinhTrangThanhToanNhapHoc;
    }
    public ThiSinh(String maThiSinh, String hoVaTenThiSinh, String cccd, String soDienThoai, String email, String gioiTinh, Date ngaySinh, String noiSinh, Date ngayCap, String noiCap, String quocTich, String danToc, String tonGiao, String hoKhauThuongTru, Truong maTruong, String namTotNghiep, String xepLoaiTotNghiep, String loaiHanhKiem, String loaiHocLuc, String tinhThanh, String quanHuyen, String phuongXa, String soNha, String diaChiDayDu, String noiDangKy, Nganh maNganh, String hinhThucDangKy, String kyDuTuyen, String phuongThucDangKy, String xepHang, String lePhiDangKy, String tinhTrangThanhToanDangKy, String tinhTrangDangKy, String tinhTrangHoSo, String tinhTrangNhapHoc, String tinhTrangThanhToanNhapHoc) {
        this.maThiSinh = maThiSinh;
        this.hoVaTenThiSinh = hoVaTenThiSinh;
        this.cccd = cccd;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.noiSinh = noiSinh;
        this.ngayCap = ngayCap;
        this.noiCap = noiCap;
        this.quocTich = quocTich;
        this.danToc = danToc;
        this.tonGiao = tonGiao;
        this.hoKhauThuongTru = hoKhauThuongTru;
        this.maTruong = maTruong;
        this.namTotNghiep = namTotNghiep;
        this.xepLoaiTotNghiep = xepLoaiTotNghiep;
        this.loaiHanhKiem = loaiHanhKiem;
        this.loaiHocLuc = loaiHocLuc;
        this.tinhThanh = tinhThanh;
        this.quanHuyen = quanHuyen;
        this.phuongXa = phuongXa;
        this.soNha = soNha;
        this.diaChiDayDu = diaChiDayDu;
        this.noiDangKy = noiDangKy;
        this.maNganh = maNganh;
        this.hinhThucDangKy = hinhThucDangKy;
        this.kyDuTuyen = kyDuTuyen;
        this.phuongThucDangKy = phuongThucDangKy;
        this.xepHang = xepHang;
        this.lePhiDangKy = lePhiDangKy;
        this.tinhTrangThanhToanDangKy = tinhTrangThanhToanDangKy;
        this.tinhTrangDangKy = tinhTrangDangKy;
        this.tinhTrangHoSo = tinhTrangHoSo;
        this.tinhTrangNhapHoc = tinhTrangNhapHoc;
        this.tinhTrangThanhToanNhapHoc = tinhTrangThanhToanNhapHoc;
    }

    public ThiSinh(String maThiSinh, String hoVaTenThiSinh, String cccd, String soDienThoai, String email, String gioiTinh, Date ngaySinh, Date ngayCap, String noiCap, Truong maTruong, String namTotNghiep, String tinhThanh, String quanHuyen, String phuongXa, String soNha, String diaChiDayDu, String noiDangKy, Nganh maNganh, String hinhThucDangKy, String kyDuTuyen, String phuongThucDangKy, String xepHang, String lePhiDangKy,String tinhTrangThanhToanDangKy, String tinhTrangDangKy, String tinhTrangHoSo, String tinhTrangNhapHoc, String tinhTrangThanhToanNhapHoc) {
        this.maThiSinh = maThiSinh;
        this.hoVaTenThiSinh = hoVaTenThiSinh;
        this.cccd = cccd;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.ngayCap = ngayCap;
        this.noiCap = noiCap;
        this.maTruong = maTruong;
        this.namTotNghiep = namTotNghiep;
        this.tinhThanh = tinhThanh;
        this.quanHuyen = quanHuyen;
        this.phuongXa = phuongXa;
        this.soNha = soNha;
        this.diaChiDayDu = diaChiDayDu;
        this.noiDangKy = noiDangKy;
        this.maNganh = maNganh;
        this.hinhThucDangKy = hinhThucDangKy;
        this.kyDuTuyen = kyDuTuyen;
        this.phuongThucDangKy = phuongThucDangKy;
        this.xepHang = xepHang;
        this.lePhiDangKy = lePhiDangKy;
        this.tinhTrangThanhToanDangKy = tinhTrangThanhToanDangKy;
        this.tinhTrangDangKy = tinhTrangDangKy;
        this.tinhTrangHoSo = tinhTrangHoSo;
        this.tinhTrangNhapHoc = tinhTrangNhapHoc;
        this.tinhTrangThanhToanNhapHoc = tinhTrangThanhToanNhapHoc;
    }

    public ThiSinh(String maThiSinh, String noiSinh, String quocTich, String danToc, String tonGiao, String hoKhauThuongTru, String xepLoaiTotNghiep, String loaiHanhKiem, String loaiHocLuc) {
        this.maThiSinh = maThiSinh;
        this.noiSinh = noiSinh;
        this.quocTich = quocTich;
        this.danToc = danToc;
        this.tonGiao = tonGiao;
        this.hoKhauThuongTru = hoKhauThuongTru;
        this.xepLoaiTotNghiep = xepLoaiTotNghiep;
        this.loaiHanhKiem = loaiHanhKiem;
        this.loaiHocLuc = loaiHocLuc;
    }

    public ThiSinh(String maThiSinh, String anhCCCDMatTruoc, String anhCCCDMatSau, String anhSchoolRank, String anhBangDiem11, String anhBangDiem12) {
        this.maThiSinh = maThiSinh;
        this.anhCCCDMatTruoc = anhCCCDMatTruoc;
        this.anhCCCDMatSau = anhCCCDMatSau;
        this.anhSchoolRank = anhSchoolRank;
        this.anhBangDiem11 = anhBangDiem11;
        this.anhBangDiem12 = anhBangDiem12;
    }
    

    
    
    
    
    
    
    

    public String getMaThiSinh() {
        return maThiSinh;
    }

    public void setMaThiSinh(String maThiSinh) {
        this.maThiSinh = maThiSinh;
    }

    public String getHoVaTenThiSinh() {
        return hoVaTenThiSinh;
    }

    public void setHoVaTenThiSinh(String hoVaTenThiSinh) {
        this.hoVaTenThiSinh = hoVaTenThiSinh;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getNoiSinh() {
        return noiSinh;
    }

    public void setNoiSinh(String noiSinh) {
        this.noiSinh = noiSinh;
    }

    public Date getNgayCap() {
        return ngayCap;
    }

    public void setNgayCap(Date ngayCap) {
        this.ngayCap = ngayCap;
    }

    public String getNoiCap() {
        return noiCap;
    }

    public void setNoiCap(String noiCap) {
        this.noiCap = noiCap;
    }

    public String getQuocTich() {
        return quocTich;
    }

    public void setQuocTich(String quocTich) {
        this.quocTich = quocTich;
    }

    public String getDanToc() {
        return danToc;
    }

    public void setDanToc(String danToc) {
        this.danToc = danToc;
    }

    public String getTonGiao() {
        return tonGiao;
    }

    public void setTonGiao(String tonGiao) {
        this.tonGiao = tonGiao;
    }

    public String getHoKhauThuongTru() {
        return hoKhauThuongTru;
    }

    public void setHoKhauThuongTru(String hoKhauThuongTru) {
        this.hoKhauThuongTru = hoKhauThuongTru;
    }

    public Truong getMaTruong() {
        return maTruong;
    }

    public void setMaTruong(Truong maTruong) {
        this.maTruong = maTruong;
    }

    public String getNamTotNghiep() {
        return namTotNghiep;
    }

    public void setNamTotNghiep(String namTotNghiep) {
        this.namTotNghiep = namTotNghiep;
    }

    public String getXepLoaiTotNghiep() {
        return xepLoaiTotNghiep;
    }

    public void setXepLoaiTotNghiep(String xepLoaiTotNghiep) {
        this.xepLoaiTotNghiep = xepLoaiTotNghiep;
    }

    public String getLoaiHanhKiem() {
        return loaiHanhKiem;
    }

    public void setLoaiHanhKiem(String loaiHanhKiem) {
        this.loaiHanhKiem = loaiHanhKiem;
    }

    public String getLoaiHocLuc() {
        return loaiHocLuc;
    }

    public void setLoaiHocLuc(String loaiHocLuc) {
        this.loaiHocLuc = loaiHocLuc;
    }

    public String getTinhThanh() {
        return tinhThanh;
    }

    public void setTinhThanh(String tinhThanh) {
        this.tinhThanh = tinhThanh;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public void setQuanHuyen(String quanHuyen) {
        this.quanHuyen = quanHuyen;
    }

    public String getPhuongXa() {
        return phuongXa;
    }

    public void setPhuongXa(String phuongXa) {
        this.phuongXa = phuongXa;
    }

    public String getSoNha() {
        return soNha;
    }

    public void setSoNha(String soNha) {
        this.soNha = soNha;
    }

    public String getDiaChiDayDu() {
        return diaChiDayDu;
    }

    public void setDiaChiDayDu(String diaChiDayDu) {
        this.diaChiDayDu = diaChiDayDu;
    }

    public String getNoiDangKy() {
        return noiDangKy;
    }

    public void setNoiDangKy(String noiDangKy) {
        this.noiDangKy = noiDangKy;
    }

    public Nganh getMaNganh() {
        return maNganh;
    }

    public void setMaNganh(Nganh maNganh) {
        this.maNganh = maNganh;
    }

    public String getHinhThucDangKy() {
        return hinhThucDangKy;
    }

    public void setHinhThucDangKy(String hinhThucDangKy) {
        this.hinhThucDangKy = hinhThucDangKy;
    }

    public String getKyDuTuyen() {
        return kyDuTuyen;
    }

    public void setKyDuTuyen(String kyDuTuyen) {
        this.kyDuTuyen = kyDuTuyen;
    }

    public String getPhuongThucDangKy() {
        return phuongThucDangKy;
    }

    public void setPhuongThucDangKy(String phuongThucDangKy) {
        this.phuongThucDangKy = phuongThucDangKy;
    }

    public String getXepHang() {
        return xepHang;
    }

    public void setXepHang(String xepHang) {
        this.xepHang = xepHang;
    }

    public String getAnhCCCDMatTruoc() {
        return anhCCCDMatTruoc;
    }

    public void setAnhCCCDMatTruoc(String anhCCCDMatTruoc) {
        this.anhCCCDMatTruoc = anhCCCDMatTruoc;
    }

    public String getAnhCCCDMatSau() {
        return anhCCCDMatSau;
    }

    public void setAnhCCCDMatSau(String anhCCCDMatSau) {
        this.anhCCCDMatSau = anhCCCDMatSau;
    }

    public String getAnhSchoolRank() {
        return anhSchoolRank;
    }

    public void setAnhSchoolRank(String anhSchoolRank) {
        this.anhSchoolRank = anhSchoolRank;
    }

    public String getAnhBangDiem11() {
        return anhBangDiem11;
    }

    public void setAnhBangDiem11(String anhBangDiem11) {
        this.anhBangDiem11 = anhBangDiem11;
    }

    public String getAnhBangDiem12() {
        return anhBangDiem12;
    }

    public void setAnhBangDiem12(String anhBangDiem12) {
        this.anhBangDiem12 = anhBangDiem12;
    }

    public String getLePhiDangKy() {
        return lePhiDangKy;
    }

    public void setLePhiDangKy(String lePhiDangKy) {
        this.lePhiDangKy = lePhiDangKy;
    }

    public String getTinhTrangThanhToanDangKy() {
        return tinhTrangThanhToanDangKy;
    }

    public void setTinhTrangThanhToanDangKy(String tinhTrangThanhToanDangKy) {
        this.tinhTrangThanhToanDangKy = tinhTrangThanhToanDangKy;
    }

    public String getTinhTrangDangKy() {
        return tinhTrangDangKy;
    }

    public void setTinhTrangDangKy(String tinhTrangDangKy) {
        this.tinhTrangDangKy = tinhTrangDangKy;
    }

    public String getTinhTrangHoSo() {
        return tinhTrangHoSo;
    }

    public void setTinhTrangHoSo(String tinhTrangHoSo) {
        this.tinhTrangHoSo = tinhTrangHoSo;
    }

    public String getTinhTrangNhapHoc() {
        return tinhTrangNhapHoc;
    }

    public void setTinhTrangNhapHoc(String tinhTrangNhapHoc) {
        this.tinhTrangNhapHoc = tinhTrangNhapHoc;
    }

    public String getTinhTrangThanhToanNhapHoc() {
        return tinhTrangThanhToanNhapHoc;
    }

    public void setTinhTrangThanhToanNhapHoc(String tinhTrangThanhToanNhapHoc) {
        this.tinhTrangThanhToanNhapHoc = tinhTrangThanhToanNhapHoc;
    }
    
    

    

    

    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ThiSinh other = (ThiSinh) obj;
        return Objects.equals(this.maThiSinh, other.maThiSinh);
    }
    
    
}
