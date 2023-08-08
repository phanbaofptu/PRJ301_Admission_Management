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
        <%} else {
            String baoLoi = request.getAttribute("baoLoi") + "";
            baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

    

        %>
        <%@include file="include/admin-menutop.jsp" %>
        <div id="layoutSidenav">
            <%@include file="include/admin-menuleft.jsp" %>
            <div id="layoutSidenav_content">
                <%=baoLoi%>


                <div class="container-fluid px-4">
                    <c:set var="c" value="${requestScope.data}"/>

                    <h2 class="mt-4">${c.tenKeHoach}</h2>

                    <form method="get" action="ke-hoach">
                        <div class="card-body">
                            <input type="hidden" name="hanhDong" value="updateSubmit"/>
                            <table class="table table-bordered">

                                <tr>
                                    <th>Mã kế hoạch</th>
                                    <td><input readonly="" class="form-control" id="maKeHoach" name="maKeHoach" type="text" value="${c.maKeHoach}" required /></td>
                                </tr>
                                <tr>
                                    <th>Học Kỳ</th>
                                    <td>
                                        <select class="form-select" aria-label="Default select example" name="hocKy"required>
                                            <option>Lựa chọn</option>
                                            <option value="Summer2023" ${c.hocKy=='Summer2023'?'selected':''}>Summer2023</option>
                                            <option value="Fall2023"${c.hocKy=='Fall2023'?'selected':''}>Fall2023</option>
                                            <option value="Spring2024"${c.hocKy=='Spring2024'?'selected':''}>Spring2024</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Tên kế hoạch</th>
                                    <td><input class="form-control" id="tenKeHoach" name="tenKeHoach" type="text" value="${c.tenKeHoach}" required /></td>
                                </tr>
                                <tr>
                                    <th>Hình thức</th>
                                    <td>
                                        <select class="form-select" aria-label="Default select example" name="hinhThuc"required>
                                            <option>Lựa chọn</option>
                                            <option value="Báo cáo" ${c.hinhThuc=='Báo cáo'?'selected':''}>Báo cáo</option>
                                            <option value="Kế hoạch"${c.hinhThuc=='Kế hoạch'?'selected':''}>Kế hoạch</option>
                                            <option value="Spring2024"${c.hinhThuc=='Spring2024'?'selected':''}>Spring2024</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Mô tả kế hoạch</th>
                                    <td><textarea class="form-control" aria-label="With textarea" name="moTaKeHoach">${c.moTaKeHoach}</textarea></td>
                                </tr>
                                <tr>
                                    <th>Người soạn</th>
                                    <td>${c.nguoiSoan}</td>
                                </tr>
                                <tr>
                                    <th>Người duyệt</th>
                                    <td>${c.nguoiDuyet}</td>
                                </tr>
                                <tr>
                                    <th>File kế hoạch</th>
                                    <td><a href="${c.fileKeHoach}" target="_blank"><img height="40px" src="https://cdn-icons-png.flaticon.com/512/29/29593.png" alt="file"/></a></td>
                                </tr>
                                <tr>
                                    <th>Trạng thái</th>
                                    <td><span class="badge text-bg-success">${c.trangThai}</span>
                                    </td>
                                    <td>
                                        <select hidden class="form-select" aria-label="Default select example" name="trangThai">
                                            <option value="Tạo mới" ${c.trangThai=='Tạo mới'?'selected':''}>Tạo mới</option>
                                            <option value="Đã duyệt"${c.trangThai=='Đã duyệt'?'selected':''}>Đã duyệt</option>
                                            <option value="Đã bị từ chối"${c.trangThai=='Đã bị từ chối'?'selected':''}>Đã bị từ chối</option>

                                        </select>
                                    </td>
                                <tr>
                                    <th>Nhận xét</th>
                                    <td>${c.nhanXet}
                                    </td>
                                </tr>
                                <tr>
                                    <th>Ngày duyệt</th>
                                    <td>${c.ngayDuyet}
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


            </div>

        </div>
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