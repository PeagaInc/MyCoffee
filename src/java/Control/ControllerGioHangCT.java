/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.ChiTietGioHangDAO;
import Model.ChiTietGioHang;
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
public class ControllerGioHangCT extends HttpServlet {

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
            String action = request.getParameter("action");
            String url = "";
            if(action.equals("Submit")){
                String maGH = request.getParameter("cbxMaGH");
                String maSP = request.getParameter("cbxMaSP");
                String sl = request.getParameter("txtSoluong");
                int sLuong = Integer.parseInt(sl);
                if (new ChiTietGioHangDAO().them(new ChiTietGioHang(maGH, maSP, sLuong)) == 1){
                    url = "admin/DanhSachGioHangChiTiet.jsp";
                }
            }else if(action.equals("Delete")){
                String maGH = request.getParameter("txtMaGH");
                String maSP = request.getParameter("txtMaSP");
                if (new ChiTietGioHangDAO().xoa(new ChiTietGioHang(maGH, maSP)) == 1){
                    url = "admin/DanhSachGioHangChiTiet.jsp";
                }else
                    url = "admin/Loi.jsp";
            }else if(action.equals("Save changes")){
                String maGH = request.getParameter("cbxMaGH1");
                String maSP = request.getParameter("cbxMaSP1");
                String sl = request.getParameter("txtSoLuong1");
                int sLuong = Integer.parseInt(sl);
                if (new ChiTietGioHangDAO().sua(new ChiTietGioHang(maGH, maSP, sLuong)) == 1){
                    url = "admin/DanhSachGioHangChiTiet.jsp";
                }
            }
            response.sendRedirect(url);
        } catch (Exception e) {
            e.printStackTrace();
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
