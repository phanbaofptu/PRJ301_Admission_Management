<%-- 
    Document   : thisinh
    Created on : 16 thg 5, 2023, 12:56:40
    Author     : phangiabao
--%>

<%@page import="model.ThiSinh"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ĐĂNG KÝ TUYỂN SINH ĐH FPT</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css-style.css">


    </head>

    <body>
        <section id="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="boximagestop">
                            <a href="#">
                                <img src="img/images-tohop.png" alt="">
                            </a>
                        </div>

                    </div>
                    <div class="col-md-9">
                        <div class="titletopheader">
                            <span>HỆ THỐNG ĐĂNG KÝ TUYỂN SINH ĐẠI HỌC FPT</span>
                            <span>HỆ CHÍNH QUY</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
            Object obj = session.getAttribute("thiSinh");
            ThiSinh thiSinh = null;
            if (obj != null) {
                thiSinh = (ThiSinh) obj;
            }

            if (thiSinh == null) {
        %>
        <div class="alert alert-danger container mt-4" role="alert">
            <h2>Bạn chưa đăng nhập vào hệ thống</h2>

            <a href="thisinh-login.jsp">Đăng nhập</a>
        </div>
        <%} else {%>
        <%
            String baoLoi = "Thông tin dưới đây là thông tin gợi ý. Vui lòng cập nhật thông tin để hoàn thiện hồ sơ xét tuyển.";

            String tinhTrangHoSo = thiSinh.getTinhTrangHoSo();
            tinhTrangHoSo = ((tinhTrangHoSo == null) ? "" : tinhTrangHoSo);
            String tinhTrangDangKy = thiSinh.getTinhTrangDangKy();
            tinhTrangDangKy = ((tinhTrangDangKy == null) ? "" : tinhTrangDangKy);
            String tinhTrangNhapHoc = thiSinh.getTinhTrangNhapHoc();
            tinhTrangNhapHoc = ((tinhTrangNhapHoc == null) ? "" : tinhTrangNhapHoc);
            String noiSinh = thiSinh.getNoiSinh();
            noiSinh = ((noiSinh == null) ? thiSinh.getTinhThanh() : noiSinh);
            String quocTich = thiSinh.getQuocTich();
            quocTich = ((quocTich == null) ? "" : quocTich);
            String danToc = thiSinh.getDanToc();
            danToc = ((danToc == null) ? "" : danToc);
            String tonGiao = thiSinh.getTonGiao();
            tonGiao = ((tonGiao == null) ? "" : tonGiao);
            String hoKhauThuongTru = thiSinh.getHoKhauThuongTru();
            hoKhauThuongTru = ((hoKhauThuongTru == null) ? thiSinh.getDiaChiDayDu() : hoKhauThuongTru);
            String xepLoaiTotNghiep = thiSinh.getXepLoaiTotNghiep();
            xepLoaiTotNghiep = ((xepLoaiTotNghiep == null) ? "" : xepLoaiTotNghiep);
            String loaiHanhKiem = thiSinh.getLoaiHanhKiem();
            loaiHanhKiem = ((loaiHanhKiem == null) ? "" : loaiHanhKiem);
            String loaiHocLuc = thiSinh.getLoaiHocLuc();
            loaiHocLuc = ((loaiHocLuc == null) ? "" : loaiHocLuc);
            String anhCCCDMatTruoc = thiSinh.getAnhCCCDMatTruoc();
            anhCCCDMatTruoc = ((anhCCCDMatTruoc == null || anhCCCDMatTruoc.equals("")) ? "thisinh/no-img.jpeg" : anhCCCDMatTruoc);
            String anhSchoolRank = thiSinh.getAnhSchoolRank();
            anhSchoolRank = ((anhSchoolRank == null || anhSchoolRank.equals("")) ? "thisinh/no-img.jpeg" : anhSchoolRank);
            String anhCCCDMatSau = thiSinh.getAnhCCCDMatSau();
            anhCCCDMatSau = ((anhCCCDMatSau == null || anhCCCDMatSau.equals("")) ? "thisinh/no-img.jpeg" : anhCCCDMatSau);
            String anhBangDiem11 = thiSinh.getAnhBangDiem11();
            anhBangDiem11 = ((anhBangDiem11 == null || anhBangDiem11.equals("")) ? "thisinh/no-img.jpeg" : anhBangDiem11);
            String anhBangDiem12 = thiSinh.getAnhBangDiem12();
            anhBangDiem12 = ((anhBangDiem12 == null || anhBangDiem12.equals("")) ? "thisinh/no-img.jpeg" : anhBangDiem12);

            if (!loaiHanhKiem.equals("")) {
                baoLoi = "Thông tin đã cập nhật thành công!";
            }
        %>
        

        <section class="processbar">
            <div class="container">
                <div class="row-fluid">
                    <!-- <div class="col-md-12 "> -->

                    <div data-title="Thanh tiến độ" data-intro="Thanh tiến độ đăng ký" class="process-bar-detail">
                        <div class="row mt-4">
                            <div class="col-md-3">
                                <%@include file="include/thisinh-menuleft.jsp" %>
                            </div>
                            <div class="col-md-9">

                                <div class="col-md-12">
                                    <div class="titleinfo">Thông tin đăng ký</div>

                                    <!-- bang tinh trang hò so-->
                                    <table class="table table-bordered align-middle table-responsive">
                                        <thead style="background-color: #f27124; color: white" class="text-center ">
                                            <tr>
                                                <th scope="col">Kỳ Tuyển Sinh</th>
                                                <th scope="col">Ngành Đăng Ký</th>
                                                <th scope="col">Hình Thức Đăng Ký</th>
                                                <th scope="col">Tình TrạngHồ Sơ</th>
                                                <th scope="col">Kết Quả Xét tuyển</th>
                                                <th scope="col">Trúng tuyển loại</th>
                                                <th scope="col">Đăng Ký Ghi danh</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="text-center ">
                                                <td><%= thiSinh.getKyDuTuyen()%></td>
                                                <td><%= thiSinh.getMaNganh()%></td>
                                                <td><%= thiSinh.getHinhThucDangKy()%></td>
                                                <td class="text-danger"><%= tinhTrangHoSo%></td>
                                                <td><%= tinhTrangDangKy%></td>
                                                <td>Chưa có thông tin</td>
                                                <td class="text-danger"><%= tinhTrangNhapHoc%></td>
                                            </tr>

                                        </tbody>
                                    </table>

                                    <div class="col-md-12">
                                        <div class="titleinfo">Cung cấp thông tin xác thực</div>
                                        <form action="thi-sinh-bo-sung-anh-ttxt" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-md-6 ">
                                                    <label for="anhCCCDMatTruoc" class="form-label">Ảnh CCCD Mặt trước</label>
                                                    <input type="file" class="form-control" id="anhCCCDMatTruoc" name="anhCCCDMatTruoc" value="<%=anhCCCDMatTruoc%>" required>
                                                    <div class="mt-2" style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                        <img class="img-fluid " src="<%=anhCCCDMatTruoc%>" alt="Ảnh CCCD Mặt trước"/>
                                                    </div>

                                                </div>
                                                <div class="col-md-6 ">
                                                    <label for="anhCCCDMatSau" class="form-label">Ảnh CCCD Mặt sau</label>
                                                    <input type="file" class="form-control" id="anhCCCDMatSau" name="anhCCCDMatSau"value="<%=anhCCCDMatSau%>"required>
                                                    <div class="mt-2" style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                        <img class=" img-fluid" src="<%=anhCCCDMatSau%>" alt="Ảnh CCCD Mặt sau"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 ">
                                                    <label for="anhSchoolRank" class="form-label">Ảnh SchoolRank</label>
                                                    <input type="file" class="form-control" id="anhSchoolRank" name="anhSchoolRank"value="<%=anhSchoolRank%>"required>
                                                    <div class="mt-2" style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">


                                                        <img class="img-fluid " src="<%=anhSchoolRank%>" alt="Ảnh SchoolRank"/>
                                                    </div> 
                                                </div>
                                                <div class="col-md-6 ">
                                                    <label for="anhBangDiem11" class="form-label">Ảnh Bảng điểm cả năm lớp 11</label>
                                                    <input type="file" class="form-control" id="anhBangDiem11" name="anhBangDiem11"value="<%=anhBangDiem11%>"required>
                                                    <div class="mt-2" style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                        <img class="img-fluid  " src="<%=anhBangDiem11%>" alt="Ảnh Bảng điểm 11"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 ">
                                                    <label for="anhBangDiem12" class="form-label">Ảnh Bảng điểm học kỳ 1 lớp 12</label>
                                                    <input type="file" class="form-control" id="anhBangDiem12" name="anhBangDiem12"value="<%=anhBangDiem12%>"required>
                                                    <div class="mt-2" style="aspect-ratio:4/3;border: 1px solid #cccbcb;text-align: center;margin: auto;overflow: hidden;padding: 2px;">
                                                        <img class="img-fluid " src=" <%=anhBangDiem12%>" alt="Ảnh bảng điểm 12"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 "> 
                                                    <br>
                                                    <input class="btn btn-primary" type="submit" value="Cập nhật thông tin">
                                                </div>

                                            </div>
                                        </form>


                                    </div>

                                    <div class="col-md-12">
                                        <div class="titleinfo">Bổ sung thông tin xét tuyển</div>
                                        <div class="alert alert-danger" role="alert">
                                            <%=baoLoi%> 

                                        </div>
                                        <form action="thi-sinh" method="post">
                                            <input type="hidden" name="hanhDong" value="bo-sung-ttxt"/>
                                            <div class="row">

                                                <div class="col-md-6" >
                                                    <label for="noiSinh" class="form-label">Nơi sinh</label>
                                                    <input type="text" class="form-control" id="noiSinh" name="noiSinh" value="<%=noiSinh%>" required>
                                                </div>
                                                <div class="col-md-6" >
                                                    <label for="quocTich" class="form-label">Quốc tịch</label>
                                                    <input type="text" class="form-control" id="quocTich" name="quocTich" value="<%=quocTich%>"required>
                                                </div>
                                                <div class="col-md-6" >
                                                    <label for="danToc" class="form-label">Dân tộc</label>
                                                    <input type="text" class="form-control" id="danToc" name="danToc" value="<%=danToc%>"required>
                                                </div>
                                                <div class="col-md-6" >
                                                    <label for="tonGiao" class="form-label">Tôn giáo</label>
                                                    <input type="text" class="form-control" id="tonGiao" name="tonGiao" value="<%=tonGiao%>"required>
                                                </div>
                                                <div class="col-md-6" >
                                                    <label for="hoKhauThuongTru" class="form-label">Hộ khẩu thường trú</label>
                                                    <input type="text" class="form-control" id="hoKhauThuongTru" name="hoKhauThuongTru" value="<%=hoKhauThuongTru%>"required>
                                                </div>

                                                <div class="col-md-6" >
                                                    <label for="xepLoaiTotNghiep" class="form-label">Xếp loại tốt nghiệp (Nếu có)</label>
                                                    <select class="form-select" aria-label="Default select example" name="xepLoaiTotNghiep" id="xepLoaiTotNghiep" >
                                                        <option value="" <% if (!xepLoaiTotNghiep.equals("Giỏi") && !xepLoaiTotNghiep.equals("Khá")) {
                                                                out.print("selected");
                                                            } %> >Lựa chọn</option>
                                                        <option value="Giỏi" <% if (xepLoaiTotNghiep.equals("Giỏi")) {
                                                                out.print("selected");
                                                            } %>>Giỏi</option>
                                                        <option value="Khá" <% if (xepLoaiTotNghiep.equals("Khá")) {
                                                                out.print("selected");
                                                            }%>>Khá</option>

                                                    </select>
                                                </div>
                                                <div class="col-md-6" >
                                                    <label for="loaiHanhKiem" class="form-label">Loại hạnh kiểm</label>
                                                    <select class="form-select" aria-label="Default select example" name="loaiHanhKiem" id="loaiHanhKiem" required>
                                                        <option value="" <% if (!loaiHanhKiem.equals("Tốt") && !loaiHanhKiem.equals("Khá") && !loaiHanhKiem.equals("Trung bình")) {
                                                                out.print("selected");
                                                            } %> >Lựa chọn</option>
                                                        <option value="Tốt" <% if (loaiHanhKiem.equals("Tốt")) {
                                                                out.print("selected");
                                                            } %>>Tốt</option>
                                                        <option value="Khá" <% if (loaiHanhKiem.equals("Khá")) {
                                                                out.print("selected");
                                                            }%>>Khá</option>
                                                        <option value="Trung bình" <% if (loaiHanhKiem.equals("Trung bình")) {
                                                                out.print("selected");
                                                            }%>>Trung bình</option>


                                                    </select>
                                                </div>
                                                <div class="col-md-6" >
                                                    <label for="loaiHocLuc" class="form-label">Loại học lực</label>
                                                    <select class="form-select" aria-label="Default select example" name="loaiHocLuc" id="loaiHocLuc" required>
                                                        <option value="" <% if (!loaiHocLuc.equals("Giỏi") && !loaiHocLuc.equals("Khá") && !loaiHocLuc.equals("Trung bình")) {
                                                                out.print("selected");
                                                            } %> >Lựa chọn</option>
                                                        <option value="Giỏi" <% if (loaiHocLuc.equals("Giỏi")) {
                                                                out.print("selected");
                                                            } %>>Giỏi</option>
                                                        <option value="Khá" <% if (loaiHocLuc.equals("Khá")) {
                                                                out.print("selected");
                                                            }%>>Khá</option>
                                                        <option value="Trung bình" <% if (loaiHocLuc.equals("Trung bình")) {
                                                                out.print("selected");
                                                            }%>>Trung bình</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <br>
                                                <input class="btn btn-primary" type="submit" value="Cập nhật thông tin">
                                            </div>
                                        </form>


                                    </div>
                                </div>
                            </div>







                        </div>

                        <!-- </div> -->
                    </div>
                </div>
        </section>






        <%}%>
        <%@include file="include/thisinh-footer.jsp" %>
    </body>
</html>
