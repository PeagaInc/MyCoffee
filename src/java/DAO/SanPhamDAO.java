/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.Connect;
import Model.SanPham;
import Model.TheLoai;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author DieuHuyen
 */
public class SanPhamDAO {
    private SanPham sanPham;

    public SanPhamDAO() {
    }

    public SanPhamDAO(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }
    
    public ArrayList<SanPham> layDanhSach(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from SanPham";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<SanPham> list = new ArrayList<>();
            while (rs.next()){
                String maSP = rs.getString(1);
                String tenSP = rs.getString(2);
                float gia =  rs.getFloat(3);
                String moTa = rs.getString(4);
                String hinh = rs.getString(5);
                String maLoai = rs.getString(6);
                list.add(new SanPham(maSP, tenSP, gia, moTa, hinh, maLoai));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
    
    public ArrayList<SanPham> loadSP(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select MaSP, TenSP, Gia, MoTa, Hinh, TenLoai from SanPham, TheLoai where SanPham.MaLoai = TheLoai.MaLoai";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<SanPham> list = new ArrayList<>();
            while (rs.next()){
                String maSP = rs.getString(1);
                String tenSP = rs.getString(2);
                float gia =  rs.getFloat(3);
                String moTa = rs.getString(4);
                String hinh = rs.getString(5);
                String maLoai = rs.getString(6);
                list.add(new SanPham(maSP, tenSP, gia, moTa, hinh, maLoai));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
    
    public int them(SanPham sp){
        try {
            Connection con = new Connect().getConnect();
            String sql = "insert into SanPham values(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sp.getMaSP());
            ps.setString(2, sp.getTenSP());
            ps.setFloat(3, sp.getGia());
            ps.setString(4, sp.getMoTa());
            ps.setString(5, sp.getHinh());
            ps.setString(6, sp.getMaLoai());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int sua(SanPham sp){
        try {
            Connection con = new Connect().getConnect();
            String sql = "update SanPham set TenSP = ?, Gia = ?, Mota = ?, Hinh = ?, MaLoai = ? where MaSP = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sp.getTenSP());
            ps.setFloat(2, sp.getGia());
            ps.setString(3, sp.getMoTa());
            ps.setString(4, sp.getHinh());
            ps.setString(5, sp.getMaLoai());
            ps.setString(6, sp.getMaSP());
            return ps.executeUpdate();
        } catch (Exception e) {e.printStackTrace();}
        return 0;
    }
    
    public int xoa(SanPham sp){
        try {
            Connection con = new Connect().getConnect();
            String sql = "delete from SanPham where MaSP = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sp.getMaSP());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public ArrayList<TheLoai> cbx_MaLoai(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from TheLoai";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<TheLoai> list = new ArrayList<>();
            while (rs.next()){
                String maLoai = rs.getString(1);
                list.add(new TheLoai(maLoai));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
}
