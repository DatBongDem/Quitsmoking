<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!-- Link CSS-->
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
        <style>
            /* Home Button */
            .home-button {
                position: fixed; /* C? ??nh v? trí */
                top: 20px; /* Cách mép trên 20px */
                left: 20px; /* Cách mép trái 20px */
                background-color: #28a745; /* Màu xanh lá ch? ??o */
                color: white; /* Màu ch? */
                padding: 10px 20px; /* Kho?ng cách bên trong nút */
                font-size: 16px; /* Kích th??c ch? */
                font-weight: bold; /* Ch? ??m */
                border: none; /* Không vi?n */
                border-radius: 8px; /* Bo góc */
                text-decoration: none; /* Lo?i b? g?ch chân */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* ?? bóng nh? */
                transition: all 0.3s ease; /* Hi?u ?ng chuy?n ??ng */
                z-index: 999; /* Hi?n th? trên cùng */
            }


            .home-button:hover {
                background-color: #218838; /* Màu ??m h?n khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* ?? bóng t?ng khi hover */
                transform: scale(1.05); /* Hi?u ?ng phóng to nh? */
                text-decoration: none;
            }
        </style>
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
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

                                    <label for="username" class="item-name">User Name</label><br>
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
                                        <label class="item-name">
                                            <input type="checkbox" name="remember">
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
        <!--End Form Login-->

        <c:if test="${not empty error}">
            <script>
                $(document).ready(function () {
                    $('#exampleModal').modal('show');
                    $('#exampleModal').on('hidden.bs.modal', function () {
                        $('#IDMember').focus();
                    });
                });
            </script>
        </c:if>
    </body>

</html>