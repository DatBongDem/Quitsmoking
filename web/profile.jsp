<%-- 
    Document   : profile
    Created on : Jun 7, 2025, 1:02:54 PM
    Author     : Nghia
--%>

<%@page import="DTO.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/profileStyle.css">
        <%@include file="information/bootstrap.jspf" %>
        <link rel="stylesheet" type="text/css" href="css/stylehomepage.css">
    </head>
    <body>
        <%@include file="information/header.jspf" %>
        <div class="bodysss">
            <div class="profile-container">
                <h1 class="profile-title">Your Profile</h1>

                <div class="profile-content">
                    <%
                        // Lấy đối tượng "member" từ request
                        Member member = (Member) request.getAttribute("member");
                        if (member != null) {
                    %>

                    <div class="profile-info">
                        <p>

                       
                            <img src="<%= (member.getImage()!= null) ? member.getImage(): "images/avata/nullavata.png"%>" alt="Profile Image">

                        </p>
                        
                        
                        <p><strong>ID Member:</strong> <%= member.getIDMember()%></p>
                        <p><strong>Name:</strong> <%= member.getMemberName()%></p>
                        <p><strong>Email:</strong> <%= member.getEmail()%></p>
                        <p><strong>Phone:</strong> <%= member.getPhone()%></p>
                        <p><strong>Address:</strong> <%= member.getAddress()%></p>
                        <p><strong>Date of Birth:</strong> <%= member.getDateOfBirth()%></p>
                        <p><strong>Join Date:</strong> <%= member.getJoinDate()%></p>
                        
                        <p><strong>Coach ID:</strong> <%= member.getIDCoach()%></p>
                        <p><strong>Subscription:</strong> <%= member.getSubscription()%></p>
                        <p><strong>Status:</strong> <%= member.getStatus()%></p>
                    </div>

                    <%
                    } else {
                    %>
                    <div class="error-message">
                        <p>Sorry, no user found with the provided ID.</p>
                    </div>
                    <%
                        }
                    %>
                    <a href="UpdateProfileServlet?idMember=<%= member.getIDMember() %>" class="buttons">Edit Profile</a>

                    
                </div> <!-- End of profile-content -->
            </div>

        </div> <!-- End of profile-container -->
        <%@include file="information/footer.jspf" %>

    </body>

</html>