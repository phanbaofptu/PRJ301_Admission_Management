<%-- 
    Document   : admin-taikhoan
    Created on : 30 thg 5, 2023, 23:23:33
    Author     : phangiabao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            String tenDangNhap = request.getAttribute("tenDangNhap") + "";
            tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;
            String hoVaTen = request.getAttribute("hoVaTen") + "";
            hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;
            String emailAdmin = request.getAttribute("emailAdmin") + "";
            emailAdmin = (emailAdmin.equals("null")) ? "" : emailAdmin;
            String chucVu = request.getAttribute("chucVu") + "";
            chucVu = (chucVu.equals("null")) ? "" : chucVu;


        %>
        <%@include file="include/admin-menutop.jsp" %>
        <div id="layoutSidenav">
            <%@include file="include/admin-menuleft.jsp" %>
            <div id="layoutSidenav_content">
                <main> 
                    <div class="container-fluid px-4">
                    <c:set var="c" value="${requestScope.data}"/>

                    <h2 class="mt-4">Cập nhật thông tin cho ${c.tenDangNhap}</h2>
                 
                        <form method="get" action="tai-khoan">
                            <div class="card-body">
                                <input type="hidden" name="hanhDong" value="updateSubmit"/>
                                <table class="table table-bordered">
                                    
                                    <tr>
                                        <th>Mã Admin</th>
                                        <td><input readonly="" class="form-control" id="maAdmin" name="maAdmin" type="text" value="${c.maAdmin}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Tên đăng nhập</th>
                                        <td><input readonly class="form-control" id="tenDangNhap" name="tenDangNhap" type="text" value="${c.tenDangNhap}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Họ và tên</th>
                                        <td><input  class="form-control" id="hoVaTen" name="hoVaTen" type="text" value="${c.hoVaTen}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><input  class="form-control" id="emailAdmin" name="emailAdmin" type="text" value="${c.emailAdmin}" required /></td>
                                    </tr>
                                    <tr>
                                        <th>Chức vụ</th>
                                        <td>
                                            <select class="form-select" aria-label="Default select example" name="chucVu"required>
                                                    <option value="Cán bộ tuyển sinh" ${c.chucVu == 'Cán bộ tuyển sinh' ? 'selected' : ''}>Cán bộ tuyển sinh</option>
                                                    <option value="Admin" ${c.chucVu == 'Admin' ? 'selected' : ''}>Admin</option>


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
        <script>
            $(document).ready(function () {

                $('#example').DataTable({
                    search: {
                        return: false,
                    },
                    lengthMenu: [
                        [10, 25, 50, -1],
                        [10, 25, 50, 'All'],
                    ],

                    order: [[5, 'asc']],

                });

            });
        </script>

        <%}%>
    </body>

</html>