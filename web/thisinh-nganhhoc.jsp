<%-- 
    Document   : admin-thisinh
    Created on : 15 thg 5, 2023, 21:42:10
    Author     : phangiabao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Nganh"%>
<%@page import="database.NganhDAO"%>
<%@page import="model.TaiKhoanAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ĐĂNG KÝ TUYỂN SINH ĐH FPT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">

        <script defer src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    </head>
    <body>

        <!--        start navbar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="https://dangky.fpt.edu.vn/images/logo-long.png" height="40px" alt="alt"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link "  href="#">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="thisinh-nganhhoc.jsp">Ngành học</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="thisinh-truong.jsp">Trường THPT</a>
                        </li>
                    </ul>


                </div>
            </div>
        </nav>
        <!--        end navbar-->


        <div class="container mt-4">


            <table class="table table-bordered align-middle table-responsive">
                <thead style="background-color: #f27124; color: white" class="text-center ">
                    <tr>
                        <th scope="col">Mã ngành học</th>
                        <th scope="col">Tên ngành học</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        NganhDAO nganhDAO = new NganhDAO();
                        ArrayList<Nganh> ketQua = nganhDAO.getListNganh();
                        for (Nganh nganh : ketQua) {
                    %>
                    <tr class=" ">
                        <td><%=nganh.getMaNganh()%></td>
                        <td><%=nganh.getTenNganh()%></td>

                    </tr>
                    <%}
                    %>

                </tbody>
            </table>






        </tbody>

    </table>

</div>



<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>



</body>
</html>
