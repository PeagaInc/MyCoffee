
<%@page import="Model.TaiKhoan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TaiKhoanDAO"%>
<%@page import="DAO.TheLoaiDAO"%>
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

        <title>My Coffee</title>

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
                <!-- Side bar -->
                <jsp:include page="container/sidebar.jsp" />
                <!-- Side bar -->
                <!-- top navigation -->
               <jsp:include page="container/header.jsp" />
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Danh Sách Tài Khoản <small></small></h4>
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
                                        <h4>User table <small></small></h4>
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
                                                                <th>Tên đăng nhập</th>
                                                                <th>Mật khẩu</th>
                                                                <th>Vai trò</th>
                                                                <th>#Chức năng</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                session.setAttribute("TAIKHOAN", new TaiKhoanDAO().layDanhSach());
                                                            %>
                                                            <c:set var="dem" value="0"/>
                                                            <c:set var="count" value="0"/>
                                                            <c:set var="tkhoan" value="${sessionScope.TAIKHOAN}"/>
                                                            <c:if test="${not empty tkhoan}">
                                                                <c:forEach var="rows" items="${tkhoan}">
                                                                    <c:set var="count" value="${count + 1}"/>
                                                                    <c:set var="dem" value="${dem + 1}"/>
                                                                    <tr>
                                                                        <th>${count}</th>
                                                                        <td>${rows.getTenDangNhap()}</td>
                                                                        <td>${rows.getMatKhau()}</td>
                                                                        <c:set var="vaitro" value="${rows.isVaiTro()}"/>
                                                                        <c:if test="${vaitro == true}">
                                                                            <td>Quản lý</td>
                                                                        </c:if>
                                                                        <c:if test="${vaitro != true}">
                                                                            <td>Nhân viên</td>
                                                                        </c:if>
                                                                        <td>
                                                                            <input type="button" name="action" class="btn btn-info btn-xs" value="Edit" data-toggle="modal" data-target="#${count}">
                                                                            <input class="btn btn-danger btn-xs" type="button" value="Delete" data-toggle="modal" data-target="#del${count}">
                                                                            <!-- Modal -->
                                                                            <div class="modal fade" id="${count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                    <form action="../ControllerLogin" method="POST">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Cập Nhập Tài Khoản</h5>
                                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                                    <span aria-hidden="true">&times;</span>
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="first-name">Tên đăng nhập <span class="required">*</span>
                                                                                                    </label><br><br>
                                                                                                    <div class="col-md-12 col-sm-12 col-xs-24">
                                                                                                        <input style="width: 540px;" type="text" id="first-name" name="txtTenDN1" value="${rows.getTenDangNhap()}" required="required" class="form-control col-md-7 col-xs-12">
                                                                                                    </div>
                                                                                                </div><br><br>
                                                                                                <div class="form-group">
                                                                                                    <label class="control-label col-md-12 col-sm-12 col-xs-24" for="last-name">Mật khẩu <span class="required">*</span>
                                                                                                    </label>
                                                                                                    <div class="col-md-12 col-sm-12 col-xs-24">
                                                                                                        <input style="width: 540px;" type="text" id="last-name" name="txtMK1" value="${rows.getMatKhau()}" required="required" class="form-control col-md-7 col-xs-24">
                                                                                                    </div>
                                                                                                </div><br><br>
                                                                                                <div class="form-group">
                                                                                                    <label for="middle-name" class="control-label col-md-12 col-sm-12 col-xs-24">Vai trò *:</label><br>
                                                                                                    <div style="padding-top: 7px;"></div>
                                                                                                    <c:set var="vt" value="${rows.isVaiTro()}"/>
                                                                                                    <c:if test="${vt == true}">
                                                                                                        &nbsp Quản lý:&nbsp<input type="radio" class="flat" name="rdbVaitro1" id="genderM" checked value="QuanLy" required />&nbsp &nbsp
                                                                                                        Nhân viên:&nbsp<input type="radio" class="flat" name="rdbVaitro1" id="genderF" value="NhanVien" />
                                                                                                    </c:if>
                                                                                                    <c:if test="${vt != true}">
                                                                                                        &nbsp Quản lý:&nbsp<input type="radio" class="flat" name="rdbVaitro1" id="genderM" value="QuanLy" required />&nbsp &nbsp
                                                                                                        Nhân viên:&nbsp<input type="radio" class="flat" name="rdbVaitro1" checked id="genderF" value="NhanVien" />
                                                                                                    </c:if>
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
                                                                                            <span style="padding-top: 20px; font-size: 20px; color: #454544;">Bạn có chắc chắn muốn xoá tài khoản ${rows.getTenDangNhap()}</span><br>
                                                                                            <form action="../ControllerLogin" method="POST">
                                                                                                <button style="margin-top: 20px; height: 40px; width: 90px; background-color: #3b7eeb; color: #fff;" type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                                                <button style="margin-top: 20px; height: 40px; width: 90px; background-color: #eb4242; border: none; color: #fff;" type="submit" name="action" value="Delete" class="btn btn-primary">Xoá</button>
                                                                                                <input type="hidden" name="txtTenDN" value="${rows.getTenDangNhap()}">
                                                                                                <input type="hidden" name="txtMatKhau" value="${rows.getMatKhau()}">
                                                                                                <input type="hidden" name="rdbVaiTro" value="${rows.isVaiTro()}">
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
                </div>
                <!-- /page content -->

                <!-- footer content -->
                <jsp:include page="container/footer.jsp" />
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