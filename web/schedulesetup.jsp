<%-- 
    Document   : schedulesetup
    Created on : Jun 18, 2025, 7:42:57 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Xếp lịch học</title>
    </head>
    <body>

        <%
            String idMember = request.getParameter("idMember");
            Boolean hasScheduleObj = (Boolean) request.getAttribute("hasSchedule");
            boolean hasSchedule = hasScheduleObj != null && hasScheduleObj;
        %>

        <h2>Xếp lịch học cho thành viên <%= idMember%></h2>

        <% if (hasSchedule) { %>
        <p style="color:red;">Thành viên này đã có lịch học.</p>
        <% } else {%>
        <form action="CreateScheduleServlet" method="post">
            <input type="hidden" name="idMember" value="<%= idMember%>">

            <label>Ngày bắt đầu (phải là Thứ 2):</label><br>
            <input type="date" name="startDate" required><br><br>

            <label>Chọn lịch học (3 buổi/tuần):</label><br>
            <input type="radio" name="days" value="246" checked> Thứ 2 - 4 - 6<br>
            <input type="radio" name="days" value="357"> Thứ 3 - 5 - 7<br><br>

            <label>Chọn ca học mỗi buổi (mỗi ca kéo dài 2 giờ):</label><br>
            <select name="startTime" required>
                <option value="07:00:00">7:00</option>
                <option value="09:15:00">9:15</option>
                <option value="13:00:00">13:00</option>
                <option value="15:15:00">15:15</option>
            </select><br><br>

            <input type="submit" value="Tạo lịch học">
        </form>
        <% } %>

        <%-- Thông báo lỗi nếu có --%>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <p style="color:red;"><%= errorMessage%></p>
        <%
            }
        %>

    </body>
</html>
