<%-- 
    Document   : editProfileCoach
    Created on : Jun 19, 2025, 11:29:56 AM
    Author     : Nghia
--%>

<%@page import="DAO.CoachDao"%>
<%@page import="DTO.Coach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Edit Profile</h2>

        <%-- Retrieve the coach ID from the request and get the coach data --%>
        <%
            Coach coach = (Coach) request.getAttribute("coach");

        %>

        <form action="updateProfileServlet" method="post">

            <label for="phone">Name:</label>
            <input type="text" id="phone" name="phone" value="<%= coach.getCoachName()%>" />
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="<%= coach.getPhone()%>" />
            <label for="phone">Password: </label>
            <input type="text" id="phone" name="phone" value="<%= coach.getPassword()%>" />
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= coach.getEmail()%>" />
            <label for="email">Gender: </label>
            <input type="email" id="email" name="email" value="<%= coach.getGender()%>" />
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= coach.getAddress()%>" />
            <label for="address">BirthDay: </label>
            <input type="date" id="address" name="dateofbirth " value="<%= coach.getDateOfBirth()%>" />
            <label for="address">BirthDay: </label>
            <label>Change Avatar</label>
            <div style="display: flex; justify-content: start;">
                <label>Current Avatar</label>
                <img class="avatar-preview" src="<%= (coach.getImage() != null) ? coach.getImage() : "images/avata/nullavata.png"%>" alt="Profile Image"/>
            </div>

            <input type="file" name="avatarFile" accept="image/*"/>
            <input type="text" id="specialization" name="specialization" value="<%= coach.getSpecialization()%>" />

            <label for="experienceYears">Experience Years:</label>
            <input type="number" id="experienceYears" name="experienceYears" value="<%= coach.getExperienceYears()%>" />

            <input type="submit" value="Save Changes" />
        </form>
    </body>
</html>
