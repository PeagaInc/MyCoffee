/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import DAO.TaiKhoanDAO;
import Model.TaiKhoan;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DieuHuyen
 */
public class ControllerLogin extends HttpServlet {

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
            if(action.equals("Login")){
                String user = request.getParameter("txtUsername");
                String pass = request.getParameter("txtPassword");
                if (new TaiKhoanDAO().checkLogin(new TaiKhoan(user, pass)) == 1){
                    url = "admin/index.jsp";
                }else{
                    HttpSession session = request.getSession(true);
                    session.setAttribute("CTK", "sai");
                    url = "admin/Login_tam.jsp";
                }
            }else if(action.equals("Submit")){
                String tenDN = request.getParameter("txtTenDN");
                String matKhau = request.getParameter("txtMK");
                String vaiTro = request.getParameter("rdbVaitro");
                System.out.println(tenDN+ matKhau+ vaiTro);
                boolean vtro = false;
                if(vaiTro.equals("QuanLy"))
                    vtro = true;
                else
                    vtro = false;
                if (new TaiKhoanDAO().them(new TaiKhoan(tenDN, matKhau, vtro)) == 1){
                    url = "admin/DanhSachTaiKhoan.jsp";
                }
            }else if(action.equals("Delete")){
                String tenDN = request.getParameter("txtTenDN");
                if (new TaiKhoanDAO().xoa(new TaiKhoan(tenDN)) == 1){
                    url = "admin/DanhSachTaiKhoan.jsp";
                }
            }else if(action.equals("Save changes")){
                String tenDN = request.getParameter("txtTenDN1");
                String matKhau = request.getParameter("txtMK1");
                String vaiTro = request.getParameter("rdbVaitro1");
                boolean vtro = false;
                if(vaiTro.equals("QuanLy"))
                    vtro = true;
                else
                    vtro = false;
                if(new TaiKhoanDAO().sua(new TaiKhoan(tenDN, matKhau, vtro)) == 1){
                    url = "admin/DanhSachTaiKhoan.jsp";
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
