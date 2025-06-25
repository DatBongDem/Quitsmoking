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

      <form action="UpdateProfileCoach" method="post" enctype="multipart/form-data">
    <input type="hidden" name="coachId" value="<%= coach.getIDCoach() %>">
    
    <div class="profile-card">
        <!-- Profile Image -->
        <div class="profile-image-container">
            <img class="profile-image" src="<%= coach.getImage() %>" alt="Coach Image">
        </div>

        <!-- Profile Body -->
        <div class="profile-body">
            <h4 class="card-title text-center">Personal Information</h4>

            <div class="detail-row">
                <div class="detail-label">Coach ID:</div>
                <div class="detail-value">
                    <input type="text" name="coachId" value="<%= coach.getIDCoach() %>" readonly>
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Password:</div>
                <div class="detail-value">
                    <input type="password" name="password" value="<%= coach.getPassword() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Name:</div>
                <div class="detail-value">
                    <input type="text" name="coachName" value="<%= coach.getCoachName() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Gender:</div>
                <div class="detail-value">
                    <input type="text" name="gender" value="<%= coach.getGender() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Phone:</div>
                <div class="detail-value">
                    <input type="text" name="phone" value="<%= coach.getPhone() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Email:</div>
                <div class="detail-value">
                    <input type="text" name="email" value="<%= coach.getEmail() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Address:</div>
                <div class="detail-value">
                    <input type="text" name="address" value="<%= coach.getAddress() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Date of Birth:</div>
                <div class="detail-value">
                    <input type="date" name="dateOfBirth" value="<%= coach.getDateOfBirth() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Specialization:</div>
                <div class="detail-value">
                    <input type="text" name="specialization" value="<%= coach.getSpecialization() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Experience Years:</div>
                <div class="detail-value">
                    <input type="number" name="experienceYears" value="<%= coach.getExperienceYears() %>">
                </div>
            </div>

            <div class="detail-row">
                <div class="detail-label">Avatar:</div>
                <div class="detail-value">
                    <input type="file" name="avatarFile">
                </div>
            </div>
        </div>

        <!-- Save Changes Button -->
        <div style="text-align: center; margin-top: 20px;">
            <button type="submit" class="btn btn-success">Save Changes</button>
        </div>
    </div>
</form>
    </body>
</html>
