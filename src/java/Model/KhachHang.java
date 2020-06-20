/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author DieuHuyen
 */
public class KhachHang implements Serializable{
    private int maKH;
    private String matKhau;
    private String hoTen;
    private String soDT;
    private String email;
    private String diaChi;

    public KhachHang() {
    }

    public KhachHang(int maKH) {
        this.maKH = maKH;
    }

    public KhachHang(String soDT) {
        this.soDT = soDT;
    }

    public KhachHang(String soDT, String matKhau) {
        this.soDT = soDT;
        this.matKhau = matKhau;
    }

    public KhachHang(String matKhau, String hoTen, String soDT, String email, String diaChi) {
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.soDT = soDT;
        this.email = email;
        this.diaChi = diaChi;
    }

    
    public KhachHang(int maKH, String matKhau, String hoTen, String soDT, String email, String diaChi) {
        this.maKH = maKH;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.soDT = soDT;
        this.email = email;
        this.diaChi = diaChi;
    }

    public int getMaKH() {
        return maKH;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public String getHoTen() {
        return hoTen;
    }

    public String getSoDT() {
        return soDT;
    }

    public String getEmail() {
        return email;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
}
