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
                    <div class="container-fluid mt-4">
                        <!-- Tạo tài khoản -->
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Tạo tài khoản CBNV
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Tạo tài khoản CBNV</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="tai-khoan" method="post">
                                            <input type="hidden" name="hanhDong" value="add"/>


                                            <!-- CCCD input -->
                                            <div class="form-floating mb-4">
                                                <input type="text" id="tenDangNhap" class="form-control" name="tenDangNhap" required="" value="<%=tenDangNhap%>"/>
                                                <label class="form-label" for="tenDangNhap">Tên đăng nhập</label>
                                            </div>

                                            <!-- Password input -->
                                            <div class="form-floating mb-4">
                                                <input type="password" id="matKhau" class="form-control" name="matKhau" required=""/>
                                                <label class="form-label" for="matKhau">Mật khẩu</label>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input type="password" id="matKhauNhapLai" class="form-control" name="matKhauNhapLai" required=""onkeyup="kiemTraMatKhau()"/>
                                                <label class="form-label" for="matKhauNhapLai">Nhập lại Mật khẩu</label>
                                                <span id ="thongBaoLoiMatKhau" style="color: red"></span>
                                            </div>
                                            <!--                                    Infomation-->
                                            <div class="form-floating mb-4">
                                                <input type="text" id="hoVaTen" class="form-control" name="hoVaTen" required="" value="<%=hoVaTen%>"/>
                                                <label class="form-label" for="hoVaTen">Họ và tên</label>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <input type="email" id="emailAdmin" class="form-control" name="emailAdmin" required="" value="<%=emailAdmin%>"/>
                                                <label class="form-label" for="emailAdmin">Email</label>
                                            </div>
                                            <div class="form-floating mb-4">
                                                <select class="form-select" aria-label="Default select example" name="chucVu"required>
                                                    <option value="Cán bộ tuyển sinh" <% if (chucVu.equals("Cán bộ tuyển sinh")) {
                                                            out.print("selected");
                                                        } %> >Cán bộ tuyển sinh</option>
                                                    <option value="Admin" <% if (chucVu.equals("Admin")) {
                                                            out.print("selected");
                                                        }%>>Admin</option>


                                                </select>
                                                <label class="form-label" for="chucVu">Chức vụ</label>
                                            </div>

                                            <div class="alert alert-danger" role="alert">
                                                <%=baoLoi%>
                                            </div>
                                            <!-- Submit button -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
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

                            <th>Code</th>
                            <th>Username</th>
                            <th>FullName</th>
                            <th>Email</th>
                            <th>Role</th>

                            <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items = "${requestScope.data}" var="c">
                                    <tr class="font-chu-nho">

                                        <td>${c.maAdmin}</td>
                                        <td><a href="tai-khoan?hanhDong=update&maAdmin=${c.maAdmin}">${c.tenDangNhap}</a></td>
                                        <td>${c.hoVaTen}</td>
                                        <td>${c.emailAdmin}</td>
                                        <td>${c.chucVu}</td>


                                        <td>
                                             <a class="btn btn-primary" href="#" onclick="doReset('${c.maAdmin}', '${c.tenDangNhap}', '${c.emailAdmin}')" role="button">Reset password</a>
                                             <a class="btn btn-danger" href="#" onclick="doDelete('${c.maAdmin}', '${c.tenDangNhap}')" role="button">Delete</a>
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
                                                function doDelete(maAdmin, tenDangNhap) {
                                                    if (confirm("Bạn có muốn xoá " + tenDangNhap + " không?")) {
                                                        window.location = "tai-khoan?hanhDong=delete&maAdmin=" + maAdmin;
                                                    }
                                                }
                                                function doReset(maAdmin, tenDangNhap, emailAdmin) {
                                                    if (confirm("Bạn có muốn gửi email đặt lại mật khẩu cho " + tenDangNhap + " không?")) {
                                                        window.location = "send?email=" + emailAdmin+"&subject=FPT Admission: Reset internal account password!&message=Hello "+tenDangNhap+"%2C%0D%0AWe+recently+received+a+request+to+reset+your+password.+To+update+your+new+password%2C+please+visit+the+link+below%3A%0D%0A%0D%0ABest+regards%2C%0D%0AFPT+Admission";
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
        order: [[3, 'des']],
        });

    });
</script>

<%}%>
</body>

</html>