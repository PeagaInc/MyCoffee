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
public class GioHang implements Serializable{
    private String maGH;
    private int maKH;
    private String ngayLap;

    public GioHang() {
    }

    public GioHang(String maGH) {
        this.maGH = maGH;
    }

    public GioHang(String maGH, int maKH, String ngayLap) {
        this.maGH = maGH;
        this.maKH = maKH;
        this.ngayLap = ngayLap;
    }

    public String getMaGH() {
        return maGH;
    }

    public int getMaKH() {
        return maKH;
    }

    public String getNgayLap() {
        return ngayLap;
    }

    public void setMaGH(String maGH) {
        this.maGH = maGH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public void setNgayLap(String ngayLap) {
        this.ngayLap = ngayLap;
    }
}
