/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.NganhDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phangiabao
 */
@WebServlet(name = "Nganh", urlPatterns = {"/nganh"})
public class Nganh extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String hanhDong = request.getParameter("hanhDong");
        if (hanhDong == null) {
            view(request, response);
        } else if (hanhDong.equals("add")) {
            add(request, response);
            view(request, response);
        } else if (hanhDong.equals("delete")) {
            delete(request, response);
            view(request, response);
        }
        else if (hanhDong.equals("update")) {
            update(request, response);
            
        }else if (hanhDong.equals("updateSubmit")) {
            updateSubmit(request, response);
            
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

    protected void view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maNganh = request.getParameter("maNganh");
        NganhDAO nganh = new NganhDAO();
        ArrayList<model.Nganh> list = nganh.getListNganh();
        request.setAttribute("data", list);
     
        request.getRequestDispatcher("admin-nganhhoc.jsp").forward(request, response);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maNganh = request.getParameter("maNganh");
        NganhDAO nganhDAO = new NganhDAO();
        model.Nganh nganh = nganhDAO.getListNganhByIdString(maNganh);
        request.setAttribute("data", nganh);    
        request.getRequestDispatcher("admin-nganhhocedit.jsp").forward(request, response);
    }
    protected void updateSubmit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maNganh = request.getParameter("maNganh");
        String tenNganh = request.getParameter("tenNganh");
        NganhDAO nganhDAO = new NganhDAO();
        request.setAttribute("maNganh", maNganh);
        request.setAttribute("tenNganh", tenNganh);
        model.Nganh kh = new model.Nganh(maNganh, tenNganh);
        nganhDAO.update(kh);
        
        response.sendRedirect("nganh");
    }

    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maNganh = request.getParameter("maNganh");
        String tenNganh = request.getParameter("tenNganh");

        request.setAttribute("maNganh", maNganh);
        request.setAttribute("tenNganh", tenNganh);

        String baoLoi = "";
        NganhDAO nganhDAO = new NganhDAO();
        if (nganhDAO.kiemTraMaNganh(maNganh)) {
            baoLoi += "Mã ngành đã tồn tại, vui lòng chọn Mã ngành khác<br>";
        }
        if (baoLoi.length() == 0) {

            model.Nganh kh = new model.Nganh(maNganh, tenNganh);
            nganhDAO.insert(kh);
        }

        request.setAttribute("baoLoi", baoLoi);

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maNganh = request.getParameter("maNganh");
        NganhDAO nganhDAO = new NganhDAO();
        nganhDAO.delete(maNganh);

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
