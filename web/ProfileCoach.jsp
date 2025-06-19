<%-- 
    Document   : ProfileCoach
    Created on : Jun 19, 2025, 11:11:02 AM
    Author     : Nghia
--%>

<%@page import="DTO.Coach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/ProfileCoach.css">
        <title>Coach Details</title>
    </head>
    <body>
        <div class="container">
            <div class="profile-header">
                <h2>Coach Details</h2>
                <%
                    Coach coach = (Coach) request.getAttribute("coach");
                    if (coach != null) {
                %>
            </div>
            <div class="profile-image-container">
                <img src="<%= coach.getImage()%>" alt="Coach Image" class="profile-image">
            </div>
            <div class="profile-body">
                <table class="details-table">
                    <tr>
                        <th>Coach ID</th>
                        <td><%= coach.getIDCoach()%></td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td><%= coach.getCoachName()%></td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td><%= coach.getGender()%></td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td><%= coach.getPhone()%></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><%= coach.getEmail()%></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><%= coach.getAddress()%></td>
                    </tr>
                    <tr>
                        <th>Date of Birth</th>
                        <td><%= coach.getDateOfBirth()%></td>
                    </tr>
                    <tr>
                        <th>Specialization</th>
                        <td><%= coach.getSpecialization()%></td>
                    </tr>
                    <tr>
                        <th>Experience Years</th>
                        <td><%= coach.getExperienceYears()%></td>
                    </tr>
                </table>
            </div>
        </div>

    </body>
</html>
