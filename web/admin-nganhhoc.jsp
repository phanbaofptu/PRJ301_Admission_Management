<%-- 
    Document   : admin-taikhoan
    Created on : 30 thg 5, 2023, 23:23:33
    Author     : phangiabao
--%>

<%@page import="model.Nganh"%>
<%@page import="database.NganhDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ThiSinh"%>
<%@page import="database.TaiKhoanAdminDAO"%>
<%@page import="model.TaiKhoanAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            String maNganh = request.getAttribute("maNganh") + "";
            maNganh = (maNganh.equals("null")) ? "" : maNganh;
            String tenNganh = request.getAttribute("tenNganh") + "";
            tenNganh = (tenNganh.equals("null")) ? "" : tenNganh;


        %>
        <%@include file="include/admin-menutop.jsp" %>
        <div id="layoutSidenav">
            <%@include file="include/admin-menuleft.jsp" %>
            <div id="layoutSidenav_content">
                <main> 
                    <div class="container-fluid mt-4">
                        <!-- Tạo tài khoản -->
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-warning mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Thêm ngành học mới
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm ngành học mới</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="nganh" method="post">
                                            <input type="hidden" name="hanhDong" value="add"/>



                                            <!-- CCCD input -->
                                            <div class="form-floating mb-4">
                                                <input type="text" id="maNganh" class="form-control" name="maNganh" required="" value="<%=maNganh%>"/>
                                                <label class="form-label" for="maNganh">Mã ngành</label>
                                            </div>

                                            <!-- Password input -->
                                            <div class="form-floating mb-4">
                                                <input type="text" id="tenNganh" class="form-control" name="tenNganh" required=""value="<%=tenNganh%>"/>
                                                <label class="form-label" for="tenNganh">Tên ngành</label>
                                            </div>



                                            <div class="alert alert-danger" role="alert">
                                                <%=baoLoi%>
                                            </div>
                                            <!-- Submit button -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Thêm ngành học mới</button>
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

                            <th>Mã ngành</th>
                            <th>Tên ngành</th>


                            <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items = "${requestScope.data}" var="c">
                                    <tr class="font-chu-nho">

                                        <td>${c.maNganh}</td>
                                        <td><a href="nganh?hanhDong=update&maNganh=${c.maNganh}">${c.tenNganh}</a></td>



                                        <td>
                                            <a class="btn btn-danger" href="#" onclick="doDelete('${c.maNganh}')" role="button">Delete</a>
                                            
                                            
                                            
                                        </td


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
        function doDelete(maNganh){
            if(confirm("Bạn có muốn xoá ngành "+maNganh +" không?")){
                window.location="nganh?hanhDong=delete&maNganh="+maNganh;
            }
        }
    </script>
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

        });

    });
</script>

<%}%>
</body>

</html>