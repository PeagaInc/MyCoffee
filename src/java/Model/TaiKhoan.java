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
public class TaiKhoan implements Serializable{
    private String tenDangNhap;
    private String matKhau;
    private boolean vaiTro;

    public TaiKhoan() {
    }

    public TaiKhoan(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public TaiKhoan(String tenDangNhap, String matKhau) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
    }

    public TaiKhoan(String tenDangNhap, String matKhau, boolean vaiTro) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.vaiTro = vaiTro;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public boolean isVaiTro() {
        return vaiTro;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public void setVaiTro(boolean vaiTro) {
        this.vaiTro = vaiTro;
    }
}
