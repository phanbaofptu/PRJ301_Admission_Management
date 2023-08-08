<%-- 
    Document   : thisinh-register
    Created on : 15 thg 5, 2023, 22:16:33
    Author     : phangiabao
--%>

<%@page import="model.Truong"%>
<%@page import="database.TruongDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Nganh"%>
<%@page import="database.NganhDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ĐĂNG KÝ TUYỂN SINH ĐH FPT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/css-style.css">
    </head>
    <body>
        <%
            String baoLoi = request.getAttribute("baoLoi") + "";
            baoLoi = (baoLoi.equals("null")) ? "Thí sinh đã đăng ký tuyển sinh đăng nhập tại đây" : baoLoi;

            String hoVaTenThiSinh = request.getAttribute("hoVaTenThiSinh") + "";
            hoVaTenThiSinh = (hoVaTenThiSinh.equals("null")) ? "" : hoVaTenThiSinh;
            String soDienThoai = request.getAttribute("soDienThoai") + "";
            soDienThoai = (soDienThoai.equals("null")) ? "" : soDienThoai;
            String email = request.getAttribute("email") + "";
            email = (email.equals("null")) ? "" : email;
            String gioiTinh = request.getAttribute("gioiTinh") + "";
            gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;
            String ngaySinh = request.getAttribute("ngaySinh") + "";
            ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;
            String cccd = request.getAttribute("cccd") + "";
            cccd = (cccd.equals("null")) ? "" : cccd;
            String ngayCap = request.getAttribute("ngayCap") + "";
            ngayCap = (ngayCap.equals("null")) ? "" : ngayCap;
            String noiCap = request.getAttribute("noiCap") + "";
            noiCap = (noiCap.equals("null")) ? "" : noiCap;
            String maTruong = request.getAttribute("maTruong") + "";
            maTruong = (maTruong.equals("null")) ? "" : maTruong;
            String tinhThanh = request.getAttribute("tinhThanh") + "";
            tinhThanh = (tinhThanh.equals("null")) ? "" : tinhThanh;
            String quanHuyen = request.getAttribute("quanHuyen") + "";
            quanHuyen = (quanHuyen.equals("null")) ? "" : quanHuyen;
            String phuongXa = request.getAttribute("phuongXa") + "";
            phuongXa = (phuongXa.equals("null")) ? "" : phuongXa;
            String soNha = request.getAttribute("soNha") + "";
            soNha = (soNha.equals("null")) ? "" : soNha;
            String diaChiDayDu = request.getAttribute("diaChiDayDu") + "";
            diaChiDayDu = (diaChiDayDu.equals("null")) ? "" : diaChiDayDu;
            String maNganh = request.getAttribute("maNganh") + "";
            maNganh = (maNganh.equals("null")) ? "" : maNganh;
            String namTotNghiep = request.getAttribute("namTotNghiep") + "";
            namTotNghiep = (namTotNghiep.equals("null")) ? "" : namTotNghiep;
            String hinhThucDangKy = request.getAttribute("hinhThucDangKy") + "";
            hinhThucDangKy = (hinhThucDangKy.equals("null")) ? "" : hinhThucDangKy;
            String noiDangKy = request.getAttribute("noiDangKy") + "";
            noiDangKy = (noiDangKy.equals("null")) ? "" : noiDangKy;
            String kyDuTuyen = request.getAttribute("kyDuTuyen") + "";
            kyDuTuyen = (kyDuTuyen.equals("null")) ? "" : kyDuTuyen;
            String phuongThucDangKy = request.getAttribute("phuongThucDangKy") + "";
            phuongThucDangKy = (phuongThucDangKy.equals("null")) ? "" : phuongThucDangKy;
            String xepHang = request.getAttribute("xepHang") + "";
            xepHang = (xepHang.equals("null")) ? "" : xepHang;
            String noiSinh = request.getAttribute("noiSinh") + "";
            noiSinh = (noiSinh.equals("null")) ? "" : noiSinh;


        %>
        <section id="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="boximagestop">
                            <a href="#">
                                <img src="img/images-tohop.png" alt="">
                            </a>
                        </div>

                    </div>
                    <div class="col-md-9">
                        <div class="titletopheader">
                            <span>PHIẾU ĐĂNG KÝ ĐẠI HỌC FPT 2023</span>
                            <span>HỆ ĐẠI HỌC CHÍNH QUY</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="processbar">
            <div class="container">
                <div class="row-fluid">
                    <!-- <div class="col-md-12 "> -->

                    <div data-title="Thanh tiến độ" data-intro="Thanh tiến độ đăng ký" class="process-bar-detail">

                        <form action="thi-sinh" method="post">
                            <input type="hidden" name="hanhDong" value="dang-ky"/>
                            <div class="row container">
                                <div class="col-md-12 mt-4">
                                    <div class="alert alert-success" role="alert">
                                        <%=baoLoi%> 
                                        <button  type="button" class="btn btn-light"><a href="thisinh-login.jsp">Đăng nhập</a></button>

                                    </div>
                                    <div class="titleinfo">Thông tin thí sinh</div>
                                </div>

                                <div class="col-md-4">
                                    <label for="hoVaTenThiSinh" class="form-label">Họ và tên thí sinh</label>
                                    <input type="text" class="form-control" id="hoVaTenThiSinh" name="hoVaTenThiSinh" value="<%=hoVaTenThiSinh%>" required>
                                </div>

                                <div class="col-md-4">
                                    <label for="soDienThoai" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="soDienThoai" name="soDienThoai" value="<%=soDienThoai%>"required>
                                </div>
                                <div class="col-md-4">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<%=email%>"required>
                                </div>

                                <div class="col-md-4">
                                    <label for="gioiTinh" class="form-label">Giới tính</label>
                                    <select class="form-select" aria-label="Default select example" name="gioiTinh"required>
                                        <option <% if (!gioiTinh.equals("Nam") && !gioiTinh.equals("Nữ")) {
                                                out.print("selected");
                                            } %> >Lựa chọn</option>
                                        <option value="Nam" <% if (gioiTinh.equals("Nam")) {
                                                out.print("selected");
                                            } %>>Nam</option>
                                                <option value="Nữ" <% if (gioiTinh.equals("Nữ"))
                                                out.print("selected");%>>Nữ</option>

                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="ngaySinh" class="form-label">Ngày sinh</label>
                                    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>"required>
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="noiSinh" class="form-label">Nơi sinh</label>
                                    <input type="text" class="form-control" id="noiSinh" name="noiSinh" value="Chưa có">
                                </div>
                                <div class="col-md-4">
                                    <label for="cccd" class="form-label">Số CMND/CCCD</label>
                                    <input type="number" class="form-control" id="cccd" name="cccd" value="<%=cccd%>" minlength="12" maxlength="12"required>
                                </div> 
                                <div class="col-md-4">
                                    <label for="ngayCap" class="form-label">Cấp ngày</label>
                                    <input type="date" class="form-control" id="ngayCap" name="ngayCap" value="<%=ngayCap%>"required>
                                </div>
                                <div class="col-md-4">
                                    <label for="noiCap" class="form-label">Nơi cấp</label>
                                    <select class="form-select" aria-label="Default select example" name="noiCap"required>
                                        <option <% if (!noiCap.equals("Cục Cảnh sát quản lý hành chính về trật tự xã hội")) {
                                                out.print("selected");
                                            } %> >Lựa chọn</option>
                                        <option value="Cục Cảnh sát quản lý hành chính về trật tự xã hội" <% if (noiCap.equals("Cục Cảnh sát quản lý hành chính về trật tự xã hội")) {
                                                out.print("selected");
                                            }%>>Cục Cảnh sát quản lý hành chính về trật tự xã hội</option>

                                    </select>
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="quocTich" class="form-label">Quốc tịch</label>
                                    <input type="text" class="form-control" id="quocTich" name="quocTich" value="Chưa có">
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="danToc" class="form-label">Dân tộc</label>
                                    <input type="text" class="form-control" id="danToc" name="danToc" value="Chưa có">
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="tonGiao" class="form-label">Tôn giáo</label>
                                    <input type="text" class="form-control" id="tonGiao" name="tonGiao" value="Chưa có">
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="hoKhauThuongTru" class="form-label">Hộ khẩu thường trú</label>
                                    <input type="text" class="form-control" id="hoKhauThuongTru" name="hoKhauThuongTru" value="Chưa có">
                                </div>

                                <div class="col-md-12">
                                    <div class="titleinfo">Thông tin trường thpt</div>
                                </div>
                                <div class="col-md-12">
                                    <label for="maTruong" class="form-label">Trường THPT</label>
                                    <select class="form-select" id="maTruong" aria-label="Default select example" value="<%=maTruong%>" name="maTruong"data-live-search="true" required >
                                        <option selected>Lựa chọn</option>
                                        <%
                                            TruongDAO truongDAO = new TruongDAO();
                                            ArrayList<Truong> ketQua = truongDAO.getListTruong();
                                            for (Truong truong : ketQua) {
                                        %>
                                        <option value="<%=truong.getMaTruong()%>"><%=truong.getMaTruong()%> - <%=truong.getTenTruong()%> - <%=truong.getHuyenTruong()%> - <%=truong.getTinhTruong()%></option>
                                        <%}%>

                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="traCuuMaTruong" class="form-label">Vui lòng tra cứu mã trường để nhập chính xác:</label>
                                    <a class="btn btn-primary" href="thisinh-truong.jsp" target="_blank" role="button">Tra cứu mã trường</a>
                                </div>
                                <div class="col-md-4">
                                    <label for="namTotNghiep" class="form-label">Năm tốt nghiệp</label>
                                    <input type="number" class="form-control" id="namTotNghiep" name="namTotNghiep" value="<%=namTotNghiep%>"required max="2023">
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="xepLoaiTotNghiep" class="form-label">Xếp loại tốt nghiệp</label>
                                    <input type="text" class="form-control" id="xepLoaiTotNghiep" name="xepLoaiTotNghiep" value="Chưa có">
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="loaiHanhKiem" class="form-label">Loại hạnh kiểm</label>
                                    <input type="text" class="form-control" id="loaiHanhKiem" name="loaiHanhKiem" value="Chưa có">
                                </div>
                                <div class="col-md-4" hidden>
                                    <label for="loaiHocLuc" class="form-label">Loại học lực</label>
                                    <input type="text" class="form-control" id="loaiHocLuc" name="loaiHocLuc" value="Chưa có">
                                </div>

                                <div class="col-md-12">
                                    <div class="titleinfo">Thông tin liên hệ</div>
                                </div>
                                <div class="col-md-4">
                                    <label for="tinhThanh" class="form-label">Tỉnh/Thành phố</label>
                                    <input type="text" class="form-control" id="tinhThanh" name="tinhThanh" value="<%=tinhThanh%>" placeholder="Hà Tĩnh" onchange="hoanThienDiaChi()"required>
                                </div>
                                <div cl
                                     <div class="col-md-4">
                                    <label for="quanHuyen" class="form-label">Quận/Huyện</label>
                                    <input type="text" class="form-control" id="quanHuyen" name="quanHuyen" value="<%=quanHuyen%>" placeholder="Thành Phố Hà Tĩnh" onchange="hoanThienDiaChi()"required>
                                </div>
                                <div class="col-md-4">
                                    <label for="phuongXa" class="form-label">Phường/Xã </label>
                                    <input type="text" class="form-control" id="phuongXa" name="phuongXa" value="<%=phuongXa%>" placeholder="Quang Trung"onchange="hoanThienDiaChi()" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="soNha" class="form-label">Số nhà/tên đường</label>
                                    <input type="text" class="form-control" id="soNha" name="soNha" value="<%=soNha%>" placeholder="Số 3A, Ngô Tất Tố" onchange="hoanThienDiaChi()" required>
                                </div>
                                <div class="col-md-12">
                                    <label for="diaChiDayDu" class="form-label">Địa chỉ đầy đủ</label>
                                    <input type="text" class="form-control" id="diaChiDayDu" name="diaChiDayDu" placeholder="Số 3A, Ngô Tất Tố - Quang Trung - Thành Phố Hà Tĩnh - Hà Tĩnh" value="<%=diaChiDayDu%>"  required>
                                </div>


                                <div class="col-md-12">
                                    <div class="titleinfo">Thông tin đăng ký</div>
                                </div>
                                <div class="col-md-4">
                                    <label for="noiDangKy" class="form-label">Nơi đăng ký dự tuyển</label>
                                    <select class="form-select" aria-label="Default select example" name="noiDangKy" id="noiDangKy" required >
                                        <option <% if (!noiDangKy.equals("Hà Nội") && !noiDangKy.equals("Đà Nẵng") && !noiDangKy.equals("Quy Nhơn") && !noiDangKy.equals("TP.Hồ Chí Minh") && !noiDangKy.equals("Cần Thơ")) {
                                                out.print("selected");
                                            } %> >Lựa chọn</option>
                                        <option value="Hà Nội" <% if (noiDangKy.equals("Hà Nội")) {
                                                out.print("selected");
                                            } %>>Hà Nội</option>
                                        <option  value="Đà Nẵng" <% if (noiDangKy.equals("Đà Nẵng")) {
                                                out.print("selected");
                                            } %>>Đà Nẵng</option>
                                        <option value="Quy Nhơn" <% if (noiDangKy.equals("Quy Nhơn")) {
                                                out.print("selected");
                                            } %>>Quy Nhơn</option>
                                        <option value="TP.Hồ Chí Minh" <% if (noiDangKy.equals("TP.Hồ Chí Minh")) {
                                                out.print("selected");
                                            } %>>TP.Hồ Chí Minh</option>
                                        <option value="Cần Thơ" <% if (noiDangKy.equals("Cần Thơ")) {
                                                out.print("selected");
                                            }%>>Cần Thơ</option>



                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="maNganh" class="form-label">Chuyên ngành đăng ký</label>
                                    <select class="form-select" aria-label="Default select example" value="<%=maTruong%>" name="maNganh"data-live-search="true" required >
                                        <option selected>Lựa chọn</option>
                                        <%
                                            NganhDAO nganhDAO = new NganhDAO();
                                            ArrayList<Nganh> ketQua2 = nganhDAO.getListNganh();
                                            for (Nganh nganh : ketQua2) {
                                        %>
                                        <option value="<%=nganh.getMaNganh()%>"><%=nganh.getTenNganh()%></option>


                                        <%}%>

                                    </select>
                                </div>


                                <div class="col-md-4">
                                    <label for="hinhThucDangKy" class="form-label">Hình thức xét tuyển</label>
                                    <select class="form-select" aria-label="Default select example" name="hinhThucDangKy" id="hinhThucDangKy" onchange="tinhLePhi()"required >
                                        <option <% if (!hinhThucDangKy.equals("Xét tuyển học bạ") && !hinhThucDangKy.equals("Xét tuyển điểm thi THPT Quốc Gia") && !hinhThucDangKy.equals("Xét tuyển học bạ + Thi Học bổng")) {
                                                out.print("selected");
                                            } %> >Lựa chọn</option>
                                        <option value="Xét tuyển học bạ" <% if (hinhThucDangKy.equals("Xét tuyển học bạ")) {
                                                out.print("selected");
                                            } %>>Xét tuyển học bạ</option>
                                        <option disabled value="Xét tuyển điểm thi THPT Quốc Gia" <% if (hinhThucDangKy.equals("Xét tuyển điểm thi THPT Quốc Gia")) {
                                                out.print("selected");
                                            } %>>Xét tuyển điểm thi THPT Quốc Gia</option>
                                        <option value="Xét tuyển học bạ + Thi Học bổng" <% if (hinhThucDangKy.equals("Xét tuyển học bạ + Thi Học bổng")) {
                                                out.print("selected");
                                            } %>>Xét tuyển học bạ + Thi Học bổng</option>



                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="kyDuTuyen" class="form-label">Kỳ dự tuyển</label>
                                    <select class="form-select" aria-label="Default select example" name="kyDuTuyen" id="kyDuTuyen" required >

                                        <option value="Kỳ dự tuyển 2023" <% if (kyDuTuyen.equals("Kỳ dự tuyển 2023")) {
                                                out.print("selected");
                                            } %>>Kỳ dự tuyển 2023</option>




                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="phuongThucDangKy" class="form-label">Phương Thức Đăng Ký</label>
                                    <select class="form-select" aria-label="Default select example" name="phuongThucDangKy" id="phuongThucDangKy" required >

                                        <option value="Học bạ THPT Top40" <% if (phuongThucDangKy.equals("Học bạ THPT Top40")) {
                                                out.print("selected");
                                            } %>>Học bạ THPT Top40</option>




                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="xepHang" class="form-label">Xết hạng SchoolRank</label>
                                    <select class="form-select" aria-label="Default select example" name="xepHang" id="xepHang" required >
                                        <option <% if (!xepHang.equals("TOP10") && !xepHang.equals("TOP20") && !xepHang.equals("TOP30") && !xepHang.equals("TOP40") && !xepHang.equals("TOP50")) {
                                                out.print("selected");
                                            } %> >Lựa chọn</option>
                                        <option value="TOP10" <% if (xepHang.equals("TOP10")) {
                                                out.print("selected");
                                            } %>>TOP10</option>
                                        <option  value="TOP20" <% if (xepHang.equals("TOP20")) {
                                                out.print("selected");
                                            } %>>TOP20</option>
                                        <option value="TOP30" <% if (xepHang.equals("TOP30")) {
                                                out.print("selected");
                                            } %>>TOP30</option>
                                        <option value="TOP40" <% if (xepHang.equals("TOP40")) {
                                                out.print("selected");
                                            } %>>TOP40</option>
                                        <option value="TOP50" <% if (xepHang.equals("TOP50")) {
                                                out.print("selected");
                                            }%>>TOP50</option>



                                    </select>
                                </div>

                                <div class="col-md-4" hidden="">
                                    <label for="lePhiDangKy" class="form-label">Lệ phí cần đóng</label>
                                    <input type="text" class="form-control" id="lePhiDangKy" name="lePhiDangKy"value="" >
                                </div>
                                <div class="col-md-4">
                                    <label for="lePhiDangKy1" class="form-label">Lệ phí cần đóng</label>
                                    <input disabled="" type="text" class="form-control" id="lePhiDangKy1" name="lePhiDangKy1"value="" >
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="anhCCCDMatTruoc" class="form-label">Ảnh CCCD Mặt trước</label>
                                    <input type="file" class="form-control" id="anhCCCDMatTruoc" name="anhCCCDMatTruoc" value="">
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="anhCCCDMatSau" class="form-label">Ảnh CCCD Mặt sau</label>
                                    <input type="file" class="form-control" id="anhCCCDMatSau" name="anhCCCDMatSau"value="">
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="anhSchoolRank" class="form-label">Ảnh SchoolRank</label>
                                    <input type="file" class="form-control" id="anhSchoolRank" name="anhSchoolRank"value="">
                                </div> 
                                <div class="col-md-4 hidden">
                                    <label for="anhBangDiem11" class="form-label">Ảnh Bảng điểm cả năm lớp 11</label>
                                    <input type="file" class="form-control" id="anhBangDiem11" name="anhBangDiem11"value="">
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="anhBangDiem12" class="form-label">Ảnh Bảng điểm học kỳ 1 lớp 12</label>
                                    <input type="file" class="form-control" id="anhBangDiem12" name="anhBangDiem12"value="">
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="tinhTrangThanhToanDangKy" class="form-label">Tình trạng thanh toán đăng ký</label>
                                    <select class="form-select" aria-label="Default select example" name="tinhTrangThanhToanDangKy" id="tinhTrangThanhToanDangKy" >
                                        <option value="Chưa thanh toán" selected>Chưa thanh toán</option>
                                        <option  value="Đã thanh toán">Đã thanh toán</option>                                       
                                    </select>
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="tinhTrangDangKy" class="form-label">Tình trạng đăng ký</label>
                                    <select class="form-select" aria-label="Default select example" name="tinhTrangDangKy" id="tinhTrangDangKy">

                                        <option value="Đăng ký mới"selected>Đăng ký mới</option>
                                        <option value="Đăng ký thành công" >Đăng ký thành công</option>
                                        <option  value="Đã ghi danh">Đã ghi danh</option>     
                                        <option  value="Trúng tuyển Đại học FPT">Trúng tuyển Đại học FPT</option> 
                                    </select>
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="tinhTrangHoSo" class="form-label">Tình trạng hồ sơ</label>
                                    <select class="form-select" aria-label="Default select example" name="tinhTrangHoSo" id="tinhTrangHoSo">
                                        <option value="Đang xem xét" selected>Đang xem xét</option>
                                        <option  value="Đã phê duyệt">Đã phê duyệt</option>     

                                    </select>
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="tinhTrangNhapHoc" class="form-label">Tình trạng nhập học</label>
                                    <select class="form-select" aria-label="Default select example" name="tinhTrangNhapHoc" id="tinhTrangNhapHoc">
                                        <option value="Đang suy nghĩ" selected>Đang suy nghĩ</option>
                                        <option  value="Đã đăng ký nhập học">Đã đăng ký nhập học</option>     

                                    </select>
                                </div>
                                <div class="col-md-4 hidden">
                                    <label for="tinhTrangThanhToanNhapHoc" class="form-label">Tình trạng thanh toán nhập học</label>
                                    <select class="form-select" aria-label="Default select example" name="tinhTrangThanhToanNhapHoc" id="tinhTrangThanhToanNhapHoc" >
                                        <option value="Chưa thanh toán" selected>Chưa thanh toán</option>
                                        <option  value="Đã thanh toán">Đã thanh toán</option>                                       
                                    </select>
                                </div>



                                <div class="col-md-12">
                                    <br>

                                    <input class="btn btn-primary" type="submit" value="Đăng ký xét tuyển">
                                </div>



                            </div>
                            <br>

                        </form>






                    </div>

                    <!-- </div> -->
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <script>
                                        function tinhLePhi() {
                                            var loaiDK = document.getElementById("hinhThucDangKy").value;
                                            var lePhiDangKy = document.getElementById("lePhiDangKy");
                                            var lePhiDangKy1 = document.getElementById("lePhiDangKy1");
                                            if (loaiDK == "Xét tuyển học bạ") {
                                                lePhiDangKy.value = "200000";
                                                lePhiDangKy1.value = "200000"
                                            }
                                            if (loaiDK == "Xét tuyển học bạ + Thi Học bổng") {
                                                lePhiDangKy.value = "400000";
                                                lePhiDangKy1.value = "400000"

                                            }
                                            if (loaiDK != "Xét tuyển học bạ + Thi Học bổng" && loaiDK != "Xét tuyển học bạ") {
                                                lePhiDangKy.value = "0";
                                                lePhiDangKy1.value = "0"

                                            }
                                        }
                                        function hoanThienDiaChi() {
                                            var tinh = document.getElementById("tinhThanh").value;
                                            var huyen = document.getElementById("quanHuyen").value;
                                            var xa = document.getElementById("phuongXa").value;
                                            var soNha = document.getElementById("soNha").value;

                                            var diaChiDayDu = document.getElementById("diaChiDayDu");
                                            diaChiDayDu.value = soNha + " - " + xa + " - " + huyen + " - " + tinh;

                                        }








        </script>




        <%@include file="include/thisinh-footer.jsp" %>
    </body>
</html>
