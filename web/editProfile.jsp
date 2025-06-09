<%-- 
    Document   : editProfile
    Created on : Jun 8, 2025, 12:39:23 PM
    Author     : Nguyen Tien Dat
--%>

<%@page import="DTO.Member"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    Member member = (Member) request.getAttribute("member");
    if (member == null) {
        out.println("<p>No member data found!</p>");
        return;
    }
%>

<h1>Edit Your Profile</h1>

<form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
    <!-- ID Member không cho sửa, chỉ hiển thị -->
    <p><strong>ID Member:</strong> <%= member.getIDMember()%>
        <input type="hidden" name="idMember" value="<%= member.getIDMember()%>" />
    </p>

    <!-- Các trường có thể sửa -->
    <p>
        <label>Name:</label>
        <input type="text" name="memberName" value="<%= member.getMemberName()%>" required/>
    </p>

    <p>
        <label>Email:</label>
        <input type="email" name="email" value="<%= member.getEmail()%>" required/>
    </p>

    <p>
        <label>Phone:</label>
        <input type="text" name="phone" value="<%= member.getPhone()%>" />
    </p>

    <p>
        <label>Address:</label>
        <input type="text" name="address" value="<%= member.getAddress()%>" />
    </p>

    <p>
<!--        <label>Date of Birth:</label>
        <%
            String formattedDate = "";
            if (member.getDateOfBirth() != null) {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                formattedDate = sdf.format(member.getDateOfBirth());
            }
        %>

        <input type="date" name="dateOfBirth" value="<%= formattedDate%>" />-->
        
        <p>
    <label>Date of Birth:</label>
    <%
        
        if (member != null && member.getDateOfBirth() != null) {
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            formattedDate = sdf.format(member.getDateOfBirth());
        }
    %>
    <input type="date" name="dateOfBirth" value="<%= formattedDate %>" />
</p>

    </p>

    <p>
        <label>Subscription:</label>
        <input type="text" name="subscription" value="<%= member.getSubscription()%>" />
    </p>

    <p>
        <label>Current Avatar:</label><br/>
        <img src="<%= (member.getImage()!= null) ? member.getImage(): "images/avata/nullavata.png"%>" alt="Profile Image" width="150"/>
    </p>

    <p>
        <label>Change Avatar (upload new image):</label>
        <input type="file" name="avatarFile" accept="image/*" />
    </p>

    <p>
        <button type="submit">Save Changes</button>
        <a href="profile.jsp">Cancel</a>
    </p>
</form>
