<%-- 
    Document   : adminUpdateMember
    Created on : Jul 7, 2025, 12:32:27 PM
    Author     : Nghia
--%>

<%@page import="DTO.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
    Member member = (Member) request.getAttribute("member");
    if (member == null) {
%>
    <p>Không tìm thấy Member để cập nhật.</p>
<%
    } else {
%>
    <h1>Cập nhật Member: <%= member.getIDMember() %></h1>
    <form action="AdminUpdateMemberServlet" method="post">
        <!-- Giữ IDMember dưới dạng hidden -->
        <input type="hidden" name="IDMember" value="<%= member.getIDMember() %>" />

        <p>
            <label>Password:</label><br/>
            <input type="text" name="password" value="<%= member.getPassword() %>" />
        </p>

        <p>
            <label>Member Name:</label><br/>
            <input type="text" name="memberName" value="<%= member.getMemberName() %>" />
        </p>

        <p>
            <label>Gender:</label><br/>
            <input type="radio" name="gender" value="Male"
               <%= "Male".equals(member.getGender()) ? "checked" : "" %> /> Male
            <input type="radio" name="gender" value="Female"
               <%= "Female".equals(member.getGender()) ? "checked" : "" %> /> Female
        </p>

        <p>
            <label>Phone:</label><br/>
            <input type="text" name="phone" value="<%= member.getPhone() %>" />
        </p>

        <p>
            <label>Email:</label><br/>
            <input type="email" name="email" value="<%= member.getEmail() %>" />
        </p>

        <p>
            <label>Address:</label><br/>
            <input type="text" name="address" value="<%= member.getAddress() %>" />
        </p>

        <p>
            <label>Date of Birth:</label><br/>
            <input type="date" name="dateOfBirth" value="<%= member.getDateOfBirth() %>" />
        </p>

        <p>
            <label>Join Date:</label><br/>
            <input type="date" name="joinDate" value="<%= member.getJoinDate() %>" />
        </p>

        <p>
            <label>Image URL:</label><br/>
            <input type="text" name="image" value="<%= member.getImage() %>" />
        </p>

        <p>
            <label>Point:</label><br/>
            <input type="number" name="point" value="<%= member.getPoint() %>" />
        </p>

        <p>
            <label>ID Coach:</label><br/>
            <input type="text" name="IDCoach" value="<%= member.getIDCoach() %>" />
        </p>

        <p>
            <label>Subscription:</label><br/>
            <input type="text" name="subcription" value="<%= member.getSubscription() %>" />
        </p>

        <p>
            <label>Status:</label><br/>
            <input type="text" name="status" value="<%= member.getStatus() %>" />
        </p>

        <p>
            <button type="submit">Lưu thay đổi</button>
            <a href="AdminUpdateMemberServlet"><button type="button">Hủy</button></a>
        </p>
    </form>
<%
    }
%>
    </body>
</html>
