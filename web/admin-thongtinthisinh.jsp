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
                        <c:set var="c" value="${requestScope.data}"/>
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
                                    <li class="nav-item">
                                        <a class="btn btn-warning" href="admin?hanhDong=update&maThiSinh=${c.maThiSinh}">Cập nhật</a>
                                    </li>


                                </ul>
                            </nav>
                            
                            <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
                                <h4 id="scrollspyHeading1">Thông tin cá nhân</h4>
                                <table class="table table-bordered table-responsive">
                                    <tbody>
                                        <tr>
                                            <td style="width:30%">Họ & tên</td>
                                            <td>${c.hoVaTenThiSinh}</td>
                                        </tr>
                                        <tr>
                                            <td>CMND/CCCD</td>
                                            <td>${c.cccd}</td>
                                        </tr>
                                        <tr>
                                            <td>Di động</td>
                                            <td>${c.soDienThoai}</td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>${c.email}</td>
                                        </tr>
                                        <tr>
                                            <td>Giới tính</td>
                                            <td>${c.gioiTinh}</td>
                                        </tr>
                                        <tr>
                                            <td>Ngày sinh</td>
                                            <td>${c.ngaySinh}</td>
                                        </tr>
                                        <tr>
                                            <td>Nơi sinh</td>
                                            <td>${c.noiSinh}</td>
                                        </tr>
                                        <tr>
                                            <td>Ngày cấp</td>
                                            <td>${c.ngayCap}</td>
                                        </tr>
                                        <tr>
                                            <td>Nơi cấp</td>
                                            <td>${c.noiCap}</td>
                                        </tr>
                                        <tr>
                                            <td>Quốc tịch</td>
                                            <td>${c.quocTich}</td>
                                        </tr>
                                        <tr>
                                            <td>Dân tộc</td>
                                            <td>${c.danToc}</td>
                                        </tr>
                                        <tr>
                                            <td>Tôn giáo</td>
                                            <td>${c.tonGiao}</td>
                                        </tr>
                                        <tr>
                                            <td>Hộ khẩu thường trú</td>
                                            <td>${c.hoKhauThuongTru}</td>
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
                                            <td>${c.maTruong}</td>
                                        </tr>
                                        <tr>
                                            <td>Năm tốt nghiệp THPT</td>
                                            <td>${c.namTotNghiep}</td>
                                        </tr>
                                        <tr>
                                            <td>Xếp loại tốt nghiệp THPT</td>
                                            <td>${c.xepLoaiTotNghiep}</td>
                                        </tr>
                                        <tr>
                                            <td>Khu vực</td>
                                            <td>Chưa đồng bộ</td>
                                        </tr>
                                        <tr>
                                            <td>Loại hạnh kiểm</td>
                                            <td>${c.loaiHanhKiem}</td>
                                        </tr>
                                        <tr>
                                            <td>Loại học lực</td>
                                            <td>${c.loaiHocLuc}</td>
                                        </tr>

                                    </tbody>
                                </table>

                                <h4 id="scrollspyHeading3">Thông tin liên hệ</h4>
                                <table class="table table-bordered table-responsive">
                                    <tbody>
                                        <tr>
                                            <td style="width: 30%">Họ & tên người liên hệ</td>
                                            <td>${c.hoVaTenThiSinh}</td>
                                        </tr>
                                        <tr>
                                            <td>Số điện thoại</td>
                                            <td>${c.soDienThoai}</td>
                                        </tr>
                                        <tr>
                                            <td>Tỉnh/Thành phố	</td>
                                            <td>${c.tinhThanh}</td>
                                        </tr>
                                        <tr>
                                            <td>Quận / Huyện</td>
                                            <td>${c.quanHuyen}</td>
                                        </tr>
                                        <tr>
                                            <td>Phường/Xã</td>
                                            <td>${c.phuongXa}</td>
                                        </tr>
                                        <tr>
                                            <td>Số nhà/tên đường</td>
                                            <td>${c.soNha}</td>
                                        </tr>
                                        <tr>
                                            <td>Địa chỉ đầy đủ</td>
                                            <td>${c.diaChiDayDu}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h4 id="scrollspyHeading4">Thông tin đăng ký</h4>
                                <table class="table table-bordered table-responsive">
                                    <tbody>
                                        <tr>
                                            <td style="width: 30%">Nơi đăng ký dự tuyển</td>
                                            <td>${c.noiDangKy}</td>
                                        </tr>
                                        <tr>
                                            <td>Chuyên ngành đăng ký</td>
                                            <td>${c.maNganh}</td>
                                        </tr>
                                        <tr>
                                            <td>Hình thức xét tuyển</td>
                                            <td>${c.hinhThucDangKy}</td>
                                        </tr>
                                        <tr>
                                            <td>Kỳ dự tuyển</td>
                                            <td>${c.kyDuTuyen}</td>
                                        </tr>
                                        <tr>
                                            <td>Phương Thức Đăng Ký</td>
                                            <td>${c.phuongThucDangKy}</td>
                                        </tr>
                                        <tr>
                                            <td>Xếp hạng SchoolRank</td>
                                            <td>${c.xepHang}</td>
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
                                            <td>${c.lePhiDangKy}</td>
                                        </tr>
                                        <tr>
                                            <td>Tình trạng thanh toán đăng ký</td>
                                            <td>${c.tinhTrangThanhToanDangKy}</td>
                                        </tr>
                                        <tr>
                                            <td>Tình trạng đăng ký</td>
                                            <td>${c.tinhTrangDangKy}</td>
                                        </tr>
                                        <tr>
                                            <td>Tình trạng hồ sơ</td>
                                            <td>${c.tinhTrangHoSo}</td>
                                        </tr>
                                        <tr>
                                            <td>Tình trạng nhập học</td>
                                            <td>${c.tinhTrangNhapHoc}</td>
                                        </tr>
                                        <tr>
                                            <td>Tình trạng thanh toán nhập học</td>
                                            <td>${c.tinhTrangThanhToanNhapHoc}</td>
                                        </tr>
                                        

                                    </tbody>
                                </table>





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
