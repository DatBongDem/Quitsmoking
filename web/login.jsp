<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="information/bootstrap.jspf" %>
        <!-- Link CSS-->
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <!--Home Page-->
        <a href="homepage.jsp" class="home-button">Home</a>    
        <!--End Home Page-->

        <!--Form Login-->
        <div class="login">
            <div class="container">
                <div class="row d-flex align-items-stretch" style="min-height: 500px;">
                    <div class="col-xl-7">
                        <div class="inner-login">
                            <div class="inner-box">
                                <!--Display Error-->
                                <c:if test="${not empty error}">
                                    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Login Error</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-danger font-weight-bold">
                                                    ${error}
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                 
                                </c:if>
                                <!--End Display Error-->

                                <h3 class="inner-title">Sign In</h3>
                                <form action="LoginServlet" method="POST" class="form-login">
                                    <label for="role" class="item-name">Select Role</label><br>
                                    <div class="select-wrapper">
                                        <select class="inner-option" id="role" name="role">
                                            <option value="member" selected>Member</option>
                                            <option value="coach">Coach</option>
                                        </select>
                                    </div>


                                    <label for="IDMember" class="item-name">User Name</label><br>

                                    <label for="username" class="item-name">Account</label><br>

                                    <div class="inner-input">
                                        <input type="text" id="IDMember" name="username" placeholder="ID Member">
                                    </div>

                                    <label for="password" class="item-name">Password</label><br>
                                    <div class="inner-input">
                                        <input type="password" id="password" name="password" placeholder="Password">
                                    </div>

                                    <div class="inner-button">
                                        <button type="submit" class="button" value="Login">Login</button>
                                    </div>
                                    <!-- Remember Me + Forgot Password -->
                                    <div class="inner-options">
                                        <label for="rememberMe" class="item-name">
                                            <input type="checkbox" id="rememberMe" name="remember">
                                            Remember Me
                                        </label>
                                        <a href="#">Forgot Password?</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5">
                        <div class="welcome">
                            <div class="inner-welcome">
                                <h2 class="inner-title-welcome">
                                    Welcome to Login
                                </h2>
                                <span class="inner-sub-title">Don't have an account?</span>
                                <div class="inner-button">
                                    <a href="register.jsp" class="button">Sign Up</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty error}">
    <%-- BEGIN ERROR MODAL --%>
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Login Error</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-danger font-weight-bold">
                    ${error}  <%-- Nơi in ra thông báo lỗi (ví dụ: "Tài khoản của bạn đã bị xóa.") --%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
    <%-- END ERROR MODAL --%>
</c:if>
        <!--End Form Login-->

        <c:if test="${not empty error}">
            <script>
                $(document).ready(function () {
                    $('#errorModal').modal('show');
                    $('#errorModal').on('hidden.bs.modal', function () {
                        $('#IDMember').focus();
                    });
                });
            </script>
        </c:if>
    </body>

</html>