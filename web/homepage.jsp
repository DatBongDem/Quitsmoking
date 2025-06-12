<%-- 
    Document   : homepage
    Created on : Jun 5, 2025, 3:09:37 PM
    Author     : Nguyen Tien Dat
--%>

<%@page import="DAO.SystemDao"%>
<%@page import="DTO.QuitPlan"%>
<%@page import="java.util.List"%>
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
                            <p class="inner-sub-title">LET'S HEALTHY MAKE YOU BEAUTIFULL</p>
                            <h1 class="inner-title">Healthy Living</h1>
                            <div class="inner-button">
                                <a href="AboutUs.jsp" class="button-logo">More About Us</a>
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

        <%
            SystemDao dao = new SystemDao();
            List<QuitPlan> planList = dao.getAllQuitPlans();
        %>

        <!-- Plan -->
        <div class="plan">
            <div class="container">
                <div class="inner-header">
                    <h2 class="inner-title">Các khóa học cai thuốc</h2>
                </div>
                <div class="row">
                    <%
                        for (QuitPlan plan : planList) {
                    %>
                    <div class="col-xl-4">
                        <div class="inner-plan-one">
                            <div class="inner-image">
                                <img src="images/home/plan-1.jpg" alt="anh1">
                            </div>
                            <div class="inner-content">
                                <h4 class="inner-title"><%= plan.getGoals()%></h4>
                                <p class="inner-desc">
                                    <%= plan.getProgress()%>
                                </p>
                                <span class="price"><%= plan.getPrice()%> VND</span>
                            </div>
                            <div class="inner-button">
                                <a href="" class="button">Đăng Ký</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
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
        <form action="CoachSupportServlet" method="get">
        <input type="hidden" name="idCoach" value="<%= id %>">
        <button type="submit" class="support-button" title="Support with Members">
            💬
        </button>
    </form>

        <% }%>

        <%@include file="information/footer.jspf" %>
    </body>
</html>
