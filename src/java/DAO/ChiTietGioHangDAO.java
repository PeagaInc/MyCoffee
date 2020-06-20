/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.Connect;
import Model.ChiTietGioHang;
import Model.GioHang;
import Model.SanPham;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author DieuHuyen
 */
public class ChiTietGioHangDAO {
    private ChiTietGioHang chiTietGioHang;

    public ChiTietGioHangDAO() {
    }

    public ChiTietGioHangDAO(ChiTietGioHang chiTietGioHang) {
        this.chiTietGioHang = chiTietGioHang;
    }

    public ChiTietGioHang getChiTietGioHang() {
        return chiTietGioHang;
    }

    public void setChiTietGioHang(ChiTietGioHang chiTietGioHang) {
        this.chiTietGioHang = chiTietGioHang;
    }
    
    public ArrayList<ChiTietGioHang> layDanhSach(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from CT_GioHang";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<ChiTietGioHang> list = new ArrayList<>();
            while (rs.next()){
                String maGH = rs.getString(1);
                String maSP = rs.getString(2);
                int soLuong = rs.getInt(3);
                list.add(new ChiTietGioHang(maGH, maSP, soLuong));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
    
    public int them(ChiTietGioHang ctgh){
        try {
            Connection con = new Connect().getConnect();
            String sql = "insert into CT_GioHang values(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ctgh.getMaGH());
            ps.setString(2, ctgh.getMaSP());
            ps.setInt(3, ctgh.getSoLuong());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int sua(ChiTietGioHang ctgh){
        try {
            Connection con = new Connect().getConnect();
            String sql = "update CT_GioHang set SoLuong = ? where MaGH = ? and MaSP = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ctgh.getSoLuong());
            ps.setString(2, ctgh.getMaGH());
            ps.setString(3, ctgh.getMaSP());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int xoa(ChiTietGioHang ctgh){
        try {
            Connection con = new Connect().getConnect();
            String sql = "delete from CT_GioHang where MaGH = ? and MaSP = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ctgh.getMaGH());
            ps.setString(2, ctgh.getMaSP());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public ArrayList<GioHang> cbx_GioHang(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from GioHang";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<GioHang> list = new ArrayList<>();
            while (rs.next()){
                String maGH = rs.getString(1);
                list.add(new GioHang(maGH));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
    
    public ArrayList<SanPham> cbx_SanPham(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from SanPham";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<SanPham> list = new ArrayList<>();
            while (rs.next()){
                String maSP = rs.getString(1);
                list.add(new SanPham(maSP));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
}
