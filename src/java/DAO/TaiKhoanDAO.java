/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.Connect;
import Model.TaiKhoan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author DieuHuyen
 */
public class TaiKhoanDAO {
    private TaiKhoan taiKhoan;

    public TaiKhoanDAO() {
    }

    public TaiKhoanDAO(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }
    
    public int checkLogin(TaiKhoan tk){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from TaiKhoan where TenDangNhap = ? and MatKhau = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tk.getTenDangNhap());
            ps.setString(2, tk.getMatKhau());
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return 1;
            else
                return 0;
        } catch (Exception e) {
        }
        return -1;
    }
    
    public ArrayList<TaiKhoan> layDanhSach(){
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from TaiKhoan";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<TaiKhoan> list = new ArrayList<>();
            while (rs.next()){
                String tenDangNhap = rs.getString(1);
                String matKhau = rs.getString(2);
                boolean vaiTro = rs.getBoolean(3);
                list.add(new TaiKhoan(tenDangNhap, matKhau, vaiTro));
            }
            con.close();
            return list;
        } catch (Exception e) {}
        return null;
    }
    
    public int them(TaiKhoan tk){
        try {
            Connection con = new Connect().getConnect();
            String sql = "insert into TaiKhoan values(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tk.getTenDangNhap());
            ps.setString(2, tk.getMatKhau());
            ps.setBoolean(3, tk.isVaiTro());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int sua(TaiKhoan tk){
        try {
            Connection con = new Connect().getConnect();
            String sql = "update TaiKhoan set MatKhau = ?, VaiTro = ? where TenDangNhap = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tk.getMatKhau());
            ps.setBoolean(2, tk.isVaiTro());
            ps.setString(3, tk.getTenDangNhap());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
    
    public int xoa(TaiKhoan tk){
        try {
            Connection con = new Connect().getConnect();
            String sql = "delete from TaiKhoan where TenDangNhap = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tk.getTenDangNhap());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }
}
