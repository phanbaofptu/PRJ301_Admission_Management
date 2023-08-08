<%-- 
    Document   : admin-taikhoan
    Created on : 30 thg 5, 2023, 23:23:33
    Author     : phangiabao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="">
                            <div class="card">
                                <div class="card-body">
                                    <h3>Tạo kế hoạch mới</h3>
                                    <form method="post" action="ke-hoach" enctype="multipart/form-data">
                                        <input type="hidden" name="hanhDong" value="add"/>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="hocKy" class="form-label">Học kỳ</label>
                                                <select class="form-select" aria-label="Default select example" name="hocKy"required>
                                                    <option selected>Lựa chọn</option>
                                                    <option value="Summer2023">Summer2023</option>
                                                    <option value="Fall2023">Fall2023</option>
                                                    <option value="Spring2024">Spring2024</option>
                                                </select>

                                            </div>
                                            <div class="col-md-8">
                                                <label for="tenKeHoach" class="form-label">Tên kế hoạch</label>
                                                <input type="text" class="form-control" id="tenKeHoach" name="tenKeHoach" value="" required>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="hinhThuc" class="form-label">Hình thức</label>
                                                <select class="form-select" aria-label="Default select example" name="hinhThuc"required>
                                                    <option selected>Lựa chọn</option>
                                                    <option value="Báo cáo">Báo cáo</option>
                                                    <option value="Kế hoạch">Kế hoạch</option>

                                                </select>

                                            </div>
                                            <div class="col-md-8">
                                                <label for="moTaKeHoach" class="form-label">Mô tả kế hoạch</label>
                                                <textarea class="form-control" aria-label="With textarea" name="moTaKeHoach"></textarea>

                                            </div>
                                            <div class="col-md-4 hidden">
                                                <label for="nguoiSoan" class="form-label">Người soạn</label>
                                                <input type="text" class="form-control" id="nguoiSoan" name="nguoiSoan" value="<%=taiKhoanAdmin.getMaAdmin()%>" >
                                            </div>
                                            <div class="col-md-4 ">
                                                <label for="nguoiDuyet" class="form-label">Người duyệt</label>
                                                <select class="form-select" aria-label="Default select example" name="nguoiDuyet" required>
                                                    <option selected>Lựa chọn</option>
                                                    <d:forEach items="${requestScope.listtk}" var="d">
                                                        <option value="${d.tenDangNhap}">${d.tenDangNhap}</option>
                                                    </d:forEach>

                                                </select>
                                            </div>
                                            <div class="col-md-8  ">
                                                <label for="fileKeHoach" class="form-label">File kế hoạch (Nếu nhiều hơn 1 file, hãy nộp file .zip)</label>
                                                <input type="file" class="form-control" id="fileKeHoach" name="fileKeHoach" required >
                                            </div>
                                            <div class="col-md-4 hidden">
                                                <label for="trangThai" class="form-label">Trạng thái</label>
                                                <select class="form-select" aria-label="Default select example" name="trangThai">
                                                    <option value="Tạo mới"selected>Tạo mới</option>
                                                    <option value="Đã duyệt">Đã duyệt</option>
                                                    <option value="Đã bị từ chối">Đã bị từ chối</option>

                                                </select>

                                            </div>
                                            <div class="col-md-12">
                                                <br>
                                                <input class="btn btn-primary" type="submit" value="Gửi kế hoạch">
                                            </div>
                                        </div>


                                    </form>
                                            <%=baoLoi%>
                                </div>
                            </div>

                            
                        </div>
                                <br>


                        <!-- Tại tài khoản -->



                        <table id="example" class="table table-striped table-bordered align-middle table-responsive" style="width:100%">
                            <thead class="table font-chu-nho text-center align-middle " style="background-color: #f27124; color: white" >

                            <th>Học kỳ</th>
                            <th>Hình thức</th>
                            <th>Tên kế hoạch</th>
                            <th>Ngày tạo</th>
                            <th>Người duyệt</th>
                            <th>Trạng thái</th>

                            <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items = "${requestScope.data}" var="c">
                                    <tr class="font-chu-nho">

                                        <td>${c.hocKy}</td>
                                        <td>${c.hinhThuc}</td>
                                        <td>${c.tenKeHoach}</td>
                                        <td>${c.ngayTao}</td>
                                        <td>${c.nguoiDuyet}</td>
                                        <td>${c.trangThai}</td>

                                        <td>
                                            <a class="btn btn-primary"href="ke-hoach?hanhDong=update&maKeHoach=${c.maKeHoach}">View & Update</a>
                                            <a class="btn btn-danger" href="#" onclick="doDelete('${c.maKeHoach}','${c.tenKeHoach}')" role="button">Delete</a>
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
    $(document).ready(function () {

        $('#example').DataTable({
            search: {
                return: false,
            },
            lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, 'All'],
            ],
        order: [[3, 'des']],
        });

    });
</script>
<script>
        function doDelete(maKeHoach,tenKeKeHoach){
            if(confirm("Bạn có muốn xoá "+tenKeKeHoach +" không?")){
                window.location="ke-hoach?hanhDong=delete&maKeHoach="+maKeHoach;
            }
        }
    </script>

<%}%>
</body>

</html>