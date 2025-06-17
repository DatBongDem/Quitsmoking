<%-- 
    Document   : progress
    Created on : Jun 17, 2025, 5:26:02 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%
    String idMember = (String) session.getAttribute("id");
    if (idMember == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String startDate = (String) request.getAttribute("startDate");
    String todayStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

    Integer todayCigarettes = (Integer) request.getAttribute("todayCigarettes");
    Integer yesterday = (Integer) request.getAttribute("yesterdayCigarettes");
    Integer firstDay = (Integer) request.getAttribute("firstDayCigarettes");
    Boolean isFirstDay = (Boolean) request.getAttribute("isFirstDay");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Tiến trình cai thuốc</title>
</head>
<body>

<h2>Tiến trình cai thuốc ngày <%= todayStr %></h2>
<p>ID Member: <%= idMember %></p>
<p>Ngày bắt đầu tiến trình: <%= startDate %></p>

<% if (isFirstDay != null && isFirstDay) { %>
    <p style="color: green;"><b>🎉 Hôm nay là ngày đầu tiên bạn tham gia tiến trình!</b></p>
<% } %>

<hr>

<form action="ProgressLogServlet" method="post">
    <input type="hidden" name="idMember" value="<%= idMember %>">

    <label>Hôm nay bạn đã hút bao nhiêu điếu thuốc?</label><br>
    <input type="number" name="cigarettes" required><br><br>

    <label>Câu hỏi 1:</label><br><textarea name="q1" required></textarea><br><br>
    <label>Câu hỏi 2:</label><br><textarea name="q2" required></textarea><br><br>
    <label>Câu hỏi 3:</label><br><textarea name="q3" required></textarea><br><br>
    <label>Câu hỏi 4:</label><br><textarea name="q4" required></textarea><br><br>
    <label>Câu hỏi 5:</label><br><textarea name="q5" required></textarea><br><br>

    <button type="submit">Gửi tiến trình</button>
</form>

<% if (todayCigarettes != null) { %>
    <hr>
    <h3>Kết quả hôm nay</h3>
    <p>Bạn đã hút: <%= todayCigarettes %> điếu thuốc hôm nay.</p>

    <% if (!Boolean.TRUE.equals(isFirstDay)) { %>
        <% if (yesterday != null) { %>
            <p>👉 Giảm <%= (yesterday - todayCigarettes) %> điếu so với hôm qua.</p>
        <% } %>
        <% if (firstDay != null) { %>
            <p>👉 Giảm <%= (firstDay - todayCigarettes) %> điếu so với ngày đầu tiên.</p>
        <% } %>
    <% } %>
<% } %>

</body>
</html>