<%-- 
    Document   : thisinh-nhaphoc
    Created on : 27 thg 5, 2023, 18:50:23
    Author     : phangiabao
--%>

<%@page import="model.ThiSinh"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                String tinhTrangHoSo = thiSinh.getTinhTrangHoSo();
                tinhTrangHoSo = ((tinhTrangHoSo == null) ? "" : tinhTrangHoSo);

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
                                            Tính năng đang được cập nhật, vui lòng quay lại sau!

                                        </div>
                                    </div>
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
