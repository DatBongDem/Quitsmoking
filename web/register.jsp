<%-- 
    Document   : register
    Created on : Jun 5, 2025, 3:53:54 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
        <link href="css/styleregister.css" rel="stylesheet" type="text/css"/>
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>


        <%@include file="information/bootstrap.jspf" %>

    </head>
    <body>
        <%@include file="information/header.jspf" %>

        <div class="register-container">
            <div class="register-header">Create Account</div>
            <form class="register-form" action="RegisterServlet" method="post">
                <% String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {%>
                <div style="color: red; font-weight: bold;">
                    <%= errorMessage%>
                </div>
                <% }%>

                <label for="memberid">Account ID</label>
                <input type="text" id="memberid" name="memberid" required 
                       value="<%= request.getAttribute("memberId") != null ? request.getAttribute("memberId") : ""%>" />

                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" required
                       value="<%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : ""%>"/>
                
                <label for="image">Chọn ảnh đại diện</label>
                <input type="file" id="image" name="image" accept="image/*">
                
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required
                       value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : ""%>"/>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required />

                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required />

                <label for="phone">Phone</label>
                <input type="tel" id="phone" name="phone"
                       value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>"/>

                <label for="address">Address</label>
                <input type="text" id="address" name="address"
                       value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : ""%>"/>

                <label for="dob">Date Of Birth</label>
                <input type="date" id="dob" name="dob"
                       value="<%= request.getAttribute("dob") != null ? request.getAttribute("dob") : ""%>"/>

                <div class="register-terms">
                    <input type="checkbox" id="terms" name="terms" required />
                    <label for="terms">I agree to Terms & Privacy</label>
                </div>
                <% String successMessage = (String) request.getAttribute("successMessage"); %>

                <% if (successMessage != null) {%>
                <div style="color: green; font-weight: bold; margin-bottom: 10px;">
                    <%= successMessage%>
                </div>
                <% }%>
                <button type="submit" class="register-button">Sign in</button>
            </form>

            <div class="register-footer">
                Already have an account? <a href="login.jsp">Login</a>
            </div>
                
        </div>
                <div style="padding-top: 60px">
        <%@include file="information/footer.jspf" %>
        </div>
    </body>
</html>
