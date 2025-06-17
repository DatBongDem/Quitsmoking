<%-- 
    Document   : viewNotifications
    Created on : Jun 17, 2025, 10:52:22 AM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, DTO.Notification"%>
<%
    String role = (String) session.getAttribute("role");
    String memberId = (String) session.getAttribute("id");

    if (role == null || !"member".equalsIgnoreCase(role) || memberId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông báo của tôi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .notification {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 15px auto;
            width: 80%;
            border-radius: 5px;
        }
        .success {
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .reminder {
            background-color: #fff3cd;
            border-color: #ffeeba;
        }
        .warning {
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">📢 Thông báo của bạn</h2>

    <%
        if (notifications != null && !notifications.isEmpty()) {
            for (Notification n : notifications) {
                String typeClass = "";
                if ("success".equalsIgnoreCase(n.getType())) {
                    typeClass = "success";
                } else if ("reminder".equalsIgnoreCase(n.getType())) {
                    typeClass = "reminder";
                } else if ("warning".equalsIgnoreCase(n.getType())) {
                    typeClass = "warning";
                }
    %>
                <div class="notification <%= typeClass %>">
                    <strong><%= n.getType().toUpperCase() %>:</strong> <%= n.getMessage() %>
                </div>
    <%
            }
        } else {
    %>
        <p style="text-align:center;">Hiện không có thông báo nào.</p>
    <%
        }
    %>
</body>
</html>