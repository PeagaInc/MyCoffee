/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import Model.SanPham;
import java.util.HashMap;

/**
 *
 * @author DieuHuyen
 */
public class CartBean extends HashMap<String, SanPhamDTO>{
    public void themSP(SanPhamDTO sp){
        String ma = sp.getSanPham().getMaSP();
        if(this.containsKey(ma)){
            int soLuongCu = ((SanPhamDTO)this.get(ma)).getSoLuong();
            ((SanPhamDTO)this.get(ma)).setSoLuong(soLuongCu + 1);
        }else{
            this.put(sp.getSanPham().getMaSP(), sp);
        }
    }
    
    public void xoaSL(SanPhamDTO sp){
        String ma = sp.getSanPham().getMaSP();
        if(this.containsKey(ma)){
            int soLuongCu = ((SanPhamDTO)this.get(ma)).getSoLuong();
            ((SanPhamDTO)this.get(ma)).setSoLuong(soLuongCu - 1);
        }
    }
    
    public boolean xoaSP(SanPham sp){
        String ma = sp.getMaSP();
        if (this.containsKey(ma)){
            this.remove(ma);
            return true;
        }
        return false;
    }
    
    public CartBean() {
        super();
    }
}
