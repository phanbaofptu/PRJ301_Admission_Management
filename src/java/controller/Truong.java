/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.TaiKhoanAdminDAO;
import database.TruongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phangiabao
 */
@WebServlet(name = "Truong", urlPatterns = {"/truong"})
public class Truong extends HttpServlet {

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
        }
        else if (hanhDong.equals("updateSubmit")) {
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TruongDAO truongDAO = new TruongDAO();
        ArrayList<model.Truong> list = truongDAO.getListTruong();
        request.setAttribute("data", list);
        request.getRequestDispatcher("admin-truonghoc.jsp").forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tenTruong = request.getParameter("tenTruong");
        String tinhTruong = request.getParameter("tinhTruong");
        String huyenTruong = request.getParameter("huyenTruong");
        String khuVuc = request.getParameter("khuVuc");

        request.setAttribute("tenTruong", tenTruong);
        request.setAttribute("tinhTruong", tinhTruong);
        request.setAttribute("huyenTruong", huyenTruong);
        request.setAttribute("khuVuc", khuVuc);

        String baoLoi = "";
        TruongDAO truongDAO = new TruongDAO();

        request.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() == 0) {

            Random rd = new Random();
            String maTruong = System.currentTimeMillis() + rd.nextInt(1000) + "";
            model.Truong kh = new model.Truong(maTruong, tenTruong, tinhTruong, huyenTruong, khuVuc);
            truongDAO.insert(kh);
        }

    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maTruong = request.getParameter("maTruong");
        TruongDAO truongDAO = new TruongDAO();
        model.Truong list = truongDAO.getListTruongByIdString(maTruong);
        request.setAttribute("data", list);
        request.getRequestDispatcher("admin-truonghocedit.jsp").forward(request, response);
    }

    protected void updateSubmit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maTruong = request.getParameter("maTruong");
        String tenTruong = request.getParameter("tenTruong");
        String tinhTruong = request.getParameter("tinhTruong");
        String huyenTruong = request.getParameter("huyenTruong");
        String khuVuc = request.getParameter("khuVuc");
        request.setAttribute("maTruong", maTruong);
        request.setAttribute("tenTruong", tenTruong);
        request.setAttribute("tinhTruong", tinhTruong);
        request.setAttribute("huyenTruong", huyenTruong);
        request.setAttribute("khuVuc", khuVuc);

        String baoLoi = "";
        TruongDAO truongDAO = new TruongDAO();

        request.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() == 0) {

            model.Truong kh = new model.Truong(maTruong, tenTruong, tinhTruong, huyenTruong, khuVuc);
            truongDAO.update(kh);
        }
        response.sendRedirect("truong");

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maTruong = request.getParameter("maTruong");
        TruongDAO truongDAO = new TruongDAO();
        truongDAO.delete(maTruong);
    }
}
