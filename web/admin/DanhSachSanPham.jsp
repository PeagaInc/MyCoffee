
<%@page import="DAO.SanPhamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>PS10576 - ASM</title>

        <!-- Bootstrap -->
        <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Datatables -->
        <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="build/css/custom.min.css" rel="stylesheet">
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Java 4!</span></a>
                        </div>

                        <div class="clearfix"></div>

                        <!-- menu profile quick info -->
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <h2>John Doe</h2>
                            </div>
                        </div>
                        <!-- /menu profile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>General</h3>
                                <ul class="nav side-menu">
                                    <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="index.jsp">Dashboard</a></li>
                                        </ul>
                                    </li>

                                    <!--Quản lý tài khoản-->
                                    <li><a><i class="fa fa-edit"></i> Quản lý tài khoản <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="./ThemTaiKhoan.jsp">Thêm tài khoản</a></li>
                                            <li><a href="./DanhSachTaiKhoan.jsp">Danh sách tài khoản</a></li>
                                        </ul>
                                    </li>

                                    <!--Quản lý thể loại-->
                                    <li><a><i class="fa fa-edit"></i> Quản lý thể loại <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="./ThemTheLoai.jsp">Thêm thể loại</a></li>
                                            <li><a href="./DanhSachTheLoai.jsp">Danh sách thể loại</a></li>
                                        </ul>
                                    </li>

                                    <!--Quản lý sản phẩm-->
                                    <li><a><i class="fa fa-edit"></i> Quản lý sản phẩm <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="./ThemSanPham.jsp">Thêm sản phẩm</a></li>
                                            <li><a href="./DanhSachSanPham.jsp">Danh sách sản phẩm</a></li>
                                        </ul>
                                    </li>

                                    <!--Quản lý khách hàng-->
                                    <li><a><i class="fa fa-edit"></i> Quản lý khách hàng <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="./ThemKhachHang.jsp">Thêm khách hàng</a></li>
                                            <li><a href="./DanhSachKhachHang.jsp">Danh sách khách hàng</a></li>
                                        </ul>
                                    </li>

                                    <!--Quản lý giỏ hàng-->
                                    <li><a><i class="fa fa-edit"></i> Quản lý giỏ hàng <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="./ThemGioHang.jsp">Thêm giỏ hàng</a></li>
                                            <li><a href="./DanhSachGioHang.jsp">Danh sách giỏ hàng</a></li>
                                        </ul>
                                    </li>

                                    <!--Quản lý chi tiết giỏ hàng-->
                                    <li><a><i class="fa fa-edit"></i> Quản lý chi tiết giỏ hàng <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="./ThemGioHangChiTiet.jsp">Thêm chi tiết giỏ hàng</a></li>
                                            <li><a href="./DanhSachGioHangChiTiet.jsp">Danh sách chi tiết giỏ hàng</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /sidebar menu -->

                        <!-- /menu footer buttons -->
                        <div class="sidebar-footer hidden-small">
                            <a data-toggle="tooltip" data-placement="top" title="Settings">
                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Lock">
                                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Logout" href="Login.jsp">
                                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            </a>
                        </div>
                        <!-- /menu footer buttons -->
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav>
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>

                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <img src="images/img.jpg" alt="">John Doe
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                                        <li><a href="javascript:;"> Profile</a></li>
                                        <li>
                                            <a href="javascript:;">
                                                <span class="badge bg-red pull-right">50%</span>
                                                <span>Settings</span>
                                            </a>
                                        </li>
                                        <li><a href="javascript:;">Help</a></li>
                                        <li><a href="Login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                                    </ul>
                                </li>

                                <li role="presentation" class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-envelope-o"></i>
                                        <span class="badge bg-green">6</span>
                                    </a>
                                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="text-center">
                                                <a>
                                                    <strong>See All Alerts</strong>
                                                    <i class="fa fa-angle-right"></i>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>Danh Sách Sản Phẩm <small></small></h3>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Go!</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Products Table <small></small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="card-box table-responsive">
                                                    <table id="datatable-keytable" class="table table-striped table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Mã sản phẩm</th>
                                                                <th>Tên sản phẩm</th>
                                                                <th>Giá</th>
                                                                <th>Mô tả</th>
                                                                <th>Hình</th>
                                                                <th>Mã loại</th>
                                                                <th>#Chức năng</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                session.setAttribute("SANPHAM", new SanPhamDAO().layDanhSach());
                                                            %>
                                                            <c:set var="count" value="0"/>
                                                            <c:set var="spham" value="${sessionScope.SANPHAM}"/>
                                                            <c:if test="${not empty spham}">
                                                                <c:forEach var="rows" items="${spham}">
                                                                    <c:set var="count" value="${count + 1}"/>
                                                                    <tr>
                                                                        <th>${count}</th>
                                                                        <td>${rows.getMaSP()}</td>
                                                                        <td>${rows.getTenSP()}</td>
                                                                        <td>${rows.getGia()}</td>
                                                                        <td>${rows.getMoTa()}</td>
                                                                        <td style="text-align: center;"><img style="width: 80px; height: 100px;" src="hinh/${rows.getHinh()}"></td>
                                                                        <td>${rows.getMaLoai()}</td>
                                                                        <td>
                                                                            <input type="button" class="btn btn-info btn-xs" value="Edit" data-toggle="modal" data-target="#${count}">
                                                                            <input type="button" class="btn btn-danger btn-xs" value="Delete" data-toggle="modal" data-target="#del${count}">
                                                                            <c:set  var="ma" value="${rows.getMaSP()}"/>
                                                                            <c:set  var="ten" value="${rows.getTenSP()}"/>
                                                                            <!-- Modal -->
                                                                            <div class="modal fade" id="${count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                    <form action="../ControllerSanPham" method="POST">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Cập Nhập Sản Phẩm</h5>
                                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                    <span aria-hidden="true">&times;</span>
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="first-name">Mã sản phẩm <span class="required">*</span>
                                                                                                    </label><br><br>
                                                                                                    <div class="col-md-12 col-sm-12 col-xs-24">
                                                                                                        <input style="width: 540px;" type="text" id="first-name" name="txtMaSP1" value="${rows.getMaSP()}" required="required" class="form-control col-md-7 col-xs-12">
                                                                                                    </div>
                                                                                                </div><br><br>
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="last-name">Tên sản phẩm <span class="required">*</span>
                                                                                                    </label>
                                                                                                    <div class="col-md-12 col-sm-12 col-xs-24">
                                                                                                        <input style="width: 540px;" type="text" id="last-name" name="txtTenSP1" value="${rows.getTenSP()}" required="required" class="form-control col-md-7 col-xs-24">
                                                                                                    </div>
                                                                                                </div><br><br>
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="first-name">Giá <span class="required">*</span>
                                                                                                    </label><br><br>
                                                                                                    <div class="col-md-12 col-sm-12 col-xs-24">
                                                                                                        <input style="width: 540px;" type="number" id="first-name" name="txtGia1" value="${rows.getGia()}" required="required" class="form-control col-md-7 col-xs-12">
                                                                                                    </div>
                                                                                                </div><br><br>
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="last-name">Mô tả <span class="required">*</span>
                                                                                                    </label>
                                                                                                    <div class="col-md-6 col-sm-6 col-xs-12" >
                                                                                                        <textarea style="width: 540px;" rows="5"  id="last-name" name="txtMoTa1" class="form-control col-md-7 col-xs-12">${rows.getMoTa()}</textarea>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="first-name">Hình <span class="required">*</span>
                                                                                                    </label>
                                                                                                    <div class="col-md-12 col-sm-12 col-xs-24">
                                                                                                        <input style="width: 540px;" type="file" id="first-name" name="txtHinh1" value="${rows.getHinh()}" class="form-control col-md-7 col-xs-12">
                                                                                                    </div>
                                                                                                </div><br><br>
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24">Mã loại *</label>
                                                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                                        <select class="form-control" name="cbxMaLoai1" style="width: 540px;">
                                                                                                            <option value="" >Chọn thể loại</option>
                                                                                                            <% session.setAttribute("CBX", new SanPhamDAO().cbx_MaLoai());%>
                                                                                                            <c:set var="list" value="${sessionScope.CBX}"/>
                                                                                                            <c:if test="${not empty list}">
                                                                                                                <c:set var="maloai" value="${rows.getMaLoai()}"/>
                                                                                                                <c:forEach var="rows" items="${list}">
                                                                                                                    <c:if test="${rows.getMaLoai() == maloai}">
                                                                                                                        <option selected>${rows.getMaLoai()}</option>
                                                                                                                    </c:if>
                                                                                                                    <option>${rows.getMaLoai()}</option>
                                                                                                                </c:forEach>
                                                                                                            </c:if>
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="modal-footer">
                                                                                                <input type="submit" name="action" value="Close" class="btn btn-secondary" data-dismiss="modal">
                                                                                                <input type="submit" name="action" value="Save changes" class="btn btn-primary">
                                                                                            </div>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Modal delete -->
                                                                            <div class="modal fade" id="del${count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                                <div style="width: 35%; margin: 200px auto;"  class="modal-dialog modal-dialog-centered" role="document">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-body" style="text-align: center; margin-top: 20px;">
                                                                                            <img src="images/info.png" style="width: 70px; height: 70px;">
                                                                                            <p style="padding-top: 20px; font-size: 30px; font-weight: bold; color: #454544;">Thông Báo</p>
                                                                                            <span style="padding-top: 20px; font-size: 20px; color: #454544;">Bạn có chắc chắn muốn xoá thể loại ${ten}</span><br>
                                                                                            <form action="../ControllerSanPham" method="POST">
                                                                                                <button style="margin-top: 20px; height: 40px; width: 90px; background-color: #3b7eeb; color: #fff;" type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                                                <button style="margin-top: 20px; height: 40px; width: 90px; background-color: #eb4242; border: none; color: #fff;" type="submit" name="action" value="Delete" class="btn btn-primary">Xoá</button>
                                                                                                <input type="hidden" name="txtMaSP" value="${ma}">
                                                                                            </form>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Line graph<small>Sessions</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <canvas id="lineChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Bar graph <small>Sessions</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <canvas id="mybarChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->

                <!-- footer content -->
                <footer>
                    <div class="pull-right">
                        Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="vendors/nprogress/nprogress.js"></script>
        <!-- iCheck -->
        <script src="vendors/iCheck/icheck.min.js"></script>
        <!-- Datatables -->
        <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <script src="vendors/jszip/dist/jszip.min.js"></script>
        <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="vendors/pdfmake/build/vfs_fonts.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="build/js/custom.min.js"></script>
        <script src="vendors/Chart.js/dist/Chart.min.js"></script>
    </body>
</html>