/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.KeHoachDAO;
import database.NganhDAO;
import database.TaiKhoanAdminDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.TaiKhoanAdmin;

/**
 *
 * @author phangiabao
 */
@MultipartConfig()
@WebServlet(name = "KeHoach", urlPatterns = {"/ke-hoach"})
public class KeHoach extends HttpServlet {

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
        } else if (hanhDong.equals("danh-sach-cho-duyet")) {
            viewds(request, response);
        } else if (hanhDong.equals("update")) {
            update(request, response);
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
        KeHoachDAO keHoachDAO = new KeHoachDAO();
        ArrayList<model.KeHoach> list = keHoachDAO.getListKeHoach();
        TaiKhoanAdminDAO taiKhoanAdminDAO = new TaiKhoanAdminDAO();
        ArrayList<model.TaiKhoanAdmin> listtk = taiKhoanAdminDAO.getListTaiKhoanAdmin();
        request.setAttribute("data", list);
        request.setAttribute("listtk", listtk);
        request.getRequestDispatcher("admin-kehoach.jsp").forward(request, response);
    }

    protected void viewds(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        KeHoachDAO keHoachDAO = new KeHoachDAO();
        ArrayList<model.KeHoach> list = keHoachDAO.getListKeHoach();
        request.setAttribute("data", list);
        request.getRequestDispatcher("admin-kehoachchoduyet.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maKeHoach = request.getParameter("maKeHoach");
        KeHoachDAO keHoachDAO = new KeHoachDAO();
        model.KeHoach kh = keHoachDAO.getKeHoachByIdString(maKeHoach);
        request.setAttribute("data", kh);
        request.getRequestDispatcher("admin-kehoachedit.jsp").forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hocKy = request.getParameter("hocKy");
        String tenKeHoach = request.getParameter("tenKeHoach");
        String hinhThuc = request.getParameter("hinhThuc");
        String moTaKeHoach = request.getParameter("moTaKeHoach");
        String nguoiSoan = request.getParameter("nguoiSoan");
        String nguoiDuyet = request.getParameter("nguoiDuyet");
        String fileKeHoach = request.getParameter("fileKeHoach");
        String trangThai = request.getParameter("trangThai");

        String baoLoi = "";
        KeHoachDAO keHoachDAO = new KeHoachDAO();

        if (baoLoi.length() == 0) {
            Timestamp date = new Timestamp(System.currentTimeMillis());
            Date ngayTao = new Date(date.getTime());
            Random rd = new Random();
            String maKeHoach = System.currentTimeMillis() + rd.nextInt(1000) + "";
            TaiKhoanAdmin t1 = new TaiKhoanAdmin();
            t1.setMaAdmin(nguoiSoan);
            TaiKhoanAdmin t2 = new TaiKhoanAdmin();
            t2.setMaAdmin(nguoiDuyet);

            //xử lý upload file
            String folderName = "vanban";
            String uploadPath = "/Users/phangiabao/NetBeansProjects/PRJ301_FPT/TuyenSinhFPTUDN/web/vanban";//for netbeans use this code
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart = request.getPart("fileKeHoach");
            String fileName = maKeHoach + "-" + hocKy + "-" + nguoiSoan + "-" + filePart.getSubmittedFileName().replaceAll(" ", "");
            String path = folderName + File.separator + fileName;
            System.out.println("Path: " + uploadPath);
            InputStream is = filePart.getInputStream();
            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

            model.KeHoach kh = new model.KeHoach(maKeHoach, hocKy, tenKeHoach, hinhThuc, moTaKeHoach, path, trangThai, t1, t2, ngayTao);
            keHoachDAO.insert(kh);
        }

        request.setAttribute("baoLoi", baoLoi);

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maKeHoach = request.getParameter("maKeHoach");
        KeHoachDAO keHoachDAO = new KeHoachDAO();
        keHoachDAO.delete(maKeHoach);
    }
    
    protected void updateSubmit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maKeHoach = request.getParameter("maKeHoach");
        String hocKy = request.getParameter("hocKy");
        String tenKeHoach = request.getParameter("tenKeHoach");
        String hinhThuc = request.getParameter("hinhThuc");
        String moTaKeHoach = request.getParameter("moTaKeHoach");


        KeHoachDAO keHoachDAO = new KeHoachDAO();
            model.KeHoach kh = new model.KeHoach(maKeHoach, hocKy, tenKeHoach, hinhThuc, moTaKeHoach);
            keHoachDAO.update(kh);

        response.sendRedirect("ke-hoach");
    }
}
