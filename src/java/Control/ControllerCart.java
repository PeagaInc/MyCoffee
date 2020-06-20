/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Cart.CartBean;
import Cart.SanPhamDTO;
import DAO.ChiTietGioHangDAO;
import DAO.GioHangDAO;
import DAO.KhachHangDAO;
import Model.ChiTietGioHang;
import Model.GioHang;
import Model.KhachHang;
import Model.SanPham;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DieuHuyen
 */
public class ControllerCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter("action");
            HttpSession session = request.getSession(true);
            CartBean shop = (CartBean) session.getAttribute("SHOP");
            if (action.equals("add to cart")) {
                if (shop == null) {
                    shop = new CartBean();
                }
                String maSP = request.getParameter("txtMaSP");
                String tenSP = request.getParameter("txtTenSP");
                String gia = request.getParameter("txtGia");
                String hinh = request.getParameter("txtHinh");
                float giaf = Float.parseFloat(gia);
                SanPham s = new SanPham(maSP, tenSP, giaf, hinh);
                SanPhamDTO sp = new SanPhamDTO(s);
                shop.themSP(sp);
                session.setAttribute("SO", shop.size());
                session.setAttribute("SHOP", shop);
                response.sendRedirect("index.jsp");
            } else if (action.equals("add to cart1")) {
                if (shop == null) {
                    shop = new CartBean();
                }
                String maSP = request.getParameter("txtMaSP");
                String tenSP = request.getParameter("txtTenSP");
                String gia = request.getParameter("txtGia");
                String hinh = request.getParameter("txtHinh");
                float giaf = Float.parseFloat(gia);
                SanPham s = new SanPham(maSP, tenSP, giaf, hinh);
                SanPhamDTO sp = new SanPhamDTO(s);
                shop.themSP(sp);
                session.setAttribute("SO", shop.size());
                session.setAttribute("SHOP", shop);
                response.sendRedirect("store.jsp");
            } else if (action.equals("xoa")) {
                if (shop == null) {
                    shop = new CartBean();
                }
                String maSP = request.getParameter("txtMaSP1");
                SanPham s = new SanPham(maSP);
                shop.xoaSP(s);
                session.setAttribute("SHOP", shop);
                response.sendRedirect("index.jsp");
            } else if (action.equals("DangNhap")) {
                String soDT = request.getParameter("txtSoDT");
                String matKhau = request.getParameter("txtMatKhau");
                String dauHieu = request.getParameter("txtDauHieu");
                if (new KhachHangDAO().checkLogin(new KhachHang(soDT, matKhau)) == 1) {
                    KhachHang kh = new KhachHangDAO().getTTKH(new KhachHang(soDT, matKhau));
                    session.setAttribute("TEN", kh);
                    session.setAttribute("DAUHIEU", "dn");
                    if (dauHieu.equals("DangNhapCheckOut")) {
                        response.sendRedirect("checkout.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    response.sendRedirect("admin/Loi.jsp");
                }
            } else if (action.equals("DangXuatCheckOut")) {
                session.setAttribute("CO", "dangxuat");
                session.setAttribute("QWER", "DangNhapCheckOutss");
                response.sendRedirect("checkout.jsp");
            } else if (action.equals("Thanh toán")) {
                session.setAttribute("QWER", "DangNhapCheckOut");
                response.sendRedirect("checkout.jsp");
            } else if (action.equals("DangNhapCheckOut")) {
                session.setAttribute("QWER", "DangNhapCheckOut");
                response.sendRedirect("login.jsp");
            } else if (action.equals("Icheck")) {
                session.setAttribute("QWER", "DangNhapCheckOutss");
                response.sendRedirect("index.jsp");
            } else if (action.equals("Đặt hàng")) {
                CartBean bean = (CartBean) session.getAttribute("SHOP");
                ArrayList<SanPhamDTO> list = new ArrayList<>();
                if (bean != null) {
                    for (SanPhamDTO sp : bean.values()) {
                        list.add(sp);
                    }
                }
                String hoten = request.getParameter("txtHoTen");
                String soDT = request.getParameter("txtSoDT");
                String email = request.getParameter("txtEmail");
                String diaChi = request.getParameter("txtDiaChi");
                String tien = request.getParameter("txtTien");
                if (tien.equals("0")) {
                    response.sendRedirect("admin/LoiCheckOut.jsp");
                } else {
                    if (new KhachHangDAO().kiemKH(new KhachHang(soDT)) == 2) {
                        int themKH = new KhachHangDAO().them(new KhachHang("123", hoten, soDT, email, diaChi));
                        String maGH = new GioHangDAO().taoMaGH();
                        int maKH = new KhachHangDAO().taoMaKH(new KhachHang("123", hoten, soDT, email, diaChi));
                        LocalDate ng = java.time.LocalDate.now();
                        String ngay = String.valueOf(ng);
                        int themGioHang = new GioHangDAO().them(new GioHang(maGH, maKH, ngay));
                        boolean kt = false;
                        int[] chuoi = new int[list.size()];
                        for (int i = 0; i < chuoi.length; i++) {
                            chuoi[i] = new ChiTietGioHangDAO().them(new ChiTietGioHang(maGH, list.get(i).getSanPham().getMaSP(), list.get(i).getSoLuong()));
                        }

                        for (int i = 0; i < chuoi.length; i++) {
                            if (chuoi[i] == 1) {
                                kt = true;
                            }
                        }
                        if (themKH == 1 && themGioHang == 1 && kt == true) {
                            response.sendRedirect("blank.jsp");
                        } else {
                            response.sendRedirect("admin/LoiCheckOut.jsp");
                        }
                    } else if (new KhachHangDAO().kiemKH(new KhachHang(soDT)) == 1) {
                        String m = request.getParameter("txtMaKH5");
                        int maKH = 0;
                        if (!m.equals("")) {
                            maKH = Integer.parseInt(m);
                        }
                        String maGH = new GioHangDAO().taoMaGH();
                        LocalDate ng = java.time.LocalDate.now();
                        String ngay = String.valueOf(ng);
                        int themGioHang = new GioHangDAO().them(new GioHang(maGH, maKH, ngay));
                        int[] chuoi = new int[list.size()];
                        boolean kt = false;
                        for (int i = 0; i < chuoi.length; i++) {
                            chuoi[i] = new ChiTietGioHangDAO().them(new ChiTietGioHang(maGH, list.get(i).getSanPham().getMaSP(), list.get(i).getSoLuong()));
                        }
                        for (int i = 0; i < chuoi.length; i++) {
                            if (chuoi[i] == 1) {
                                kt = true;
                            }
                        }
                        if (themGioHang == 1 && kt == true) {
                            response.sendRedirect("blank.jsp");
                        } else {
                            response.sendRedirect("admin/LoiCheckOut.jsp");
                        }
                    }
                }
            } else if (action.equals("DangKy")) {
                String email = request.getParameter("txtEmail8");
                String matKhau = request.getParameter("txtMatKhau8");
                String hoten = request.getParameter("txtHoTen8");
                String soDT = request.getParameter("txtSoDT8");
                String diaChi = request.getParameter("txtDiaChi8");
                if (new KhachHangDAO().them(new KhachHang(matKhau, hoten, soDT, email, diaChi)) == 1) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("admin/Loi.jsp");
                }
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
