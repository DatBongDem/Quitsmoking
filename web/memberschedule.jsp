<%-- 
    Document   : memberschedule
    Created on : Jun 19, 2025, 12:16:29 AM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Schedule" %>
<%
    List<Schedule> scheduleList = (List<Schedule>) request.getAttribute("scheduleList");
    int selectedMonth = (request.getAttribute("selectedMonth") != null)
        ? (int) request.getAttribute("selectedMonth")
        : java.time.LocalDate.now().getMonthValue();
    int selectedYear = (request.getAttribute("selectedYear") != null)
        ? (int) request.getAttribute("selectedYear")
        : java.time.LocalDate.now().getYear();
%>
<html>
<head>
    <title>Lịch học của tôi</title>
</head>
<body>
    <h2>Lịch học tháng <%= selectedMonth %>/<%= selectedYear %></h2>

    <form action="MemberScheduleServlet" method="get">
        <label>Chọn tháng:</label>
        <select name="month">
            <% for (int i = 1; i <= 12; i++) { %>
                <option value="<%= i %>" <%= (i == selectedMonth ? "selected" : "") %>>Tháng <%= i %></option>
            <% } %>
        </select>
        <label>Năm:</label>
        <input type="number" name="year" value="<%= selectedYear %>" min="2020" max="2040" />
        <input type="submit" value="Xem" />
    </form>

    <hr>
    <% if (scheduleList != null && !scheduleList.isEmpty()) {
        String currentDate = "";
        for (Schedule s : scheduleList) {
            String sessionDate = s.getSessionDate().toString();
            if (!sessionDate.equals(currentDate)) {
                currentDate = sessionDate;
    %>
                <h3>Ngày: <%= sessionDate %></h3>
    <%      } %>
            <div style="border:1px solid #ccc; padding:10px; margin:10px 0;">
                <p>Giờ: <%= s.getStartTime() %> - <%= s.getEndTime() %></p>
                <p>Trạng thái: <%= s.getStatus() %></p>
                <p>Phòng học: 
                    <% if (s.getMeetLink() != null && !s.getMeetLink().isEmpty()) { %>
                        <a href="<%= s.getMeetLink() %>" target="_blank">Vào lớp học</a>
                    <% } else { %>
                        <span style="color: red;">Chưa có phòng học</span>
                    <% } %>
                </p>
            </div>
    <%  }
    } else { %>
        <p>Không có lịch học nào trong tháng này.</p>
    <% } %>
</body>
</html>
