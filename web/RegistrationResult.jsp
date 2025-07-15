<%@page import="DTO.RegistrationPayment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration List</title>
</head>
<body>
    <h2>Registration List</h2>

    <%
        // Lấy danh sách các bản ghi từ request
        List<RegistrationPayment> registrations = (List<RegistrationPayment>) request.getAttribute("registrations");
        String error = (String) request.getAttribute("error");
        // Nếu có lỗi, hiển thị thông báo lỗi
        if (error != null) {
    %>
        <div style="color: red;">
            <strong>Error: </strong><%= error %>
        </div>
    <%
        }
    %>

    <table border="1">
        <thead>
            <tr>
                <th>ID Registration</th>
                <th>Member ID</th>
                <th>Payment ID</th>
                <th>Quit Plan ID</th>
                <th>Status</th>
                <th>Registration Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Duyệt qua danh sách và hiển thị thông tin từng bản ghi
                for (RegistrationPayment reg : registrations) {
            %>
                <tr>
                    <td><%= reg.getIDRegistration() %></td>  <!-- Hiển thị IDRegistration -->
                    <td><%= reg.getIDMember() %></td>  <!-- Hiển thị IDMember -->
                    <td><%= reg.getIDPayment() %></td>  <!-- Hiển thị IDPayment -->
                    <td><%= reg.getIDQuitPlan() %></td>  <!-- Hiển thị IDQuitPlan -->
                    <td><%= reg.getStatus() %></td>  <!-- Hiển thị Status -->
                    <td><%= reg.getRegisterDate() %></td>  <!-- Hiển thị RegisterDate -->
                </tr>
            <%
                }
            %>
            
        </tbody>
    </table>
            <a href="adminDashboard.jsp">Quay về </a>
</body>
</html>