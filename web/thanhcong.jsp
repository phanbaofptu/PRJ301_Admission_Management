<%-- 
    Document   : index
    Created on : 15 thg 5, 2023, 16:38:10
    Author     : phangiabao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ĐĂNG KÝ TUYỂN SINH ĐH FPT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>

        <!-- Section: Design Block -->
        <section class="background-radial-gradient overflow-hidden">
            <style>

                .bg-glass {
                    background-color: hsla(0, 0%, 100%, 0.9) !important;
                    backdrop-filter: saturate(200%) blur(25px);
                }
            </style>

            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                        <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
                            HỆ THỐNG TUYỂN SINH <br />
                            <span style="color: hsl(218, 81%, 75%)">ĐẠI HỌC FPT</span>
                        </h1>
                        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                            DÀNH CHO CÁN BỘ TUYỂN SINH
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                        <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                        <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

                        <div class="card bg-glass">
                            <div class="card-body px-4 py-5 px-md-5">

                                <img class="center-block" src="https://upload.wikimedia.org/wikipedia/commons/6/68/Logo_FPT_Education.png" height="70px"/>
                                <br>
                                <%
                                    String hoVaTen = request.getParameter("hoVaTen");
                                    String tenDangNhap = request.getParameter("tenDangNhap");
                                %>
                                <div class="container mt-3">
                                    <div class="alert alert-primary" role="alert">
                                        <h5>Tài khoản của <%=hoVaTen%> đã đăng ký thành công!</h5>
                                        <p>Tên đăng nhập: <%=tenDangNhap%></p>
                                        <a href="admin-register.jsp">Trở về trang đăng ký</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Section: Design Block -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>