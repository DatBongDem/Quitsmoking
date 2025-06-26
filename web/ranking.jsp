<%-- 
    Document   : ranking
    Created on : Jun 26, 2025, 9:17:36 AM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Member" %>
<html>
<head><title>Xếp hạng Huy hiệu</title></head>
<body>
    <h2>🥈 Silver</h2>
    <table border="1">
        <tr><th>STT</th><th>ID</th><th>Tên</th><th>Số huy hiệu</th></tr>
        <%
            List<Member> silverList = (List<Member>) request.getAttribute("silverList");
            int i = 1;
            for (Member m : silverList) {
        %>
        <tr><td><%= i++ %></td><td><%= m.getIDMember() %></td><td><%= m.getMemberName() %></td><td><%= m.getPoint() %></td></tr>
        <% } %>
    </table>

    <h2>🥇 Gold</h2>
    <table border="1">
        <tr><th>STT</th><th>ID</th><th>Tên</th><th>Số huy hiệu</th></tr>
        <%
            List<Member> goldList = (List<Member>) request.getAttribute("goldList");
            i = 1;
            for (Member m : goldList) {
        %>
        <tr><td><%= i++ %></td><td><%= m.getIDMember() %></td><td><%= m.getMemberName() %></td><td><%= m.getPoint() %></td></tr>
        <% } %>
    </table>

    <h2>💎 Diamond</h2>
    <table border="1">
        <tr><th>STT</th><th>ID</th><th>Tên</th><th>Số huy hiệu</th></tr>
        <%
            List<Member> diamondList = (List<Member>) request.getAttribute("diamondList");
            i = 1;
            for (Member m : diamondList) {
        %>
        <tr><td><%= i++ %></td><td><%= m.getIDMember() %></td><td><%= m.getMemberName() %></td><td><%= m.getPoint() %></td></tr>
        <% } %>
    </table>
</body>
</html>
