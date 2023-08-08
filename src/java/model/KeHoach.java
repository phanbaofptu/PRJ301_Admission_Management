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
public class KeHoach {
    private String maKeHoach;
    private String hocKy;
    private String tenKeHoach;
    private String hinhThuc;
    private String moTaKeHoach;
    private String fileKeHoach;
    private String nhanXet;
    private String trangThai;
    private TaiKhoanAdmin nguoiSoan;
    private TaiKhoanAdmin nguoiDuyet;
    private Date ngayTao;
    private Date ngayDuyet;

    public KeHoach() {
    }

    public KeHoach(String maKeHoach, String hocKy, String tenKeHoach, String hinhThuc, String moTaKeHoach, String fileKeHoach, String nhanXet, String trangThai, TaiKhoanAdmin nguoiSoan, TaiKhoanAdmin nguoiDuyet, Date ngayTao, Date ngayDuyet) {
        this.maKeHoach = maKeHoach;
        this.hocKy = hocKy;
        this.tenKeHoach = tenKeHoach;
        this.hinhThuc = hinhThuc;
        this.moTaKeHoach = moTaKeHoach;
        this.fileKeHoach = fileKeHoach;
        this.nhanXet = nhanXet;
        this.trangThai = trangThai;
        this.nguoiSoan = nguoiSoan;
        this.nguoiDuyet = nguoiDuyet;
        this.ngayTao = ngayTao;
        this.ngayDuyet = ngayDuyet;
    }

    public KeHoach(String maKeHoach, String hocKy, String tenKeHoach, String hinhThuc, String moTaKeHoach, String fileKeHoach, String trangThai, TaiKhoanAdmin nguoiSoan, TaiKhoanAdmin nguoiDuyet, Date ngayTao) {
        this.maKeHoach = maKeHoach;
        this.hocKy = hocKy;
        this.tenKeHoach = tenKeHoach;
        this.hinhThuc = hinhThuc;
        this.moTaKeHoach = moTaKeHoach;
        this.fileKeHoach = fileKeHoach;
        this.trangThai = trangThai;
        this.nguoiSoan = nguoiSoan;
        this.nguoiDuyet = nguoiDuyet;
        this.ngayTao = ngayTao;
    }

    public KeHoach(String maKeHoach, String hocKy, String tenKeHoach, String hinhThuc, String moTaKeHoach) {
        this.maKeHoach = maKeHoach;
        this.hocKy = hocKy;
        this.tenKeHoach = tenKeHoach;
        this.hinhThuc = hinhThuc;
        this.moTaKeHoach = moTaKeHoach;
    }
    

    public KeHoach(String nhanXet, String trangThai, TaiKhoanAdmin nguoiDuyet, Date ngayDuyet) {
        this.nhanXet = nhanXet;
        this.trangThai = trangThai;
        this.nguoiDuyet = nguoiDuyet;
        this.ngayDuyet = ngayDuyet;
    }

    public String getMaKeHoach() {
        return maKeHoach;
    }

    public void setMaKeHoach(String maKeHoach) {
        this.maKeHoach = maKeHoach;
    }

    public String getHocKy() {
        return hocKy;
    }

    public void setHocKy(String hocKy) {
        this.hocKy = hocKy;
    }

    public String getTenKeHoach() {
        return tenKeHoach;
    }

    public void setTenKeHoach(String tenKeHoach) {
        this.tenKeHoach = tenKeHoach;
    }

    public String getHinhThuc() {
        return hinhThuc;
    }

    public void setHinhThuc(String hinhThuc) {
        this.hinhThuc = hinhThuc;
    }

    public String getMoTaKeHoach() {
        return moTaKeHoach;
    }

    public void setMoTaKeHoach(String moTaKeHoach) {
        this.moTaKeHoach = moTaKeHoach;
    }

    public String getFileKeHoach() {
        return fileKeHoach;
    }

    public void setFileKeHoach(String fileKeHoach) {
        this.fileKeHoach = fileKeHoach;
    }

    public String getNhanXet() {
        return nhanXet;
    }

    public void setNhanXet(String nhanXet) {
        this.nhanXet = nhanXet;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public TaiKhoanAdmin getNguoiSoan() {
        return nguoiSoan;
    }

    public void setNguoiSoan(TaiKhoanAdmin nguoiSoan) {
        this.nguoiSoan = nguoiSoan;
    }

    public TaiKhoanAdmin getNguoiDuyet() {
        return nguoiDuyet;
    }

    public void setNguoiDuyet(TaiKhoanAdmin nguoiDuyet) {
        this.nguoiDuyet = nguoiDuyet;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Date getNgayDuyet() {
        return ngayDuyet;
    }

    public void setNgayDuyet(Date ngayDuyet) {
        this.ngayDuyet = ngayDuyet;
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
        final KeHoach other = (KeHoach) obj;
        return Objects.equals(this.maKeHoach, other.maKeHoach);
    }

//    @Override
//    public String toString() {
//        return maKeHoach;
//    }

    @Override
    public String toString() {
        return "KeHoach{" + "maKeHoach=" + maKeHoach + ", hocKy=" + hocKy + ", tenKeHoach=" + tenKeHoach + ", hinhThuc=" + hinhThuc + ", moTaKeHoach=" + moTaKeHoach + ", fileKeHoach=" + fileKeHoach + ", nhanXet=" + nhanXet + ", trangThai=" + trangThai + ", nguoiSoan=" + nguoiSoan + ", nguoiDuyet=" + nguoiDuyet + ", ngayTao=" + ngayTao + ", ngayDuyet=" + ngayDuyet + '}';
    }

    
    
    
    
    
}
