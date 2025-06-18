<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div >
        <h2>Thanh toán thành công!</h2>
        <p>Cảm ơn bạn đã thực hiện thanh toán.</p>
        
        <!-- Hiển thị thông tin Coach vừa được cập nhật -->
        <p>Thông tin Huấn Luyện Viên:</p>
        <p><strong>IDCoach:</strong> </p>  <!-- Hiển thị IDCoach đã được truyền từ Servlet -->
   <p><strong>Huấn luyện viên của bạn:</strong> <%= request.getAttribute("coachName") %></p
        <br>
        <a href="homepage.jsp">Quay lại trang chủ</a>
    </div>
</body>
</html>