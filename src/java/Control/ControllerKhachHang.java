/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.KhachHangDAO;
import Model.KhachHang;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author DieuHuyen
 */
public class ControllerKhachHang extends HttpServlet {

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
        try {
            request.setCharacterEncoding("utf-8");
            String action = request.getParameter("action");
            String url = "";
            if(action.equals("Submit")){
                String matKhau = request.getParameter("txtMatKhau");
                String hoten = request.getParameter("txtHoTen");
                String soDT = request.getParameter("txtSoDT");
                String email = request.getParameter("txEmail");
                String diaChi = request.getParameter("txtDiaChi");
                if (new KhachHangDAO().them(new KhachHang(matKhau, hoten, soDT, email, diaChi)) == 1){
                    url = "admin/DanhSachKhachHang.jsp";
                }
            }else if(action.equals("Delete")){
                String maKH = request.getParameter("txtMaKH");
                int ma = Integer.parseInt(maKH);
                if (new KhachHangDAO().xoa(new KhachHang(ma)) == 1){
                    url = "admin/DanhSachKhachHang.jsp";
                }else
                    url = "admin/Loi.jsp";
            }else if(action.equals("Save changes")){
                String maKH = request.getParameter("txtMaKH");
                int ma = Integer.parseInt(maKH);
                String matKhau = request.getParameter("txtMK1");
                String hoten = request.getParameter("txtHoTen1");
                String soDT = request.getParameter("txtSoDT1");
                String email = request.getParameter("txtEmail1");
                String diaChi = request.getParameter("txtDiaChi1");
                if (new KhachHangDAO().sua(new KhachHang(ma, matKhau, hoten, soDT, email, diaChi)) == 1){
                    url = "admin/DanhSachKhachHang.jsp";
                }
            }
            response.sendRedirect(url);
        } catch (Exception e) {}
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
