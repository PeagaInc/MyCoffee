/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.TheLoai;
import java.sql.Connection;
import java.util.ArrayList;
import Connect.Connect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author DieuHuyen
 */
public class TheLoaiDAO {
    private TheLoai theLoai;

    public TheLoaiDAO() {
    }

    public TheLoaiDAO(TheLoai theLoai) {
        this.theLoai = theLoai;
    }

    public TheLoai getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(TheLoai theLoai) {
        this.theLoai = theLoai;
    }
    
    public ArrayList<TheLoai> layDanhSach(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from TheLoai";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<TheLoai> list = new ArrayList<TheLoai>();
            while (rs.next()){
                list.add(new TheLoai(rs.getString(1), rs.getString(2)));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
    
    public int them(TheLoai tl){
        try {
            Connection con = new Connect().getConnect();
            String sql = "insert into TheLoai values(?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tl.getMaLoai());
            ps.setString(2, tl.getTenLoai());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int sua(TheLoai tl){
        try {
            Connection con = new Connect().getConnect();
            String sql = "update TheLoai set TenLoai = ? where MaLoai = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tl.getTenLoai());
            ps.setString(2, tl.getMaLoai());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int xoa(TheLoai tl){
        try {
            Connection con = new Connect().getConnect();
            String sql = "delete from TheLoai where MaLoai = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tl.getMaLoai());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
}
