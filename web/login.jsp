<%-- 
    Document   : login
    Created on : Jun 5, 2025, 3:46:40 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/stylelogin.css" rel="stylesheet" type="text/css"/>
           <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
             <%@include file="information/bootstrap.jspf" %>
    </head>
    <body>
        
        

          
          
        <div class="container">
            <div class="login-box">
                <form method="get" action="LoginServlet"> 
                    <h2>Sign In</h2>
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <div class="error-message"><%= error%></div>
                    <% }%>
                    <label for="role">Select Role</label>
                    <select id="role" name="role">
                        <option value="Member" <%= "Member".equals(request.getParameter("role")) ? "selected" : ""%>>Member</option>
                        <option value="Coach" <%= "Coach".equals(request.getParameter("role")) ? "selected" : ""%>>Coach</option>
                    </select>

                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Username">

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Password">

                    <button type="submit">Log In</button>

                    <div class="options">
                        <label><input type="checkbox" name="remember"> Remember Me</label>
                        <a href="#">Forgot Password</a>
                    </div>
                </form>
            </div>
     
            <div class="signup-box">
                <h2>Welcome to Login</h2>
                <p>Don't have an account?</p>
                <button class="signup-btn" onclick="location.href = 'register.jsp'">Sign Up</button>
            </div>
                    
        </div>
                   
                       
                     
    </body>
</html>
