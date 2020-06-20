

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng nhập</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image1/png" href="images1/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor1/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts1/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts1/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor1/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor1/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor1/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor1/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor1/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css1/util.css">
        <link rel="stylesheet" type="text/css" href="css1/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images1/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <c:set var="check" value="${sessionScope.QWER}"/>
                    <form action="ControllerCart" method="POST" class="login100-form validate-form">
                        <span class="login100-form-title p-b-49">
                            Đăng nhập
                        </span>
                        <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                            <span class="label-input100">Số điện thoại</span>
                            <input class="input100" type="tel" name="txtSoDT" placeholder="Nhập số điện thoại">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <span class="label-input100">Mật khẩu</span>
                            <input class="input100" type="password" name="txtMatKhau" placeholder="Nhập mật khẩu">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <input type="hidden" name="txtDauHieu" value="${check}">
                        <div class="text-right p-t-8 p-b-31">
                            <a href="registration.jsp">
                                Đăng ký tài khoản?
                            </a>
                        </div>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" type="submit" name="action" value="DangNhap">
                                    Đăng nhập
                                </button>
                            </div>
                        </div>

                        <div class="txt1 text-center p-t-54 p-b-20">
                            <span>
                                hoặc đăng nhập với
                            </span>
                        </div>

                        <div class="flex-c-m">
                            <a href="#" class="login100-social-item bg1">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="#" class="login100-social-item bg2">
                                <i class="fa fa-twitter"></i>
                            </a>

                            <a href="#" class="login100-social-item bg3">
                                <i class="fa fa-google"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor1/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor1/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor1/bootstrap/js/popper.js"></script>
        <script src="vendor1/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor1/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor1/daterangepicker/moment.min.js"></script>
        <script src="vendor1/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor1/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js1/main.js"></script>

    </body>
</html>
