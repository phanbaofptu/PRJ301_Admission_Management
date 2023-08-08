<%-- 
    Document   : admin-taikhoan
    Created on : 30 thg 5, 2023, 23:23:33
    Author     : phangiabao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Truong"%>
<%@page import="database.TruongDAO"%>
<%@page import="model.Nganh"%>
<%@page import="database.NganhDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ThiSinh"%>
<%@page import="database.TaiKhoanAdminDAO"%>
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
        <link href="css/admin-css.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

        <script defer src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>


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
        <%}else if (!taiKhoanAdmin.getChucVu().equalsIgnoreCase("Admin")) {
        %>
        <div class="alert alert-danger container mt-4" role="alert">
            <h2>Bạn chưa được phân quyền để truy cập vào tính năng này.</h2>

            <a href="admin-crm.jsp">Quay lại</a>
        </div>
        <%} else {
            String baoLoi = request.getAttribute("baoLoi") + "";
            baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

            String tenTruong = request.getAttribute("tenTruong") + "";
            tenTruong = (tenTruong.equals("null")) ? "" : tenTruong;
            String tinhTruong = request.getAttribute("tinhTruong") + "";
            tinhTruong = (tinhTruong.equals("null")) ? "" : tinhTruong;
            String huyenTruong = request.getAttribute("huyenTruong") + "";
            huyenTruong = (huyenTruong.equals("null")) ? "" : huyenTruong;
            String khuVuc = request.getAttribute("khuVuc") + "";
            khuVuc = (khuVuc.equals("null")) ? "" : khuVuc;


        %>
        <%@include file="include/admin-menutop.jsp" %>
        <div id="layoutSidenav">
            <%@include file="include/admin-menuleft.jsp" %>
            <div id="layoutSidenav_content">
                <main> 
                    <div class="container-fluid mt-4">
                        <!-- Tạo tài khoản -->
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Thêm trường mới
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm trường mới</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="truong" method="post">
                                            <input type="hidden" name="hanhDong" value="add"/>



                                            <!-- CCCD input -->
                                            <div class="form-floating mb-4">
                                                <input type="text" id="tenTruong" class="form-control" name="tenTruong" required="" value="<%=tenTruong%>"/>
                                                <label class="form-label" for="tenTruong">Tên trường</label>
                                            </div>

                                            <!-- Password input -->
                                            <div class="form-floating mb-4">
                                                <input type="text" id="tinhTruong" class="form-control" name="tinhTruong" required=""value="<%=tinhTruong%>"/>
                                                <label class="form-label" for="tinhTruong">Tỉnh trường</label>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input type="text" id="huyenTruong" class="form-control" name="huyenTruong" required=""value="<%=huyenTruong%>"/>
                                                <label class="form-label" for="huyenTruong">Huyện trường</label>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <select class="form-select" aria-label="Default select example" name="khuVuc"required>
                                                    <option value="KV1" <% if (khuVuc.equals("KV1")) {
                                                            out.print("selected");
                                                        } %> >KV1</option>
                                                    <option value="KV2" <% if (khuVuc.equals("KV2")) {
                                                            out.print("selected");
                                                        }%>>KV2</option>
                                                    <option value="KV2-NT" <% if (khuVuc.equals("KV2-NT")) {
                                                            out.print("selected");
                                                        }%>>KV2-NT</option>
                                                    <option value="KV3" <% if (khuVuc.equals("KV3")) {
                                                            out.print("selected");
                                                        }%>>KV3</option>


                                                </select>
                                                <label class="form-label" for="khuVuc">Khu vực</label>
                                            </div>



                                            <div class="alert alert-danger" role="alert">
                                                <%=baoLoi%>
                                            </div>
                                            <!-- Submit button -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Thêm trường mới</button>
                                            </div>




                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Tại tài khoản -->
                        <%=baoLoi%>


                        <table id="example" class="table table-striped table-bordered align-middle table-responsive" style="width:100%">
                            <thead class="table font-chu-nho text-center align-middle " style="background-color: #f27124; color: white" >

                            <th>Mã trường</th>
                            <th>Tên trường</th>
                            <th>Tỉnh trường</th>
                            <th>Huyện trường</th>
                            <th>Khu vực</th>


                            <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items = "${requestScope.data}" var="c">
                                <tr class="font-chu-nho">

                                    <td>${c.maTruong}</td>
                                    <td><a href="truong?hanhDong=update&maTruong=${c.maTruong}">${c.tenTruong}</a></td>
                                    <td>${c.tinhTruong}</td>
                                    <td>${c.huyenTruong}</td>
                                    <td>${c.khuVuc}</td>

                                    <td>    
                                        <a class="btn btn-danger" href="#" onclick="doDelete('${c.maTruong}','${c.tenTruong}')" role="button">Delete</a>
                                    </td>

                                </tr>
                                </c:forEach>


                                


                            </tbody>

                        </table>

                    </div>
            </div>

        </main>


    </div>


</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
        function doDelete(maTruong,tenTruong){
            if(confirm("Bạn có muốn xoá "+tenTruong +" không?")){
                window.location="truong?hanhDong=delete&maTruong="+maTruong;
            }
        }
    </script>

<%}%>
</body>

</html>