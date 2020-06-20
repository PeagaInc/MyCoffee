/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.Connect;
import Model.GioHang;
import Model.KhachHang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author DieuHuyen
 */
public class GioHangDAO {

    private GioHang gioHang;

    public GioHangDAO() {
    }

    public GioHangDAO(GioHang gioHang) {
        this.gioHang = gioHang;
    }

    public GioHang getGioHang() {
        return gioHang;
    }

    public void setGioHang(GioHang gioHang) {
        this.gioHang = gioHang;
    }

    public ArrayList<GioHang> layDanhSach() {
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from GioHang";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<GioHang> list = new ArrayList<>();
            while (rs.next()) {
                String maGH = rs.getString(1);
                int maKH = rs.getInt(2);
                String NgayLap = rs.getString(3);
                list.add(new GioHang(maGH, maKH, NgayLap));
            }
            con.close();
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int them(GioHang gh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "set dateformat MDY insert into GioHang values(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, gh.getMaGH());
            ps.setInt(2, gh.getMaKH());
            ps.setString(3, gh.getNgayLap());
            return ps.executeUpdate();
        } catch (Exception e) {
        }
        return 0;
    }

    public int sua(GioHang gh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "update GioHang set MaKH = ?, NgayLap = ? where MaGH = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, gh.getMaKH());
            ps.setString(2, gh.getNgayLap());
            ps.setString(3, gh.getMaGH());
            return ps.executeUpdate();
        } catch (Exception e) {
        }
        return 0;
    }

    public int xoa(GioHang gh) {
        try {
            Connection con = new Connect().getConnect();
            String sql = "delete from GioHang where MaGH = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, gh.getMaGH());
            return ps.executeUpdate();
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<KhachHang> cbx_KhachHang() {
        try {
            Connection con = new Connect().getConnect();
            String sql = "select * from KhachHang";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ArrayList<KhachHang> list = new ArrayList<>();
            while (rs.next()) {
                int maKH = rs.getInt(1);
                list.add(new KhachHang(maKH));
            }
            con.close();
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public String taoMaGH() {
        String ma = "";
        try {
            Random rd = new Random();
            while (true) {
                int so = 10 + rd.nextInt(999);
                ma = "GH" + so;
                GioHang gh = new GioHang(ma);
                Connection con = new Connect().getConnect();
                String sql = "select * from GioHang where MaGH = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, gh.getMaGH());
                int r = ps.executeUpdate();
                while (r > 0) {
                    so = rd.nextInt();
                }
                while(r == 0){
                    break;
                }
            }
        } catch (Exception e) {}
        return ma;
    }
}
