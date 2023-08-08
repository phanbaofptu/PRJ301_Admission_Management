/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.NganhDAO;
import database.TaiKhoanAdminDAO;
import database.ThiSinhDAO;
import database.TruongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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
import model.TaiKhoanAdmin;
import model.Truong;
import util.MaHoa;

/**
 *
 * @author phangiabao
 */
@WebServlet(name = "Admin", urlPatterns = {"/admin"})
public class Admin extends HttpServlet {

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
        if (hanhDong.equals("danh-sach-xet-tuyen")) {
            view(request, response);
        } else if (hanhDong.equals("dang-nhap")) {
            dangNhap(request, response);
        } else if (hanhDong.equals("dang-xuat")) {
            dangXuat(request, response);
        } else if (hanhDong.equals("dang-ky")) {
            dangKy(request, response);
        } else if (hanhDong.equals("updateSubmit")) {
            updateSubmit(request, response);
        } else if (hanhDong.equals("crm")) {
            crm(request, response);
        } else if (hanhDong.equals("delete")) {
            crm(request, response);
        } else if (hanhDong.equals("viewDetail")) {
            viewDetail(request, response);
        }   else if (hanhDong.equals("update")) {
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
        ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
        ArrayList<model.ThiSinh> list = thiSinhDAO.getListThiSinh();
        request.setAttribute("data", list);
        request.getRequestDispatcher("admin-thisinh.jsp").forward(request, response);
    }

    protected void viewDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maThiSinh = request.getParameter("maThiSinh");
        ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
        model.ThiSinh ts = thiSinhDAO.getListThiSinhByIdString(maThiSinh);
        request.setAttribute("data", ts);
        request.getRequestDispatcher("admin-thongtinthisinh.jsp").forward(request, response);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maThiSinh = request.getParameter("maThiSinh");
        ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
        model.ThiSinh ts = thiSinhDAO.getListThiSinhByIdString(maThiSinh);
        request.setAttribute("data", ts);
        NganhDAO nganhDAO = new NganhDAO();
        List<Nganh> list = nganhDAO.getListNganh();
        request.setAttribute("nganh", list);
        TruongDAO truongDAO = new TruongDAO();
        List<Truong> truong = truongDAO.getListTruong();
         request.setAttribute("truong", truong);
        request.getRequestDispatcher("admin-thongtinthisinhedit.jsp").forward(request, response);
    }

    protected void crm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("admin-crm.jsp").forward(request, response);
    }

    private void dangNhap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        matKhau = MaHoa.toSHA1(matKhau);

        final model.TaiKhoanAdmin tka = new model.TaiKhoanAdmin();
        tka.setTenDangNhap(tenDangNhap);
        tka.setMatKhau(matKhau);
        final TaiKhoanAdminDAO tkad = new TaiKhoanAdminDAO();
        final model.TaiKhoanAdmin taiKhoanAdmin = tkad.selectByUserAndPassword(tka);
        String url = "";
        if (taiKhoanAdmin != null) {
            final HttpSession session = request.getSession();
            session.setAttribute("taiKhoanAdmin", (Object) taiKhoanAdmin);
            url = "/admin-crm.jsp";
        } else {
            request.setAttribute("baoLoi", (Object) "T\u00ean \u0111\u0103ng nh\u1eadp ho\u1eb7c m\u1eadt kh\u1ea9u kh\u00f4ng \u0111\u00fang!");
            url = "/admin-login.jsp";
        }
        final RequestDispatcher rd = this.getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void dangXuat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //huỷ bỏ ssession
        session.invalidate();
        response.sendRedirect("admin-login.jsp");
    }

    private void dangKy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        String url = "";
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

        request.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() > 0) {
            url = "/admin-taikhoan.jsp";
        } else {
            Random rd = new Random();
            String maAdmin = System.currentTimeMillis() + rd.nextInt(1000) + "";
            model.TaiKhoanAdmin kh = new model.TaiKhoanAdmin(maAdmin, tenDangNhap, matKhau, hoVaTen, emailAdmin, chucVu);
            taiKhoanAdminDAO.insert(kh);
            url = "/admin-taikhoan.jsp";
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void updateSubmit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maThiSinh = request.getParameter("maThiSinh");
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

        String noiSinh = request.getParameter("noiSinh");
        String quocTich = request.getParameter("quocTich");
        String danToc = request.getParameter("danToc");
        String tonGiao = request.getParameter("tonGiao");
        String hoKhauThuongTru = request.getParameter("hoKhauThuongTru");
        String xepLoaiTotNghiep = request.getParameter("xepLoaiTotNghiep");
        String loaiHanhKiem = request.getParameter("loaiHanhKiem");
        String loaiHocLuc = request.getParameter("loaiHocLuc");

        
        ThiSinhDAO thiSinhDAO = new ThiSinhDAO();
                Truong t1 = new Truong();
                t1.setMaTruong(maTruong);
                Nganh n1 = new Nganh();
                n1.setMaNganh(maNganh);

                model.ThiSinh ts = new model.ThiSinh(maThiSinh, hoVaTenThiSinh, cccd, soDienThoai, email, gioiTinh, Date.valueOf(ngaySinh), noiSinh, Date.valueOf(ngayCap), noiCap, quocTich, danToc, tonGiao, hoKhauThuongTru, t1, namTotNghiep, xepLoaiTotNghiep, loaiHanhKiem, loaiHocLuc, tinhThanh, quanHuyen, phuongXa, soNha, diaChiDayDu, noiDangKy, n1, hinhThucDangKy, kyDuTuyen, phuongThucDangKy, xepHang, lePhiDangKy, tinhTrangThanhToanDangKy, tinhTrangDangKy, tinhTrangHoSo, tinhTrangNhapHoc, tinhTrangThanhToanNhapHoc);
                thiSinhDAO.updateThongTinXTForAdmin(ts);
            
        
        response.sendRedirect("admin?hanhDong=danh-sach-xet-tuyen");
    }

}
