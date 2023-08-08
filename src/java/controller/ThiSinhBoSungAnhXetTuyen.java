/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.ThiSinhDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author phangiabao
 */
@MultipartConfig()
@WebServlet(name = "ThiSinhBoSungAnhXetTuyen", urlPatterns = {"/thi-sinh-bo-sung-anh-ttxt"})
public class ThiSinhBoSungAnhXetTuyen extends HttpServlet {

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

        String anhCCCDMatTruoc = request.getParameter("anhCCCDMatTruoc");
        String anhCCCDMatSau = request.getParameter("anhCCCDMatSau");
        String anhSchoolRank = request.getParameter("anhSchoolRank");
        String anhBangDiem11 = request.getParameter("anhBangDiem11");
        String anhBangDiem12 = request.getParameter("anhBangDiem12");

        request.setAttribute("anhCCCDMatTruoc", anhCCCDMatTruoc);
        request.setAttribute("anhCCCDMatSau", anhCCCDMatSau);
        request.setAttribute("anhSchoolRank", anhSchoolRank);
        request.setAttribute("anhBangDiem11", anhBangDiem11);
        request.setAttribute("anhBangDiem12", anhBangDiem12);

        String url = "";
        final String baoLoi = "";
        final ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
        request.setAttribute("baoLoi", (Object) baoLoi);
        if (baoLoi.length() > 0) {
            url = "/thisinh.jsp";
        } else {
            final Object obj = request.getSession().getAttribute("thiSinh");
            model.ThiSinh thiSinh = null;
            if (obj != null) {
                thiSinh = (model.ThiSinh) obj;
            }
            if (thiSinh != null) {
            String folderName = "thisinh";
            String uploadPath = "/Users/phangiabao/NetBeansProjects/PRJ301_FPT/TuyenSinhFPTUDN/web/thisinh";//for netbeans use this code
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart = request.getPart("anhCCCDMatTruoc");//Textbox value of name file.
            Part filePart2 = request.getPart("anhCCCDMatSau");
            Part filePart3 = request.getPart("anhSchoolRank");
            Part filePart4 = request.getPart("anhBangDiem11");
            Part filePart5 = request.getPart("anhBangDiem12");
            
            String fileName = thiSinh.getMaThiSinh() +"_anh_cccd_mat_truoc.png";
            String fileName2 =thiSinh.getMaThiSinh() +"_anh_cccd_mat_sau.png";
            String fileName3 =thiSinh.getMaThiSinh() +"_anh_schoolrank.png";
            String fileName4 =thiSinh.getMaThiSinh() +"_anh_bang_diem_11.png";
            String fileName5 = thiSinh.getMaThiSinh() +"_anh_bang_diem_12.png";
            
            String path = folderName + File.separator + fileName;
            String path2 = folderName + File.separator + fileName2;
            String path3 = folderName + File.separator + fileName3;
            String path4 = folderName + File.separator + fileName4;
            String path5 = folderName + File.separator + fileName5;


            System.out.println("Path: " + uploadPath);
            InputStream is = filePart.getInputStream();
            InputStream is2 = filePart2.getInputStream();
            InputStream is3 = filePart3.getInputStream();
            InputStream is4 = filePart4.getInputStream();
            InputStream is5 = filePart5.getInputStream();
            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is2, Paths.get(uploadPath + File.separator + fileName2), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is3, Paths.get(uploadPath + File.separator + fileName3), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is4, Paths.get(uploadPath + File.separator + fileName4), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is5, Paths.get(uploadPath + File.separator + fileName5), StandardCopyOption.REPLACE_EXISTING);
                final String maThiSinh = thiSinh.getMaThiSinh();
                 

               final model.ThiSinh ts = new model.ThiSinh(maThiSinh, path, path2, path3, path4, path5);
                thiSinhDAO.updateAnhXT(ts);
                final model.ThiSinh ts2 = thiSinhDAO.getListThiSinhById(ts);
                request.getSession().setAttribute("thiSinh", (Object) ts2);
                url = "/thisinh.jsp";
            }
        }
        final RequestDispatcher rd = this.getServletContext().getRequestDispatcher(url);
        rd.forward((ServletRequest) request, (ServletResponse) response);
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
