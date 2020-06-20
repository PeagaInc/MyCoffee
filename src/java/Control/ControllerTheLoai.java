/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.TheLoaiDAO;
import Model.TheLoai;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DieuHuyen
 */
public class ControllerTheLoai extends HttpServlet {

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
                String maLoai = request.getParameter("txtMaLoai");
                String tenLoai = request.getParameter("txtTenLoai");
                if (new TheLoaiDAO().them(new TheLoai(maLoai, tenLoai)) == 1){
                    url = "admin/DanhSachTheLoai.jsp";
                }
            }else if(action.equals("Delete")){
                String maLoai = request.getParameter("txtMaLoai");
                if (new TheLoaiDAO().xoa(new TheLoai(maLoai)) == 1){
                    url = "admin/DanhSachTheLoai.jsp";
                }
            }else if(action.equals("Save changes")){
                String maLoai = request.getParameter("txtMaLoai1");
                String tenLoai = request.getParameter("txtTenLoai1");
                if (new TheLoaiDAO().sua(new TheLoai(maLoai, tenLoai)) == 1){
                    url = "admin/DanhSachTheLoai.jsp";
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
