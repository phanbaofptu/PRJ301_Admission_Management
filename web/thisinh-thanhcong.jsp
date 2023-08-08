<%-- 
    Document   : thisinh-register
    Created on : 15 thg 5, 2023, 22:16:33
    Author     : phangiabao
--%>

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
                            <span>Phi&#7871;u &#273;&#259;ng k&yacute; &#273;&#7841;i h&#7885;c FPT 2023</span>
                            <span>H&#7879; &#273;&#7841;i h&#7885;c ch&iacute;nh quy</span>
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
                        <%
                            String hoVaTenThiSinh = request.getParameter("hoVaTenThiSinh");
                            String cccd = request.getParameter("cccd");
                            String soDienThoai = request.getParameter("soDienThoai");
                        %>
                        <div class="container mt-3">
                            <div class="alert alert-primary" role="alert">
                                <h5>Thí sinh <%=hoVaTenThiSinh%> đã đăng ký tuyển sinh thành công!</h5>
                                <h6 class="text-danger">Lưu ý: Thí sinh vui lòng đăng nhập vào hệ thống, bổ sung thông tin xét tuyển và tải tất cả các hình ảnh được yêu cầu để hoàn thành hồ sơ xét tuyển</h6>
                                <h6>Tên đăng nhập: <%=cccd%></h6>
                                <h6>Mật khẩu: <%=soDienThoai%></h6>
                                <button  type="button" class="btn btn-light"><a href="thisinh-login.jsp">Đăng nhập</a></button>

                            </div>
                        </div>






                    </div>

                    <!-- </div> -->
                </div>
            </div>
        </section>


        <%@include file="include/thisinh-footer.jsp" %>
    </body>
</html>
