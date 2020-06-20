<%-- 
    Document   : sidebar
    Created on : Jun 20, 2020, 11:14:51 AM
    Author     : DieuHuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
             <!-- icon -->       
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class=" clearfix">
                <div class="profile_picture">
                    <img src="images/chipchip.jpg" alt="..." class="img-circle profile_img">
                </div>
                <div class="profile_name">
                    <h2>Huyenn Chipp</span></h2>
                    <span>Manager</span>
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
                        <li><a><i class="fa fa-edit"></i> Quản lý sản phẩm <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="./ThemTheLoai.jsp">Thêm thể loại</a></li>
                                <li><a href="./DanhSachTheLoai.jsp">Danh sách thể loại</a></li>
                            </ul>
                        </li>

                        <!--Quản lý sản phẩm-->
                        <li><a><i class="fa fa-edit"></i> Quản lý nhân viên <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="./ThemSanPham.jsp">Thêm sản phẩm</a></li>
                                <li><a href="./DanhSachSanPham.jsp">Danh sách sản phẩm</a></li>
                            </ul>
                        </li>

                        <!--Quản lý khách hàng-->
                        <li><a><i class="fa fa-edit"></i> Quản lý thu chi <span class="fa fa-chevron-down"></span></a>
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
</html>
