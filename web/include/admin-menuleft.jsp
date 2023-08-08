<%-- 
    Document   : menuleft
    Created on : 30 thg 5, 2023, 21:58:37
    Author     : phangiabao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div  <% if (!taiKhoanAdmin.getChucVu().equalsIgnoreCase("admin")) {
                                                    out.print("hidden");}%>>
                    <div class="sb-sidenav-menu-heading">Dành cho admin</div>
                    <a class="nav-link" href="tai-khoan">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Danh sách tài khoản
                    </a>
                    <a class="nav-link" href="nganh">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Danh sách ngành học
                    </a>
                    <a class="nav-link" href="truong">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Danh sách trường học
                    </a>
                </div>


                <div class="sb-sidenav-menu-heading">Dành cho cán bộ TS</div>
                <a class="nav-link" href="admin?hanhDong=crm">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Bảng điều khiển
                </a>
                
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Xét tuyển
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="admin?hanhDong=danh-sach-xet-tuyen">Quản lý xét tuyển</a>
                        <a class="nav-link" href="layout-sidenav-light.html">Quản lý nhập học</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    Học bổng
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                            Học bổng Nguyễn Văn Đạo
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="login.html">Quản lý HB</a>

                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                            Học bổng 1000
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="401.html">Quản lý HB</a>

                            </nav>
                        </div>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#keHoach" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Kế hoạch
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="keHoach" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="ke-hoach">Tạo kế hoạch</a>
                        <a class="nav-link" href="ke-hoach?hanhDong=danh-sach-cho-duyet">Kế hoạch chờ duyệt</a>
                    </nav>
                </div>

            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Xin chào:</div>
            <b><%=taiKhoanAdmin.getHoVaTen()%></b> !
        </div>
    </nav>
</div>