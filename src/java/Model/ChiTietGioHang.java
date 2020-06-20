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
public class ChiTietGioHang implements Serializable{
    private String maGH;
    private String maSP;
    private int soLuong;

    public ChiTietGioHang() {
    }

    public ChiTietGioHang(String maGH) {
        this.maGH = maGH;
    }

    public ChiTietGioHang(String maGH, String maSP) {
        this.maGH = maGH;
        this.maSP = maSP;
    }

    public ChiTietGioHang(String maGH, String maSP, int soLuong) {
        this.maGH = maGH;
        this.maSP = maSP;
        this.soLuong = soLuong;
    }

    public String getMaGH() {
        return maGH;
    }

    public String getMaSP() {
        return maSP;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setMaGH(String maGH) {
        this.maGH = maGH;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
}
