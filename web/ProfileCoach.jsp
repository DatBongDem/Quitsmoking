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
        <title>JSP Page</title>
    </head>
    <body>
       <h2>Coach Details</h2>
    

    <!-- Coach details -->
    <%
        Coach coach = (Coach) request.getAttribute("coach");
        if (coach != null) {
    %>
        <table border="1">
            <tr>
                <th>Coach ID</th>
                <td><%= coach.getIDCoach()%></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><%= coach.getPassword() %></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%= coach.getCoachName() %></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><%= coach.getGender() %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= coach.getPhone() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= coach.getEmail() %></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%= coach.getAddress() %></td>
            </tr>
            <tr>
                <th>Image</th>
                <td><img src="<%= coach.getImage() %>" alt="Coach Image" width="100"></td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td><%= coach.getDateOfBirth() %></td>
            </tr>
            <tr>
                <th>Specialization</th>
                <td><%= coach.getSpecialization() %></td>
            </tr>
            <tr>
                <th>Experience Years</th>
                <td><%= coach.getExperienceYears() %></td>
            </tr>
        </table>
    <%
        } else {
    %>
        <div style="color: red;">
            <strong>No coach found with the provided ID.</strong>
        </div>
    <%
        }
    %>
    </body>
</html>
