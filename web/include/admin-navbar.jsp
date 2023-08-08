<%-- 
    Document   : admin-navbar
    Created on : 27 thg 5, 2023, 18:59:46
    Author     : phangiabao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <a class="nav-link active" aria-current="page" href="admin.jsp">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin-thisinh.jsp">Thí sinh</a>
        </li>
        
      </ul>
      
      <span class="navbar-text">
          Xin chào <b><%=taiKhoanAdmin.getHoVaTen()%></b> !
      </span>
      <span class="navbar-text">
          <a style="text-decoration: none; padding-left: 10px" class="dangXuat" href="admin-dang-xuat">Đăng xuất</a>
      </span>
    </div>
  </div>
</nav>