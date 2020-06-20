/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.SanPhamDAO;
import Model.SanPham;
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
public class ControllerSanPham extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String[] anh;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            String url = "";
            if(action.equals("Submit")){
                String maSP = request.getParameter("txtMaSP");
                String tenSP = request.getParameter("txtTenSP");
                String gia = request.getParameter("txtGia");
                float giaf = Float.parseFloat(gia);
                String moTa = request.getParameter("txtMoTa");
                String hinh = request.getParameter("txtHinh");
                String maLoai = request.getParameter("cbxMaLoai");
                if (new SanPhamDAO().them(new SanPham(maSP, tenSP, giaf, moTa, hinh, maLoai)) == 1){
                    url = "admin/DanhSachSanPham.jsp";
                }
            }else if(action.equals("Delete")){
                String maSP = request.getParameter("txtMaSP");
                if (new SanPhamDAO().xoa(new SanPham(maSP)) == 1){
                    url = "admin/DanhSachSanPham.jsp";
                }else{
                    url = "admin/Loi.jsp";
                }
            }else if(action.equals("Save changes")){
                String maSP = request.getParameter("txtMaSP1");
                String tenSP = request.getParameter("txtTenSP1");
                String gia = request.getParameter("txtGia1");
                float giaf = Float.parseFloat(gia);
                String moTa = request.getParameter("txtMoTa1");
                String hinh = request.getParameter("txtHinh1");
                String maLoai = request.getParameter("cbxMaLoai1");
                if (new SanPhamDAO().sua(new SanPham(maSP, tenSP, giaf, moTa, hinh, maLoai)) == 1){
                    url = "admin/DanhSachSanPham.jsp";
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
