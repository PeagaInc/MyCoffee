

<%@page import="Cart.CartBean"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>PS10576 - ASM</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>
    <body>
        <script src="https://uhchat.net/code.php?f=2d81b4"></script>
        <!-- Modal -->
        <div class="modal fade" id="ex" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="ControllerCart" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Giỏ Hàng Của bạn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <c:set var="shop" value="${sessionScope.SHOP}"/>
                            <c:set var="tc" value="0"/>
                            <c:set var="sl" value="0"/>
                            <c:if test="${shop != null}">
                                <table style="margin: 0 auto; width: 100%; text-align: center;">
                                    <c:if test="${not empty shop}">
                                        <c:forEach var="rows" items="${shop}">
                                            <tr style="height: 60px; border-bottom: 0.5px solid #dbdbdb;">
                                                <td><img src="admin/hinh/${rows.value.getSanPham().getHinh()}" alt="" width="25px;" height="35px;"></td>
                                                <td style="text-align: left;">${rows.value.getSanPham().getTenSP()}</td>
                                                <td>$${rows.value.getSanPham().getGia()}</td>
                                                <td style="width: 70px;">${rows.value.getSoLuong()}</td>
                                            <form action="ControllerCart" method="POST">
                                                <td style="width: 50px;"><button style="background-color: transparent; border: none;" type="submit "name="action" value="xoa"><img style="width: 30px; height: 30px;" src="admin/images/close.png"></button></td> 
                                                <input type="hidden" name="txtMaSP1" value="${rows.value.getSanPham().getMaSP()}">
                                            </form>
                                            <c:set var="tc" value="${tc + (rows.value.getSanPham().getGia() * rows.value.getSoLuong())}"/>
                                            <c:set var="sl" value="${sl + rows.value.getSoLuong()}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <tr style="height: 60px; border-bottom: 0.5px solid #dbdbdb;">
                                        <td></td>
                                        <th style="color: red;">Tổng cộng</th>
                                        <td>$${tc}</td>
                                        <td style="text-align: center;">${sl} items</td>
                                        <td></td>
                                    </tr>
                                </table>
                            </c:if>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" name="action" value="Đóng" class="btn btn-secondary" data-dismiss="modal">
                            <input type="submit" name="action" value="Thanh toán" class="btn btn-primary">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +84 334 255 377</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> ducntps10576@fpt.edu.vn</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 74 Hàn Hải Nguyên Q.11</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                            <c:set var="dauhieu" value="${sessionScope.DAUHIEU}"/>
                            <c:if test="${dauhieu == 'dn'}">
                                <c:set var="ten" value="${sessionScope.TEN}"/>
                            <li><a href="#">Xin chào ${ten.getHoTen()}</a></li>
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i>Đăng xuất</a></li>
                            </c:if>
                            <c:if test="${dauhieu == null}">
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i>Đăng nhập</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="index.jsp" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form>
                                    <select class="input-select">
                                        <option value="0">All Categories</option>
                                    </select>
                                    <input class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div class="dropdown">
                                    <a style="cursor: pointer;" class="dropdown-toggle" data-toggle="modal" data-target="#ex">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">${sl}</div>
                                    </a>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="store.jsp">Sản phẩm</a></li>
                        <li><a href="store.jsp">Oppo</a></li>
                        <li><a href="store.jsp">Apple</a></li>
                        <li><a href="store.jsp">Huawei</a></li>
                        <li><a href="store.jsp">SamSung</a></li>
                        <li><a href="store.jsp">Xiaomi</a></li>
                        <li><a href="map.jsp">Liên hệ</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/appleChon.png" alt="" style="width: 100%; height: 50%;">
                            </div>
                            <div class="shop-body">
                                <h3>Apple<br>Collection</h3>
                                <a href="store.jsp" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/SamSungChon.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>SamSung<br>Collection</h3>
                                <a href="store.jsp" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/OppoChon.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>OPPO<br>Collection</h3>
                                <a href="store.jsp" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Sản phẩm mới</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <% session.setAttribute("DS", new SanPhamDAO().loadSP());%>
                                        <c:set var="list" value="${sessionScope.DS}"/>
                                        <c:forEach var="rows" items="${list}" begin="6" end="10" step="1">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="admin/hinh/${rows.getHinh()}" alt="" style="width: 80%; margin: 0 auto; padding-top: 20px; height: 100%;">
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${rows.getMaLoai()}</p>
                                                    <h3 class="product-name"><a href="#">${rows.getTenSP()}</a></h3>
                                                    <h4 class="product-price">$${rows.getGia()} <del class="product-old-price">$${rows.getGia() + 100}</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <form action="ControllerCart" method="POST">
                                                        <button type="submit" class="add-to-cart-btn" name="action" value="add to cart"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        <input type="hidden" name="txtMaSP" value="${rows.getMaSP()}">
                                                        <input type="hidden" name="txtTenSP" value="${rows.getTenSP()}">
                                                        <input type="hidden" name="txtGia" value="${rows.getGia()}">
                                                        <input type="hidden" name="txtHinh" value="${rows.getHinh()}">
                                                    </form>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- product -->
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="store.jsp">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Bán chạy nhất</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <!-- product -->
                                        <% session.setAttribute("DS", new SanPhamDAO().loadSP());%>
                                        <c:set var="list" value="${sessionScope.DS}"/>
                                        <c:forEach var="rows" items="${list}" begin="2" end="6" step="1">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="admin/hinh/${rows.getHinh()}" alt="" style="width: 80%; margin: 0 auto; padding-top: 20px; height: 100%;">
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${rows.getMaLoai()}</p>
                                                    <h3 class="product-name"><a href="#">${rows.getTenSP()}</a></h3>
                                                    <h4 class="product-price">$${rows.getGia()} <del class="product-old-price">$${rows.getGia() + 100}</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <form action="ControllerCart" method="POST">
                                                        <button type="submit" class="add-to-cart-btn" name="action" value="add to cart"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        <input type="hidden" name="txtMaSP" value="${rows.getMaSP()}">
                                                        <input type="hidden" name="txtTenSP" value="${rows.getTenSP()}">
                                                        <input type="hidden" name="txtGia" value="${rows.getGia()}">
                                                        <input type="hidden" name="txtHinh" value="${rows.getHinh()}">
                                                    </form>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Ưa chuộng</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">
                            <div>
                                <!-- product widget -->
                                <% session.setAttribute("DS", new SanPhamDAO().loadSP());%>
                                <c:set var="list" value="${sessionScope.DS}"/>
                                <c:forEach var="rows" items="${list}" begin="8" end="10" step="1">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="admin/hinh/${rows.getHinh()}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${rows.getMaLoai()}</p>
                                            <h3 class="product-name"><a href="#">${rows.getTenSP()}</a></h3>
                                            <h4 class="product-price">$${rows.getGia()} <del class="product-old-price">$${rows.getGia() + 100}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Ưa chuộng</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <div>
                                <!-- product widget -->
                                <% session.setAttribute("DS", new SanPhamDAO().loadSP());%>
                                <c:set var="list" value="${sessionScope.DS}"/>
                                <c:forEach var="rows" items="${list}" begin="10" end="12" step="1">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="admin/hinh/${rows.getHinh()}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${rows.getMaLoai()}</p>
                                            <h3 class="product-name"><a href="#">${rows.getTenSP()}</a></h3>
                                            <h4 class="product-price">$${rows.getGia()} <del class="product-old-price">$${rows.getGia() + 100}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Ưa chuộng</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                                <!-- product widget -->
                                <% session.setAttribute("DS", new SanPhamDAO().loadSP());%>
                                <c:set var="list" value="${sessionScope.DS}"/>
                                <c:forEach var="rows" items="${list}" begin="10" end="12" step="1">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="admin/hinh/${rows.getHinh()}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${rows.getMaLoai()}</p>
                                            <h3 class="product-name"><a href="#">${rows.getTenSP()}</a></h3>
                                            <h4 class="product-price">$${rows.getGia()} <del class="product-old-price">$${rows.getGia() + 100}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>74 Hàn Hải Nguyên Q.11</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+84 334 255 377</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>ducntps10576@fpt.edu.vn</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->
        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

