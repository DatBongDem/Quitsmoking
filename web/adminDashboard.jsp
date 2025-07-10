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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Chào mừng ADMIN đấng toàn năng của chúng tôi!!</h1>

        <a href="ManageCoachServlet">
            <button>Quản lý Coach</button>
            
           
        </a>
<<<<<<< Updated upstream
        
        <form action="AdminManageMemberServlet" method="get">
    <button type="submit">Quản lý Member</button>
</form>
=======

        <a href="adminManageQuiz.jsp">
            <button>Quản lý Quiz</button>
        </a>

        
        <form action="AdminLogoutServlet" method="get" style="display:inline;">
            <button type="submit" class="btn btn-danger">Đăng xuất</button>
        </form>
>>>>>>> Stashed changes
    </body>
</html>
