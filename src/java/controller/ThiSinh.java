/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.NganhDAO;
import database.ThiSinhDAO;
import database.TruongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Nganh;
import model.Truong;

/**
 *
 * @author phangiabao
 */
@WebServlet(name = "ThiSinh", urlPatterns = {"/thi-sinh"})
public class ThiSinh extends HttpServlet {

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
        if (hanhDong.equals("dang-nhap")) {
            dangNhap(request, response);
        } else if (hanhDong.equals("dang-xuat")) {
            dangXuat(request, response);
        } else if (hanhDong.equals("dang-ky")) {
            dangKy(request, response);

        } else if (hanhDong.equals("bo-sung-ttxt")) {
            boSungTTXT(request, response);
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
    
    protected void dangNhap(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String cccd = request.getParameter("cccd");
        final String soDienThoai = request.getParameter("soDienThoai");
        
        
        final model.ThiSinh ts = new model.ThiSinh();
        ts.setCccd(cccd);
        ts.setSoDienThoai(soDienThoai);
        final ThiSinhDAO tsd = new ThiSinhDAO();
        final model.ThiSinh thiSinh = tsd.selectByCCCDAndSDT(ts);
        String url = "";
        if (thiSinh != null) {
            final HttpSession session = request.getSession();
            session.setAttribute("thiSinh", (Object)thiSinh);
            url = "/thisinh.jsp";
        }
        else {
            request.setAttribute("baoLoi", (Object)"T\u00ean \u0111\u0103ng nh\u1eadp ho\u1eb7c m\u1eadt kh\u1ea9u kh\u00f4ng \u0111\u00fang!");
            url = "/thisinh-login.jsp";
        }
        final RequestDispatcher rd = this.getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
    protected void dangXuat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //huỷ bỏ ssession
        session.invalidate();
        response.sendRedirect("thisinh-login.jsp");
    }
    protected void dangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hoVaTenThiSinh = request.getParameter("hoVaTenThiSinh");
        String cccd = request.getParameter("cccd");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngaySinh");
        String ngayCap = request.getParameter("ngayCap");
        String noiCap = request.getParameter("noiCap");
        String maTruong = request.getParameter("maTruong");
        String namTotNghiep = request.getParameter("namTotNghiep");
        String tinhThanh = request.getParameter("tinhThanh");
        String quanHuyen = request.getParameter("quanHuyen");
        String phuongXa = request.getParameter("phuongXa");
        String soNha = request.getParameter("soNha");
        String diaChiDayDu = request.getParameter("diaChiDayDu");
        String maNganh = request.getParameter("maNganh");
        String noiDangKy = request.getParameter("noiDangKy");
        String hinhThucDangKy = request.getParameter("hinhThucDangKy");
        String kyDuTuyen = request.getParameter("kyDuTuyen");
        String phuongThucDangKy = request.getParameter("phuongThucDangKy");
        String xepHang = request.getParameter("xepHang");
        String lePhiDangKy = request.getParameter("lePhiDangKy");
        String tinhTrangThanhToanDangKy = request.getParameter("tinhTrangThanhToanDangKy");
        String tinhTrangDangKy = request.getParameter("tinhTrangDangKy");
        String tinhTrangHoSo = request.getParameter("tinhTrangHoSo");
        String tinhTrangNhapHoc = request.getParameter("tinhTrangNhapHoc");
        String tinhTrangThanhToanNhapHoc = request.getParameter("tinhTrangThanhToanNhapHoc");

        request.setAttribute("hoVaTenThiSinh", hoVaTenThiSinh);
        request.setAttribute("cccd", cccd);
        request.setAttribute("soDienThoai", soDienThoai);
        request.setAttribute("email", email);
        request.setAttribute("gioiTinh", gioiTinh);
        request.setAttribute("ngaySinh", ngaySinh);
        request.setAttribute("ngayCap", ngayCap);
        request.setAttribute("noiCap", noiCap);
        request.setAttribute("namTotNghiep", namTotNghiep);
        request.setAttribute("maTruong", maTruong);
        request.setAttribute("tinhThanh", tinhThanh);
        request.setAttribute("quanHuyen", quanHuyen);
        request.setAttribute("phuongXa", phuongXa);
        request.setAttribute("soNha", soNha);
        request.setAttribute("diaChiDayDu", diaChiDayDu);
        request.setAttribute("maNganh", maNganh);
        request.setAttribute("noiDangKy", noiDangKy);
        request.setAttribute("hinhThucDangKy", hinhThucDangKy);
        request.setAttribute("kyDuTuyen", kyDuTuyen);
        request.setAttribute("phuongThucDangKy", phuongThucDangKy);
        request.setAttribute("xepHang", xepHang);
        request.setAttribute("lePhiDangKy", lePhiDangKy);
        request.setAttribute("tinhTrangThanhToanDangKy", tinhTrangThanhToanDangKy);
        request.setAttribute("tinhTrangDangKy", tinhTrangDangKy);
        request.setAttribute("tinhTrangHoSo", tinhTrangHoSo);
        request.setAttribute("tinhTrangNhapHoc", tinhTrangNhapHoc);
        request.setAttribute("tinhTrangThanhToanNhapHoc", tinhTrangThanhToanNhapHoc);
      
        

        String url = "";
        String baoLoi = "";
        ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
        if (thiSinhDAO.kiemTraCCCD(cccd)) {
            baoLoi += "CCCD đã tồn tại trên hệ thống, vui lòng đăng nhập<br>";
        }

        request.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() > 0) {
            url = "/thisinh-register.jsp";
        } else {
            Random rd = new Random();
            String maThiSinh = System.currentTimeMillis() + rd.nextInt(1000) + "";

            Truong t1 = new Truong();
            t1.setMaTruong(maTruong);
            Nganh n1 = new Nganh();
            n1.setMaNganh(maNganh);
            Truong t2 = new TruongDAO().getListTruongById(t1);
            Nganh n2 = new NganhDAO().getListNganhById(n1);
            model.ThiSinh ts = new model.ThiSinh(maThiSinh, hoVaTenThiSinh, cccd, soDienThoai, email, gioiTinh, Date.valueOf(ngaySinh), Date.valueOf(ngayCap), noiCap, t2, namTotNghiep, tinhThanh, quanHuyen, phuongXa, soNha, diaChiDayDu, noiDangKy, n2, hinhThucDangKy, kyDuTuyen, phuongThucDangKy, xepHang, lePhiDangKy, tinhTrangThanhToanDangKy,tinhTrangDangKy,tinhTrangHoSo,tinhTrangNhapHoc,tinhTrangThanhToanNhapHoc);
                        thiSinhDAO.insert(ts);
          
            url = "/thisinh-thanhcong.jsp";
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void boSungTTXT(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String noiSinh = request.getParameter("noiSinh");
        String quocTich = request.getParameter("quocTich");
        String danToc = request.getParameter("danToc");
        String tonGiao = request.getParameter("tonGiao");
        String hoKhauThuongTru = request.getParameter("hoKhauThuongTru");
        String xepLoaiTotNghiep = request.getParameter("xepLoaiTotNghiep");
        String loaiHanhKiem = request.getParameter("loaiHanhKiem");
        String loaiHocLuc = request.getParameter("loaiHocLuc");
        
        request.setAttribute("noiSinh", noiSinh);
        request.setAttribute("quocTich", quocTich);
        request.setAttribute("tonGiao", tonGiao);
        request.setAttribute("hoKhauThuongTru", hoKhauThuongTru);
        request.setAttribute("danToc", danToc);
        request.setAttribute("xepLoaiTotNghiep", xepLoaiTotNghiep);
        request.setAttribute("loaiHanhKiem", loaiHanhKiem);
        request.setAttribute("loaiHocLuc", loaiHocLuc);
        
        String url = "";
        final String baoLoi = "";
        final ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
        request.setAttribute("baoLoi", (Object)baoLoi);
        if (baoLoi.length() > 0) {
            url = "/thisinh.jsp";
        }
        else {
            final Object obj = request.getSession().getAttribute("thiSinh");
            model.ThiSinh thiSinh = null;
            if (obj != null) {
                thiSinh = (model.ThiSinh)obj;
            }
            if (thiSinh != null) {
                final String maThiSinh = thiSinh.getMaThiSinh();
                
                final model.ThiSinh ts = new model.ThiSinh(maThiSinh,noiSinh, quocTich, danToc, tonGiao, hoKhauThuongTru, xepLoaiTotNghiep, loaiHanhKiem, loaiHocLuc);
                thiSinhDAO.updateThongTinXT(ts);
                final model.ThiSinh ts2 = thiSinhDAO.getListThiSinhById(ts);
                request.getSession().setAttribute("thiSinh", (Object)ts2);
                url = "/thisinh.jsp";
            }
        }
        final RequestDispatcher rd = this.getServletContext().getRequestDispatcher(url);
        rd.forward((ServletRequest)request, (ServletResponse)response);
    }
}
