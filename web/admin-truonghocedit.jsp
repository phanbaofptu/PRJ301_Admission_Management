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
        <%} else if (!taiKhoanAdmin.getChucVu().equalsIgnoreCase("Admin")) {
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
                    <div class="container-fluid px-4">
                    <c:set var="c" value="${requestScope.data}"/>

                    <h2 class="mt-4">Cập nhật trường học cho ${c.tenTruong}</h2>
                 
                        <form method="get" action="truong">
                            <div class="card-body">
                                <input type="hidden" name="hanhDong" value="updateSubmit"/>
                                <table class="table table-bordered">
                                    
                                    <tr>
                                        <th>Mã Trường</th>
                                        <td><input readonly="" class="form-control" id="maTruong" name="maTruong" type="text" value="${c.maTruong}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Tên trường</th>
                                        <td><input  class="form-control" id="tenTruong" name="tenTruong" type="text" value="${c.tenTruong}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Tỉnh trường</th>
                                        <td><input  class="form-control" id="tinhTruong" name="tinhTruong" type="text" value="${c.tinhTruong}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Huyện trường</th>
                                        <td><input  class="form-control" id="huyenTruong" name="huyenTruong" type="text" value="${c.huyenTruong}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Khu vực</th>
                                        <td>
                                            <select class="form-select" aria-label="Default select example" name="khuVuc"required>
                                                    <option value="KV1" ${c.khuVuc == 'KV1' ? 'selected' : ''}>KV1</option>
                                                    <option value="KV2" ${c.khuVuc == 'KV2' ? 'selected' : ''}>KV2</option>
                                                    <option value="KV2-NT" ${c.khuVuc == 'KV2-NT' ? 'selected' : ''}>KV2-NT</option>
                                                    <option value="KV3" ${c.khuVuc == 'KV3' ? 'selected' : ''}>KV3</option>

                                                </select>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="4" style="text-align:center ;"><button type="submit" class="btn btn-primary btn-block">Update</button></td>

                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                 
                </div>

                </main>


            </div>


        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
     

        <%}%>
    </body>

</html>