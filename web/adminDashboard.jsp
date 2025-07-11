<%-- 
    Document   : adminDashboard
    Created on : Jul 6, 2025, 4:12:15 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Trang Quản trị Admin</title>
        <%@include file="information/bootstrap.jspf" %>
        <link rel="stylesheet" href="css/admin-dasboard.css">
    </head>
    <body>
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>Admin Manager</h3>
            </div>
            <ul class="sidebar-nav">
                <li>
                    <a href="ManageCoachServlet">
                        <i class="fas fa-users"></i> Quản lý Coach
                    </a>
                </li>
                <li>
                    <a href="AdminManageMemberServlet">
                        <i class="fas fa-user-friends"></i> Quản lý Member
                    </a>
                </li>
                <li>
                    <a href="adminManageQuiz.jsp">
                        <i class="fas fa-question-circle"></i> Quản lý Quiz
                    </a>
                </li>
            </ul>
          <form action="AdminLogoutServlet" method="get" style="display:inline;">
            <button type="submit" class="btn btn-danger">Đăng xuất</button>
        </form>
        </div>


  <form action="QuitplanManagerServlet" method="get">
            <button type="submit">Quản lý Quitplan</button>
        </form>
 
       

        <div class="main-content">
            <div class="content-header">
                <h1>Chào mừng ADMIN đấng toàn năng của chúng tôi!!</h1>
                <p>Đây là bảng điều khiển chính của hệ thống quản lý cai nghiện ma túy.</p>
            </div>


            <div class="dashboard-cards">
                <a href="ManageCoachServlet" class="card">
                    <i class="fas fa-users"></i>
                    <h4>Quản lý Coach</h4>
                </a>
                <a href="AdminManageMemberServlet" class="card">
                    <i class="fas fa-user-friends"></i>
                    <h4>Quản lý Member</h4>
                </a>
                <a href="adminManageQuiz.jsp" class="card">
                    <i class="fas fa-question-circle"></i>
                    <h4>Quản lý Quiz</h4>
                </a>
            </div>
        </div>
    </body>
</html>

