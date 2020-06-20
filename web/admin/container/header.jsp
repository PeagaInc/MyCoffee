<%-- 
    Document   : header
    Created on : Jun 20, 2020, 11:14:35 AM
    Author     : DieuHuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style><%@include file="customStyle.css"%></style>
    <div class="top_nav">
        <div class="nav_menu">
            <nav>
                <div class="nav toggle">
                    <a id="menu_toggle"><i class=" header fa fa-angle-right"></i></a>
                </div>

                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="javascript:;" class="header user-profile dropdown-toggle " data-toggle="dropdown" aria-expanded="false">
                            <img src="images/chipchip.jpg" alt="">Huyenn Chipp
                            <span class=" fa fa-angle-down"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                            <li><a  class="header" href="javascript:;"> Profile</a></li>
                            <li>
                                <a href="javascript:;">
                                    <span class="badge bg-red pull-right">50%</span>
                                    <span>Settings</span>
                                </a>
                            </li>
                            <li><a class="header" href="javascript:;">Help</a></li>
                            <li><a href="Login.jsp"><i class="header fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                    </li>

                    <li role="presentation" class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle info-number header" data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-red">6</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</html>
