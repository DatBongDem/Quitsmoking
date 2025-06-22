<%-- 
    Document   : badge
    Created on : Jun 22, 2025, 5:24:32 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.Badge" %>
<html>
<head>
    <title>Huy hiệu của bạn</title>
    <style>
        body {
            font-family: Arial;
            padding: 20px;
        }
        .badge {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <h2>Danh sách huy hiệu</h2>

    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <p style="color:red;"><%= errorMessage %></p>
    <%
        }

        List<Badge> badgeList = (List<Badge>) request.getAttribute("badgeList");
        if (badgeList == null || badgeList.isEmpty()) {
    %>
        <p>Bạn chưa nhận được huy hiệu nào.</p>
    <%
        } else {
            for (Badge b : badgeList) {
    %>
        <div class="badge">
            <h3><%= b.getName() %></h3>
            <p><strong>Điều kiện:</strong> <%= b.getCondition() %></p>
            <p><strong>Mô tả:</strong> <%= b.getDescription() %></p>
        </div>
    <%
            }
        }
    %>

    <a href="homepage.jsp">← Quay lại trang chủ</a>
</body>
</html>

