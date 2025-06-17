<%-- 
    Document   : viewNotifications
    Created on : Jun 17, 2025, 10:52:22 AM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Notification" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Thông báo của bạn</title>
    <style>
        .notification {
            padding: 15px;
            margin: 10px 0;
            border-radius: 8px;
            font-family: Arial;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .reminder {
            background-color: #fff3cd;
            color: #856404;
        }
        .warning {
            background-color: #f8d7da;
            color: #721c24;
        }
        .date {
            font-size: 12px;
            color: gray;
        }
    </style>
</head>
<body>
    <h2>📢 Thông báo của bạn</h2>

    <c:forEach var="n" items="${notifications}">
        <div class="notification ${n.type}">
            <div class="date">
                Ngày: <fmt:formatDate value="${n.date}" pattern="dd/MM/yyyy" />
            </div>
            <div><strong>${n.message}</strong></div>
        </div>
    </c:forEach>
</body>
</html>