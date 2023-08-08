<%-- 
    Document   : admin-thisinh
    Created on : 15 thg 5, 2023, 21:42:10
    Author     : phangiabao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Date"%>
<%@page import="model.Nganh"%>
<%@page import="database.NganhDAO"%>
<%@page import="database.TruongDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Truong"%>
<%@page import="model.ThiSinh"%>
<%@page import="database.ThiSinhDAO"%>
<%@page import="model.TaiKhoanAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HỆ THỐNG ĐĂNG KÝ TUYỂN SINH ĐH FPT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
        <script defer src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
        <link rel="stylesheet" href="css/css-style.css"/>
        <link href="css/admin-css.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>




    </head>
    <body class="sb-nav-fixed">
        <%

            Object obj = session.getAttribute("taiKhoanAdmin");
            TaiKhoanAdmin taiKhoanAdmin = null;
            if (obj != null) {
                taiKhoanAdmin = (TaiKhoanAdmin) obj;
            }

            if (taiKhoanAdmin == null) {
        %>
        <div class="alert alert-danger container mt-4" role="alert">
            <h2>Bạn chưa đăng nhập vào hệ thống</h2>

            <a href="admin-login.jsp">Đăng nhập</a>
        </div>
        <%} else {%>
        <%@include file="include/admin-menutop.jsp" %>
        <div id="layoutSidenav">
            <%@include file="include/admin-menuleft.jsp" %>
            <div id="layoutSidenav_content">

                <div class="container">
                    <div class="row ">
                        <!-- <div class="col-md-12 "> -->

                        <div class="col-md-12">


                            <!-- bang tinh trang hò so-->
                            <nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3 sticky-top border-bottom" style="padding-top: 50px">
                                <a class="navbar-brand" href="#"><div class="titleinfo">Thông tin đăng ký</div></a>
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#scrollspyHeading1">Thông tin cá nhân</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#scrollspyHeading2">Thông tin THPT</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#scrollspyHeading3">Thông tin liên hệ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#scrollspyHeading4">Thông tin đăng ký</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#scrollspyHeading5">Thông tin xét tuyển</a>
                                    </li>


                                </ul>
                            </nav>
                            <c:set var="c" value="${requestScope.data}"/>
                            <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
                                <form action="admin" method="post">
                                    <input type="hidden" name="hanhDong" value="updateSubmit"/>

                                    <h4 id="scrollspyHeading1">Thông tin cá nhân</h4>
                                    <table class="table table-bordered table-responsive">
                                        <tbody>
                                            <tr>
                                                <td style="width:30%">Họ & tên</td>
                                                <td>
                                                    <input type="text" class="form-control" id="hoVaTenThiSinh" name="hoVaTenThiSinh" value="${c.hoVaTenThiSinh}" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>CMND/CCCD</td>
                                                <td>
                                                    <input type="number" class="form-control" id="cccd" name="cccd" value="${c.cccd}" minlength="12" maxlength="12">

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Di động</td>
                                                <td>
                                                    <input type="tel" class="form-control" id="soDienThoai" name="soDienThoai" value="${c.soDienThoai}">

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td>
                                                    <input type="email" class="form-control" id="email" name="email" value="${c.email}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Giới tính</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="gioiTinh">
                                                        <option>Lựa chọn</option>
                                                        <option value="Nam" ${c.gioiTinh=='Nam'?'selected':''}>Nam</option>
                                                        <option value="Nữ" ${c.gioiTinh=='Nữ'?'selected':''}>Nữ</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ngày sinh</td>
                                                <td>
                                                    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="${c.ngaySinh}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Nơi sinh</td>
                                                <td>
                                                    <input type="text" class="form-control" id="noiSinh" name="noiSinh" value="${c.noiSinh}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ngày cấp</td>
                                                <td>
                                                    <input type="date" class="form-control" id="ngayCap" name="ngayCap" value="${c.ngayCap}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Nơi cấp</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="noiCap">
                                                        <option>Lựa chọn</option>
                                                        <option value="Cục Cảnh sát quản lý hành chính về trật tự xã hội" ${c.noiCap=='Cục Cảnh sát quản lý hành chính về trật tự xã hội'?'selected':''}>Cục Cảnh sát quản lý hành chính về trật tự xã hội</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Quốc tịch</td>
                                                <td>
                                                    <input type="text" class="form-control" id="quocTich" name="quocTich" value="${c.quocTich}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Dân tộc</td>
                                                <td>
                                                    <input type="text" class="form-control" id="danToc" name="danToc" value="${c.danToc}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tôn giáo</td>
                                                <td>
                                                    <input type="text" class="form-control" id="tonGiao" name="tonGiao" value="${c.tonGiao}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hộ khẩu thường trú</td>
                                                <td>
                                                    <input type="text" class="form-control" id="hoKhauThuongTru" name="hoKhauThuongTru" value="${c.hoKhauThuongTru}">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h4 id="scrollspyHeading2">Thông tin THPT</h4>
                                    <table class="table table-bordered table-responsive">
                                        <tbody>
                                            <tr>
                                                <td style="width: 30%">Tỉnh/TP</td>
                                                <td>Chưa đồng bộ</td>
                                            </tr><tr>
                                                <td>Quận/Huyện</td>
                                                <td>Chưa đồng bộ</td>
                                            </tr>        
                                            <tr>
                                                <td>Trường THPT</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="maTruong" id="maTruong" >
                                                        <option value="">Lựa chọn</option>
                                                        <c:forEach items="${requestScope.truong}" var="e">
                                                            <option value="${e.maTruong}" ${c.maTruong== e.tenTruong?'selected':''}>${e.tenTruong}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Năm tốt nghiệp THPT</td>
                                                <td>
                                                    <input type="number" class="form-control" id="namTotNghiep" name="namTotNghiep" value="${c.namTotNghiep}"required max="2023">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Xếp loại tốt nghiệp THPT</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="xepLoaiTotNghiep" id="xepLoaiTotNghiep" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Giỏi" ${c.xepLoaiTotNghiep=='Giỏi'?'selected':''}>Giỏi</option>
                                                        <option value="Khá" ${c.xepLoaiTotNghiep=='Khá'?'selected':''}>Khá</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Khu vực</td>
                                                <td>Chưa đồng bộ</td>
                                            </tr>
                                            <tr>
                                                <td>Loại hạnh kiểm</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="loaiHanhKiem" id="loaiHanhKiem" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Tốt" ${c.loaiHanhKiem=='Tốt'?'selected':''}>Tốt</option>
                                                        <option value="Khá" ${c.loaiHanhKiem=='Khá'?'selected':''}>Khá</option>
                                                        <option value="Trung bình" ${c.loaiHanhKiem=='Trung bình'?'selected':''}>Trung bình</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Loại học lực</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="loaiHocLuc" id="loaiHocLuc" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Giỏi" ${c.loaiHocLuc=='Giỏi'?'selected':''}>Giỏi</option>
                                                        <option value="Khá" ${c.loaiHocLuc=='Khá'?'selected':''}>Khá</option>
                                                        <option value="Trung bình" ${c.loaiHocLuc=='Trung bình'?'selected':''}>Trung bình</option>
                                                    </select>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>

                                    <h4 id="scrollspyHeading3">Thông tin liên hệ</h4>
                                    <table class="table table-bordered table-responsive">
                                        <tbody>
                                            <tr>
                                                <td style="width: 30%">Họ & tên người liên hệ</td>
                                                <td><input readonly="" type="text" class="form-control" id="hoVaTenThiSinh" name="hoVaTenThiSinh" value="${c.hoVaTenThiSinh}" ></td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <td><input readonly="" type="tel" class="form-control" id="soDienThoai" name="soDienThoai" value="${c.soDienThoai}"></td>
                                            </tr>
                                            <tr>
                                                <td>Tỉnh/Thành phố	</td>
                                                <td>
                                                    <input type="text" class="form-control" id="tinhThanh" name="tinhThanh" value="${c.tinhThanh}" placeholder="Hà Tĩnh" onchange="hoanThienDiaChi()">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Quận / Huyện</td>
                                                <td>
                                                    <input type="text" class="form-control" id="quanHuyen" name="quanHuyen" value="${c.quanHuyen}" placeholder="Thành Phố Hà Tĩnh" onchange="hoanThienDiaChi()">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Phường/Xã</td>
                                                <td>
                                                    <input type="text" class="form-control" id="phuongXa" name="phuongXa" value="${c.phuongXa}" placeholder="Quang Trung"onchange="hoanThienDiaChi()" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Số nhà/tên đường</td>
                                                <td>
                                                    <input type="text" class="form-control" id="soNha" name="soNha" value="${c.soNha}" placeholder="Số 3A, Ngô Tất Tố" onchange="hoanThienDiaChi()" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ đầy đủ</td>
                                                <td>
                                                    <input type="text" class="form-control" id="diaChiDayDu" name="diaChiDayDu" placeholder="Số 3A, Ngô Tất Tố - Quang Trung - Thành Phố Hà Tĩnh - Hà Tĩnh" value="${c.diaChiDayDu}"  >
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h4 id="scrollspyHeading4">Thông tin đăng ký</h4>
                                    <table class="table table-bordered table-responsive">
                                        <tbody>
                                            <tr>
                                                <td style="width: 30%">Nơi đăng ký dự tuyển</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="noiDangKy" id="noiDangKy" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Hà Nội" ${c.noiDangKy=='Hà Nội'?'selected':''}>Hà Nội</option>
                                                        <option value="Đà Nẵng" ${c.noiDangKy=='Đà Nẵng'?'selected':''}>Đà Nẵng</option>
                                                        <option value="Quy Nhơn" ${c.noiDangKy=='Quy Nhơn'?'selected':''}>Quy Nhơn</option>
                                                        <option value="TP.Hồ Chí Minh" ${c.noiDangKy=='TP.Hồ Chí Minh'?'selected':''}>TP.Hồ Chí Minh</option>
                                                        <option value="Cần Thơ" ${c.noiDangKy=='Cần Thơ'?'selected':''}>Cần Thơ</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Chuyên ngành đăng ký</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="maNganh" id="maNganh" >
                                                        <option value="">Lựa chọn</option>
                                                        <c:forEach items="${requestScope.nganh}" var="d">
                                                            <option value="${d.maNganh}" ${c.maNganh== d.tenNganh?'selected':''}>${d.tenNganh}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hình thức xét tuyển</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="hinhThucDangKy" id="hinhThucDangKy" onlick="tinhLePhi()">
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Xét tuyển học bạ" ${c.hinhThucDangKy=='Xét tuyển học bạ'?'selected':''}>Xét tuyển học bạ</option>
                                                        <option value="Xét tuyển điểm thi THPT Quốc Gia" ${c.hinhThucDangKy=='Xét tuyển điểm thi THPT Quốc Gia'?'selected':''}>Xét tuyển điểm thi THPT Quốc Gia</option>
                                                        <option value="Xét tuyển học bạ + Thi Học bổng" ${c.hinhThucDangKy=='Xét tuyển học bạ + Thi Học bổng'?'selected':''}>Xét tuyển học bạ + Thi Học bổng</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Kỳ dự tuyển</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="kyDuTuyen" id="kyDuTuyen" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Kỳ dự tuyển 2023" ${c.kyDuTuyen=='Kỳ dự tuyển 2023'?'selected':''}>Kỳ dự tuyển 2023</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Phương Thức Đăng Ký</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="phuongThucDangKy" id="phuongThucDangKy" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Học bạ THPT Top40" ${c.phuongThucDangKy=='Học bạ THPT Top40'?'selected':''}>Học bạ THPT Top40</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Xếp hạng SchoolRank</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="xepHang" id="xepHang" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="TOP10" ${c.xepHang=='TOP10'?'selected':''}>TOP10</option>
                                                        <option value="TOP20" ${c.xepHang=='TOP20'?'selected':''}>TOP20</option>
                                                        <option value="TOP30" ${c.xepHang=='TOP30'?'selected':''}>TOP30</option>
                                                        <option value="TOP40" ${c.xepHang=='TOP40'?'selected':''}>TOP40</option>
                                                        <option value="TOP50" ${c.xepHang=='TOP50'?'selected':''}>TOP50</option>
                                                    </select>
                                                </td>
                                            </tr>


                                        </tbody>
                                    </table>
                                    <div class="row">
                                        <div class="col-md-4 ">
                                            <label for="anhCCCDMatTruoc" class="form-label">Ảnh CCCD Mặt trước</label>
                                            <div style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                <img class="img-fluid" src="${c.anhCCCDMatTruoc==null?'thisinh/no-img.jpeg':c.anhCCCDMatTruoc}" alt="Ảnh CCCD Mặt trước"/>

                                            </div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <label for="anhCCCDMatSau" class="form-label">Ảnh CCCD Mặt sau</label>
                                            <div style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">

                                                <img class=" img-fluid" src="${c.anhCCCDMatSau==null?'thisinh/no-img.jpeg':c.anhCCCDMatSau}" alt="Ảnh CCCD Mặt sau"/>
                                            </div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <label for="anhSchoolRank" class="form-label">Ảnh SchoolRank</label>
                                            <div style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">

                                                <img class="img-fluid " src="${c.anhSchoolRank==null?'thisinh/no-img.jpeg':c.anhSchoolRank}" alt="Ảnh SchoolRank"/>
                                            </div> 
                                        </div>
                                        <div class="col-md-4 ">
                                            <label for="anhBangDiem11" class="form-label">Ảnh Bảng điểm cả năm lớp 11</label>
                                            <div style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                <img class="img-fluid " src="${c.anhBangDiem11==null?'thisinh/no-img.jpeg':c.anhBangDiem11}" alt="Ảnh bảng điểm 11"/>
                                            </div>
                                        </div>

                                        <div class="col-md-4 ">
                                            <label for="anhBangDiem12" class="form-label">Ảnh Bảng điểm học kỳ 1 lớp 12</label>
                                            <div style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                <img class="img-fluid " src="${c.anhBangDiem12==null?'thisinh/no-img.jpeg':c.anhBangDiem12}" alt="Ảnh bảng điểm 12"/>
                                            </div>
                                        </div>
                                    </div>

                                    <h4 id="scrollspyHeading5">Thông tin xét tuyển</h4>
                                    <table class="table table-bordered table-responsive">
                                        <tbody>
                                            <tr>
                                                <td style="width: 30%">Lệ phí cần đóng</td>
                                                <td>
                                                    <input  type="text" class="form-control" id="lePhiDangKy1" name="lePhiDangKy1"value="${c.lePhiDangKy}" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tình trạng thanh toán đăng ký</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="tinhTrangThanhToanDangKy" id="tinhTrangThanhToanDangKy" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Chưa thanh toán" ${c.tinhTrangThanhToanDangKy=='Chưa thanh toán'?'selected':''}>Chưa thanh toán</option>
                                                        <option value="Đã thanh toán" ${c.tinhTrangThanhToanDangKy=='Đã thanh toán'?'selected':''}>Đã thanh toán</option>

                                                    </select>
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tình trạng đăng ký</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="tinhTrangDangKy" id="tinhTrangDangKy" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Đăng ký mới" ${c.tinhTrangDangKy=='Đăng ký mới'?'selected':''}>Đăng ký mới</option>
                                                        <option value="Đăng ký thành công" ${c.tinhTrangDangKy=='Đăng ký thành công'?'selected':''}>Đăng ký thành công</option>
                                                        <option value="Đã ghi danh" ${c.tinhTrangDangKy=='Đã ghi danh'?'selected':''}>Đã ghi danh</option>
                                                        <option value="Trúng tuyển Đại học FPT" ${c.tinhTrangDangKy=='Trúng tuyển Đại học FPT'?'selected':''}>Trúng tuyển Đại học FPT</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tình trạng hồ sơ</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="tinhTrangHoSo" id="tinhTrangHoSo" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Đang xem xét" ${c.tinhTrangHoSo=='Đang xem xét'?'selected':''}>Đang xem xét</option>
                                                        <option value="Đã phê duyệt" ${c.tinhTrangHoSo=='Đã phê duyệt'?'selected':''}>Đã phê duyệt</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tình trạng nhập học</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="tinhTrangNhapHoc" id="tinhTrangNhapHoc" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Đang suy nghĩ" ${c.tinhTrangNhapHoc=='Đang suy nghĩ'?'selected':''}>Đang suy nghĩ</option>
                                                        <option value="Đã đăng ký nhập học" ${c.tinhTrangNhapHoc=='Đã đăng ký nhập học'?'selected':''}>Đã đăng ký nhập học</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tình trạng thanh toán nhập học</td>
                                                <td>
                                                    <select class="form-select" aria-label="Default select example" name="tinhTrangThanhToanNhapHoc" id="tinhTrangThanhToanNhapHoc" >
                                                        <option value="">Lựa chọn</option>
                                                        <option value="Chưa thanh toán" ${c.tinhTrangThanhToanNhapHoc=='Chưa thanh toán'?'selected':''}>Chưa thanh toán</option>
                                                        <option value="Đã thanh toán" ${c.tinhTrangThanhToanNhapHoc=='Đã thanh toán'?'selected':''}>Đã thanh toán</option>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align:center ;"><button type="submit" class="btn btn-primary btn-block">Update</button></td>

                                            </tr>


                                        </tbody>
                                    </table>
                                </form>





                            </div>





                        </div>








                        <!-- </div> -->
                    </div>
                </div>
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
                </script>



                <!-- </div> -->
            </div>
        </div>



    </div>

    <%}%>

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>



</body>
</html>
