/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.TaiKhoanAdminDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TaiKhoanAdmin;
import util.MaHoa;

/**
 *
 * @author phangiabao
 */
@WebServlet(name = "TaiKhoan", urlPatterns = {"/tai-khoan"})
public class TaiKhoan extends HttpServlet {

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
        } else if (hanhDong.equals("update")) {
            update(request, response);
        } else if (hanhDong.equals("updateSubmit")) {
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
        TaiKhoanAdminDAO taiKhoanAdminDAO = new TaiKhoanAdminDAO();
        ArrayList<TaiKhoanAdmin> list = taiKhoanAdminDAO.getListTaiKhoanAdmin();
        request.setAttribute("data", list);
        request.getRequestDispatcher("admin-taikhoan.jsp").forward(request, response);
    }
    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        String matKhauNhapLai = request.getParameter("matKhauNhapLai");
        String hoVaTen = request.getParameter("hoVaTen");
        String emailAdmin = request.getParameter("emailAdmin");
        String chucVu = request.getParameter("chucVu");

        request.setAttribute("tenDangNhap", tenDangNhap);
        request.setAttribute("hoVaTen", hoVaTen);
        request.setAttribute("emailAdmin", emailAdmin);
        request.setAttribute("chucVu", chucVu);

        String baoLoi = "";
        TaiKhoanAdminDAO taiKhoanAdminDAO = new TaiKhoanAdminDAO();
        if (taiKhoanAdminDAO.kiemTraTenDangNhap(tenDangNhap)) {
            baoLoi += "Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác<br>";
        }

        if (!matKhau.equals(matKhauNhapLai)) {
            baoLoi += "Mật khẩu không khớp!<br>";
        } else {
            matKhau = MaHoa.toSHA1(matKhau);
        }
        if (baoLoi.length() == 0) {
            
            Random rd = new Random();
            String maAdmin = System.currentTimeMillis() + rd.nextInt(1000) + "";
            model.TaiKhoanAdmin kh = new model.TaiKhoanAdmin(maAdmin, tenDangNhap, matKhau, hoVaTen, emailAdmin, chucVu);
            taiKhoanAdminDAO.insert(kh);
        } 

        request.setAttribute("baoLoi", baoLoi);
       

        
        
    }
    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String maAdmin = request.getParameter("maAdmin");
        TaiKhoanAdminDAO taiKhoanAdminDAO = new TaiKhoanAdminDAO();
        taiKhoanAdminDAO.delete(maAdmin);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maAdmin =request.getParameter("maAdmin");
        TaiKhoanAdminDAO taiKhoanAdminDAO = new TaiKhoanAdminDAO();
        model.TaiKhoanAdmin list = taiKhoanAdminDAO.getListTaiKhoanAdminByIdString(maAdmin);
        request.setAttribute("data", list);
        request.getRequestDispatcher("admin-taikhoanedit.jsp").forward(request, response);
    }
    
    private void updateSubmit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maAdmin =request.getParameter("maAdmin");
        String tenDangNhap = request.getParameter("tenDangNhap");
        String hoVaTen = request.getParameter("hoVaTen");
        String emailAdmin = request.getParameter("emailAdmin");
        String chucVu = request.getParameter("chucVu");
        request.setAttribute("maAdmin", maAdmin);
        request.setAttribute("tenDangNhap", tenDangNhap);
        request.setAttribute("hoVaTen", hoVaTen);
        request.setAttribute("emailAdmin", emailAdmin);
        request.setAttribute("chucVu", chucVu);

        String url = "";
        String baoLoi = "";
        TaiKhoanAdminDAO taiKhoanAdminDAO = new TaiKhoanAdminDAO();
        
        request.setAttribute("baoLoi", baoLoi);

        
            model.TaiKhoanAdmin tk = new TaiKhoanAdmin(maAdmin, tenDangNhap, hoVaTen, emailAdmin, chucVu);
            taiKhoanAdminDAO.update(tk);
        

        response.sendRedirect("truong");
    }
}
