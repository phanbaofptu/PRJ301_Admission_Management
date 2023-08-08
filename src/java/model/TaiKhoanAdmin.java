/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Objects;

/**
 *
 * @author phangiabao
 */
public class TaiKhoanAdmin {
    private String maAdmin;
    private String tenDangNhap;
    private String matKhau;
    private String hoVaTen;
    private String emailAdmin;
    private String chucVu;

    public TaiKhoanAdmin() {
    }
    

    public TaiKhoanAdmin(String maAdmin, String tenDangNhap, String matKhau, String hoVaTen, String emailAdmin, String chucVu) {
        this.maAdmin = maAdmin;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.hoVaTen = hoVaTen;
        this.emailAdmin = emailAdmin;
        this.chucVu = chucVu;
    }

    public TaiKhoanAdmin(String maAdmin, String tenDangNhap, String hoVaTen, String emailAdmin, String chucVu) {
        this.maAdmin = maAdmin;
        this.tenDangNhap = tenDangNhap;
        this.hoVaTen = hoVaTen;
        this.emailAdmin = emailAdmin;
        this.chucVu = chucVu;
    }
    
    public String getMaAdmin() {
        return maAdmin;
    }

    public void setMaAdmin(String maAdmin) {
        this.maAdmin = maAdmin;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getEmailAdmin() {
        return emailAdmin;
    }

    public void setEmailAdmin(String emailAdmin) {
        this.emailAdmin = emailAdmin;
    }

    public String getChucVu() {
        return chucVu;
    }

    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
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
        final TaiKhoanAdmin other = (TaiKhoanAdmin) obj;
        return Objects.equals(this.maAdmin, other.maAdmin);
    }

    @Override
    public String toString() {
        String ketQua="";
        if (maAdmin!=null) {
            ketQua=maAdmin;
        }
        if (tenDangNhap!=null) {
            ketQua=tenDangNhap;
        }
        return "" +ketQua;
    }

    

   
    
    
    
}
