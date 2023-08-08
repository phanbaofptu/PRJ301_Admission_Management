<%-- 
    Document   : admin-thisinh
    Created on : 15 thg 5, 2023, 21:42:10
    Author     : phangiabao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Truong"%>
<%@page import="model.ThiSinh"%>
<%@page import="database.ThiSinhDAO"%>
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
        <%} else {%>
        <%@include file="include/admin-menutop.jsp" %>
        <div id="layoutSidenav">
            <%@include file="include/admin-menuleft.jsp" %>
            <div id="layoutSidenav_content">
                <main> 
                    <div class="container-fluid mt-4">
                        <div class="container bootstrap snippets bootdey">
                            <div class="panel-body inf-content">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="https://upload.wikimedia.org/wikipedia/vi/1/1d/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_FPT.png" data-original-title="Usuario"> 
                                        <ul title="Ratings" class="list-inline ratings text-center">
                                            <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                                            <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                                            <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                                            <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                                            <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <h3>THÔNG TIN TÀI KHOẢN</h3><br>
                                        <div class="table-responsive">
                                            <table class="table table-user-information">
                                                <tbody>
                                                    <tr>        
                                                        <td>
                                                            <strong>
                                                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                                                Mã định danh trong CSDL                                                
                                                            </strong>
                                                        </td>
                                                        <td class="text-primary">
                                                            <%=taiKhoanAdmin.getMaAdmin()%>     
                                                        </td>
                                                    </tr>
                                                    <tr>    
                                                        <td>
                                                            <strong>
                                                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                                                Tài khoản                                                
                                                            </strong>
                                                        </td>
                                                        <td class="text-primary">
                                                            <%=taiKhoanAdmin.getTenDangNhap()%>      
                                                        </td>
                                                    </tr>
                                                    <tr>        
                                                        <td>
                                                            <strong>
                                                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                                                                Họ và tên                                                
                                                            </strong>
                                                        </td>
                                                        <td class="text-primary">
                                                            <%=taiKhoanAdmin.getHoVaTen()%>   
                                                        </td>
                                                    </tr>

                                                    <tr>        
                                                        <td>
                                                            <strong>
                                                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                                                Email                                                
                                                            </strong>
                                                        </td>
                                                        <td class="text-primary">
                                                            <%=taiKhoanAdmin.getEmailAdmin()%>  
                                                        </td>
                                                    </tr>


                                                    <tr>        
                                                        <td>
                                                            <strong>
                                                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                                                Chức vụ                                                
                                                            </strong>
                                                        </td>
                                                        <td class="text-primary">
                                                            <%=taiKhoanAdmin.getChucVu()%> 
                                                        </td>
                                                    </tr>
                                                                                      
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
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
