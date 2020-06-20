/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import Model.SanPham;
import java.io.Serializable;

/**
 *
 * @author DieuHuyen
 */
public class SanPhamDTO implements Serializable{
    private SanPham sanPham;
    private int soLuong;

    public SanPhamDTO() {
    }

    public SanPhamDTO(SanPham sanPham) {
        this.sanPham = sanPham;
        this.soLuong = 1;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
}
