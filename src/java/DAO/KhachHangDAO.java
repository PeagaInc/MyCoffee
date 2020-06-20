/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.Connect;
import Model.KhachHang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author DieuHuyen
 */
public class KhachHangDAO {

    private KhachHang khachHang;

    public KhachHangDAO() {
    }

    public KhachHangDAO(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public ArrayList<KhachHang> layDanhSach() {
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from KhachHang";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<KhachHang> list = new ArrayList<>();
            while (rs.next()) {
                int maKH = rs.getInt(1);
                String matKhau = rs.getString(2);
                String HoTen = rs.getString(3);
                String soST = rs.getString(4);
                String Email = rs.getString(5);
                String diaChi = rs.getString(6);
                list.add(new KhachHang(maKH, matKhau, HoTen, soST, Email, diaChi));
            }
            con.close();
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int them(KhachHang kh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "insert into KhachHang values(?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getMatKhau());
            ps.setString(2, kh.getHoTen());
            ps.setString(3, kh.getSoDT());
            ps.setString(4, kh.getEmail());
            ps.setString(5, kh.getDiaChi());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int sua(KhachHang kh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "update KhachHang set MatKhau = ?, Hoten = ?, SoDT = ?, Email = ?, DiaCHi = ? where MaKH = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getMatKhau());
            ps.setString(2, kh.getHoTen());
            ps.setString(3, kh.getSoDT());
            ps.setString(4, kh.getEmail());
            ps.setString(5, kh.getDiaChi());
            ps.setInt(6, kh.getMaKH());
            return ps.executeUpdate();
        } catch (Exception e) {}
        return 0;
    }

    public int xoa(KhachHang kh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "delete from KhachHang where MaKH = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, kh.getMaKH());
            return ps.executeUpdate();
        } catch (Exception e) {e.printStackTrace();}
        return 0;
    }

    public int checkLogin(KhachHang kh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from KhachHang where SoDT = ? and MatKhau = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getSoDT());
            ps.setString(2, kh.getMatKhau());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {}
        return -1;
    }

    public KhachHang getTTKH(KhachHang kh) {
        KhachHang kk = new KhachHang();
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from KhachHang where SoDT = ? and MatKhau = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getSoDT());
            ps.setString(2, kh.getMatKhau());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                kk.setMaKH(rs.getInt(1));
                kk.setMatKhau(rs.getString(2));
                kk.setHoTen(rs.getString(3));
                kk.setSoDT(rs.getString(4));
                kk.setEmail(rs.getString(5));
                kk.setDiaChi(rs.getString(6));
            }
            return kk;
        } catch (Exception e) {
        }
        return null;
    }

    //0 la mac dinh
    //1 la co ton tai
    //2 la khong ton tai
    public int kiemKH(KhachHang kh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from KhachHang where SoDT = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getSoDT());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return 1;
            } else {
                return 2;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int taoMaKH(KhachHang kh) {
        int maKH = 0;
        try {
            Connection con = new Connect().getConnect();
            String sql = "select MaKH from KhachHang where MatKhau = ? and HoTen = ? and SoDT = ? and Email = ? and DiaChi = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, kh.getMatKhau());
            ps.setString(2, kh.getHoTen());
            ps.setString(3, kh.getSoDT());
            ps.setString(4, kh.getEmail());
            ps.setString(5, kh.getDiaChi());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                maKH = rs.getInt(1);
            }
        } catch (Exception e) {}
        return maKH;
    }
}
