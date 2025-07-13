<%-- 
    Document   : report
    Created on : Jul 13, 2025, 1:55:27 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String reporterID = (String) session.getAttribute("id");  // hoặc "userID"
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Report</title>
    </head>
    <body>
        <h1>nhớ bỏ header footer vô</h1>
        <h2>Gửi báo cáo</h2>
        
        <a href="homepage.jsp" class="home-button">trở lại</a>  
        
        <%   String message = (String) request.getAttribute("message");
            if (message != null) {%>
        <p style="color: green;"><%= message%></p>
        <% }%>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reporterID" value="<%= reporterID%>">
            <input type="hidden" name="role" value="<%= role%>">

            <label>Loại báo cáo:</label>
            <input type="text" name="reportType" required><br>

            <label>Link liên quan (nếu có):</label>
            <input type="text" name="link"><br>

            <label>Mô tả:</label><br>
            <textarea name="description" rows="5" cols="40" required></textarea><br>

            <input type="submit" value="Gửi báo cáo">
        </form>

    </body>
</html>
