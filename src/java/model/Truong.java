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
public class Truong {
    private String maTruong;
    private String tenTruong;
    private String tinhTruong;
    private String huyenTruong;
    private String khuVuc;

    public Truong() {
    }

    public Truong(String maTruong, String tenTruong, String tinhTruong, String huyenTruong, String khuVuc) {
        this.maTruong = maTruong;
        this.tenTruong = tenTruong;
        this.tinhTruong = tinhTruong;
        this.huyenTruong = huyenTruong;
        this.khuVuc = khuVuc;
    }

    public String getMaTruong() {
        return maTruong;
    }

    public void setMaTruong(String maTruong) {
        this.maTruong = maTruong;
    }

    public String getTenTruong() {
        return tenTruong;
    }

    public void setTenTruong(String tenTruong) {
        this.tenTruong = tenTruong;
    }

    public String getTinhTruong() {
        return tinhTruong;
    }

    public void setTinhTruong(String tinhTruong) {
        this.tinhTruong = tinhTruong;
    }

    public String getHuyenTruong() {
        return huyenTruong;
    }

    public void setHuyenTruong(String huyenTruong) {
        this.huyenTruong = huyenTruong;
    }

    public String getKhuVuc() {
        return khuVuc;
    }

    public void setKhuVuc(String khuVuc) {
        this.khuVuc = khuVuc;
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
        final Truong other = (Truong) obj;
        return Objects.equals(this.maTruong, other.maTruong);
    }

    @Override
    public String toString() {
        return tenTruong;
    }
    
    
    
    
}
