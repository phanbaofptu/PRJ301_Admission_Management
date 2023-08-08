<%-- 
    Document   : thisinh-menuleft
    Created on : 27 thg 5, 2023, 18:44:47
    Author     : phangiabao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sticky-top">
                                    <div class="card">
                                    <h5 class="card-header " style="background-color: #f27124; color: white">THÔNG TIN THÍ SINH</h5>
                                    <div class="card-body">
                                        <h5 class="card-title">Xin chào <%= thiSinh.getHoVaTenThiSinh()%></h5>
                                        <p class="card-text">
                                            Trạng thái hồ sơ: <%= thiSinh.getTinhTrangHoSo()%>
                                        </p>
                                        <a href="thi-sinh?hanhDong=dang-xuat" class="btn btn-warning">Đăng xuất</a>
                                    </div>
                                </div>
                                <div class="card mt-4">
                                    <div class="card-header"style="background-color: #f27124; color: white">
                                        MENU CHỨC NĂNG
                                    </div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item"><a href="thisinh.jsp">Thông tin chung</a></li>
                                        <li class="list-group-item"><a href="thisinh-thongtincanhan.jsp">Thông tin cá nhân</a></li>
                                        <li class="list-group-item"><a href="thisinh-phieudangky.jsp">Thông tin phiếu đăng ký</a></li>
                                        <li class="list-group-item"><a href="thisinh-nhaphoc.jsp">Xác nhận nhập học</a></li>
                                    </ul>
                                </div>
                                </div>