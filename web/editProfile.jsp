<%-- 
    Document   : editProfile
    Created on : Jun 8, 2025, 12:39:23 PM
    Author     : Nguyen Tien Dat
--%>

<%@page import="DTO.Member"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <%
        Member member = (Member) request.getAttribute("member");
        if (member == null) {
            out.println("<p>No member data found!</p>");
            return;
        }
    %>
    <link href="css/styleeditprofile.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="container">
        <h1>Edit Your Profile</h1>
        <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">

            <label>ID Member</label>
            <input  type="text" name="idMember" value="<%= member.getIDMember()%>" required/>

            <label>Full Name</label>
            <input type="text" name="memberName" value="<%= member.getMemberName()%>" />


            <label>Gender:</label>
            <select name="gender" required>
                <option value="" disabled hidden>Select Gender</option>
                <option value="Male" <%= "male".equalsIgnoreCase(member.getGender()) ? "selected" : ""%>>Male</option>
                <option value="Female" <%= "female".equalsIgnoreCase(member.getGender()) ? "selected" : ""%>>Female</option>
                <option value="Other" <%= "other".equalsIgnoreCase(member.getGender()) ? "selected" : ""%>>Other</option>
            </select>

            <label>Email</label>
            <input type="email" name="email" value="<%= member.getEmail()%>" required/>

            <label>Phone</label>
            <input type="text" name="phone" value="<%= member.getPhone()%>"/>

            <label>Address</label>
            <input  type="text" name="address" rows="3" value="<%= member.getAddress()%>" ></input>

            <label>Date of Birth</label>        
            <%
                String formattedDate = "";
                if (member.getDateOfBirth() != null) {
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    formattedDate = sdf.format(member.getDateOfBirth());
                }
            %>
            <input type="date" name="dateOfBirth" value="<%= formattedDate%>" />

            <label>Subscription</label>
            <input type="text" name="subcription" value="<%= member.getSubscription()%>" />


            <div style="display: flex; justify-content: start;">
                <label>Current Avatar</label>
                <img class="avatar-preview" src="<%= (member.getImage() != null) ? member.getImage() : "images/avata/nullavata.png"%>" alt="Profile Image"/>
            </div>



            <label>Change Avatar</label>
            <input type="file" name="avatarFile" accept="image/*"/>

            <div class="button-group">
                <button type="submit">Save Changes</button>
                <a href="DetailMemberProfile" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>   


</body>

