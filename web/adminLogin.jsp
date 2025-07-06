<%-- 
    Document   : adminLogin
    Created on : Jul 6, 2025, 4:09:18 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h3 class="text-center mb-4">Admin Login</h3>
        <form action="AdminLoginServlet" method="post">
            <div class="form-group">
                <label for="username">Tài khoản</label>
                <input type="text" class="form-control" id="username" name="username"
                       value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>"
                       required>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-2">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
        </form>
    </div>
</body>
</html>
