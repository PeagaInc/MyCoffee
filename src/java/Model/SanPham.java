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
public class SanPham implements Serializable{
    private String maSP;
    private String tenSP;
    private float gia;
    private String moTa;
    private String hinh;
    private String maLoai;

    public SanPham() {
    }

    public SanPham(String maSP) {
        this.maSP = maSP;
    }

    public SanPham(String maSP, String tenSP, float gia, String hinh) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.gia = gia;
        this.hinh = hinh;
    }

    public SanPham(String maSP, String tenSP, float gia, String moTa, String hinh, String maLoai) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.gia = gia;
        this.moTa = moTa;
        this.hinh = hinh;
        this.maLoai = maLoai;
    }

    public String getMaSP() {
        return maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public float getGia() {
        return gia;
    }
    
    public String getMoTa() {
        return moTa;
    }

    public String getHinh() {
        return hinh;
    }
     
    public String getMaLoai() {
        return maLoai;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public void setHinh(String hinh) {
        this.hinh = hinh;
    }

    public void setMaLoai(String maLoai) {
        this.maLoai = maLoai;
    }
}
