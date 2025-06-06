<%-- 
    Document   : homepage
    Created on : Jun 5, 2025, 3:09:37 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        

        <%@include file="information/bootstrap.jspf" %>
    </head>
    <body>


        <%@include file="information/header.jspf" %>

       



        <div class="background">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="inner-wrap">
                            <p class="inner-sub-title">LET'S HEALTHY MAKE YOU BEAUTIFUK</p>
                            <h1 class="inner-title">Healthy Living</h1>
                            <div class="inner-button">
                                <a href="#" class="button-logo">More About Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Welcome -->
        <div class="welcome">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 d-flex align-items-center">
                        <div class="inner-main">
                            <h1 class="inner-title">
                                Welcome to Your Health Center
                            </h1>
                            <p class="inner-desc">
                                Aenean luctus lobortis tellus, vel ornare enim molestie condimentum. Curabitur lacinia nisi
                                vitae velit volutpat venenatis.
                                <br>
                                Sed a dignissim lacus. Quisque fermentum est non orci commodo, a luctus urna mattis. Ut
                                placerat, diam a tempus vehicula.
                            </p>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="inner-image">
                            <img src="images/home/image8.png" alt="Logo">
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Plan -->
        <div class="plan">
            <div class="container">
                <div class="inner-header">
                    <h2 class="inner-title">Các khóa h?c cai thu?c</h2>
                </div>
                <div class="row">
                    <div class="col-xl-4">
                        <div class="inner-plan-one">
                            <div class="inner-image">
                                <img src="images/home/plan-1.jpg" alt="anh1">
                            </div>
                            <div class="inner-content">
                                <h4 class="inner-title">Gói 30 Ngày: Kh?i ??u V?ng Ch?c</h4>
                                <p class="inner-desc">
                                    Gói 30 ngày "Kh?i ??u V?ng Ch?c" h? tr? b?n t?ng b??c v??t qua c?n thèm thu?c, thay ??i
                                    thói quen x?u và xây d?ng l?i s?ng lành m?nh.
                                </p>
                                <span class="price">300.000vnđ</span>
                            </div>
                            <div class="inner-button">
                                <a href="" class="button">Đăng Ký</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="inner-plan-one">
                            <div class="inner-image">
                                <img src="images/home/plan-2.jpg" alt="anh2">
                            </div>
                            <div class="inner-content">
                                <h4 class="inner-title">Gói 60 Ngày: T?ng T?c Quy?t ??nh</h4>
                                <p class="inner-desc">
                                    V?i l? trình h? tr? bài b?n, b?n s? ti?p t?c ki?m soát c?m xúc, h?c cách qu?n lý stress
                                    và xây d?ng thói quen s?ng tích c?c.
                                </p>
                                <span class="price">500.000vnđ</span>
                            </div>
                            <div class="inner-button">
                                <a href="" class="button">Đăng Ký</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="inner-plan-one">
                            <div class="inner-image">
                                <img src="images/home/plan-3.jpg" alt="anh3">
                            </div>
                            <div class="inner-content">
                                <h4 class="inner-title">Gói 90 Ngày: V?ng B?n Tr?n ??i</h4>
                                <p class="inner-desc">
                                    B?n s? ???c h? tr? ?? duy trì ??ng l?c, phòng tránh tái nghi?n và phát tri?n nh?ng thói
                                    quen m?i tích c?c v? ?n u?ng, v?n ??ng, gi?c ng? và qu?n lý stress.
                                </p>
                                <span class="price">800.000vnđ</span>
                            </div>
                            <div class="inner-button">
                                <a href="" class="button">Đăng Ký</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@ page session="true" %>
        <%
            String role = (String) session.getAttribute("role");
            String id = (String) session.getAttribute("id"); // IDMember
        %>

        <% if ("member".equalsIgnoreCase(role)) {%>


        <form action="SupportServlet" method="get">
            <input type="hidden" name="idMember" value="<%= id%>">
            <button type="submit" class="support-button" title="Support with your Coach">
                💬
            </button>
        </form>
        <% } else {%>
            <form action="SupportServlet" method="get">
            <input type="hidden" name="idMember" value="<%= id%>">
            <button type="submit" class="support-button" title="Support with your Coach">
                💬
            </button>
        </form>
        
        <% }%>
        
        <%@include file="information/footer.jspf" %>
    </body>
</html>
