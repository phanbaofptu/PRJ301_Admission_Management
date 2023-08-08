<%-- 
    Document   : thisinh-thongtincanhan
    Created on : 16 thg 5, 2023, 16:27:48
    Author     : phangiabao
--%>

<%@page import="model.ThiSinh"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ĐĂNG KÝ TUYỂN SINH ĐH FPT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css-style.css">

    </head>

    <body>
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
                            <span>HỆ THỐNG ĐĂNG KÝ TUYỂN SINH ĐẠI HỌC FPT</span>
                            <span>HỆ CHÍNH QUY</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%
            Object obj = session.getAttribute("thiSinh");
            ThiSinh thiSinh = null;
            if (obj != null) {
                thiSinh = (ThiSinh) obj;
            }
            String noiSinh = thiSinh.getNoiSinh();
            noiSinh = ((noiSinh == null) ? "" : noiSinh);
            String quocTich = thiSinh.getQuocTich();
            quocTich = ((quocTich == null) ? "" : quocTich);
            String danToc = thiSinh.getDanToc();
            danToc = ((danToc == null) ? "" : danToc);
            String tonGiao = thiSinh.getTonGiao();
            tonGiao = ((tonGiao == null) ? "" : tonGiao);
            String hoKhauThuongTru = thiSinh.getHoKhauThuongTru();
            hoKhauThuongTru = ((hoKhauThuongTru == null) ? "" : hoKhauThuongTru);
            String xepLoaiTotNghiep = thiSinh.getXepLoaiTotNghiep();
            xepLoaiTotNghiep = ((xepLoaiTotNghiep == null) ? "" : xepLoaiTotNghiep);
            String loaiHanhKiem = thiSinh.getLoaiHanhKiem();
            loaiHanhKiem = ((loaiHanhKiem == null) ? "" : loaiHanhKiem);
            String loaiHocLuc = thiSinh.getLoaiHocLuc();
            loaiHocLuc = ((loaiHocLuc == null) ? "" : loaiHocLuc);

            if (thiSinh == null) {
        %>
        <div class="alert alert-danger container mt-4" role="alert">
            <h2>Bạn chưa đăng nhập vào hệ thống</h2>

            <a href="thisinh-login.jsp">Đăng nhập</a>
        </div>
        <%} else {%>
        

        <section class="processbar">
            <div class="container">
                <div class="row-fluid">
                    <!-- <div class="col-md-12 "> -->

                    <div data-title="Thanh tiến độ" data-intro="Thanh tiến độ đăng ký" class="process-bar-detail">
                        <div class="row mt-4">
                            <div class="col-md-3">
                                <%@include file="include/thisinh-menuleft.jsp" %>

                            </div>
                            <div class="col-md-9">

                                <div class="col-md-12">

                                    <div class="alert alert-danger" role="alert">
                                        Thí sinh kiểm tra thông tin, nếu có sai sót vui lòng báo cáo cho cán bộ tư vấn
                                    </div>
                                    <!-- bang tinh trang hò so-->
                                    <nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3 sticky-top border-bottom">
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


                                        </ul>
                                    </nav>
                                    <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
                                        <h4 id="scrollspyHeading1">Thông tin cá nhân</h4>
                                        <table class="table table-bordered table-responsive">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 300px">Họ & tên</td>
                                                    <td><%= thiSinh.getHoVaTenThiSinh()%></td>
                                                </tr>
                                                <tr>
                                                    <td>CMND/CCCD</td>
                                                    <td><%= thiSinh.getCccd()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Di động</td>
                                                    <td><%= thiSinh.getSoDienThoai()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Email</td>
                                                    <td><%= thiSinh.getEmail()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Giới tính</td>
                                                    <td><%= thiSinh.getGioiTinh()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Nơi sinh</td>
                                                    <td><%=noiSinh%></td>
                                                </tr>
                                                <tr>
                                                    <td>Ngày cấp</td>
                                                    <td><%= thiSinh.getNgayCap()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Nơi cấp</td>
                                                    <td><%= thiSinh.getNoiCap()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Quốc tịch</td>
                                                    <td><%= quocTich%></td>
                                                </tr>
                                                <tr>
                                                    <td>Dân tộc</td>
                                                    <td><%= danToc%></td>
                                                </tr>
                                                <tr>
                                                    <td>Tôn giáo</td>
                                                    <td><%= tonGiao%></td>
                                                </tr>
                                                <tr>
                                                    <td>Hộ khẩu thường trú</td>
                                                    <td><%= hoKhauThuongTru%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <h4 id="scrollspyHeading2">Thông tin THPT</h4>
                                        <table class="table table-bordered table-responsive">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 300px">Tỉnh/TP</td>
                                                    <td>Chưa đồng bộ</td>
                                                </tr><tr>
                                                    <td>Quận/Huyện</td>
                                                    <td>Chưa đồng bộ</td>
                                                </tr>        
                                                <tr>
                                                    <td>Trường THPT</td>
                                                    <td><%= thiSinh.getMaTruong()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Năm tốt nghiệp THPT</td>
                                                    <td><%= thiSinh.getNamTotNghiep()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Xếp loại tốt nghiệp THPT</td>
                                                    <td><%= xepLoaiTotNghiep%></td>
                                                </tr>
                                                <tr>
                                                    <td>Khu vực</td>
                                                    <td>Chưa đồng bộ</td>
                                                </tr>
                                                <tr>
                                                    <td>Loại hạnh kiểm</td>
                                                    <td><%= loaiHanhKiem%></td>
                                                </tr>
                                                <tr>
                                                    <td>Loại học lực</td>
                                                    <td><%= loaiHocLuc%></td>
                                                </tr>

                                            </tbody>
                                        </table>

                                        <h4 id="scrollspyHeading3">Thông tin liên hệ</h4>
                                        <table class="table table-bordered table-responsive">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 300px">Họ & tên người liên hệ</td>
                                                    <td><%= thiSinh.getHoVaTenThiSinh()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Số điện thoại</td>
                                                    <td><%= thiSinh.getSoDienThoai()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Tỉnh/Thành phố	</td>
                                                    <td><%= thiSinh.getTinhThanh()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Quận / Huyện</td>
                                                    <td><%= thiSinh.getQuanHuyen()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Phường/Xã</td>
                                                    <td><%= thiSinh.getPhuongXa()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Số nhà/tên đường</td>
                                                    <td><%= thiSinh.getSoNha()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Địa chỉ đầy đủ</td>
                                                    <td><%= thiSinh.getDiaChiDayDu()%></td>
                                                </tr>
                                            </tbody>
                                        </table>





                                    </div>





                                </div>

                                <!-- </div> -->
                            </div>
                        </div>

                        </section>






                        <%}%>
                        <%@include file="include/thisinh-footer.jsp" %>
                        </body>
                        </html>
