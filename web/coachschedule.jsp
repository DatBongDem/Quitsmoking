<%-- 
    Document   : coachschedule.jsp
    Created on : Jun 18, 2025, 9:24:39 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Schedule" %>
<%
    List<Schedule> scheduleList = (List<Schedule>) request.getAttribute("scheduleList");
    int selectedMonth = (int) request.getAttribute("selectedMonth");
    int selectedYear = (int) request.getAttribute("selectedYear");
%>
<html>
<head>
    <title>Lịch dạy của huấn luyện viên</title>
</head>
<body>
    <h2>Lịch dạy tháng <%= selectedMonth %>/<%= selectedYear %></h2>

    <form action="CoachScheduleServlet" method="get">
        <label>Chọn tháng:</label>
        <select name="month">
            <% for (int i = 1; i <= 12; i++) { %>
                <option value="<%= i %>" <%= (i == selectedMonth ? "selected" : "") %>>Tháng <%= i %></option>
            <% } %>
        </select>
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
                <p>Thành viên: <%= s.getMemberName() %></p>
                <form action="UpdateStatusServlet" method="post" style="display:inline;">
                    <input type="hidden" name="scheduleId" value="<%= s.getIDSchedule() %>">
                    <label>Trạng thái:</label>
                    <select name="status">
                        <option <%= "Not yet".equals(s.getStatus()) ? "selected" : "" %>>Not yet</option>
                        <option <%= "Present".equals(s.getStatus()) ? "selected" : "" %>>Present</option>
                        <option <%= "Absent".equals(s.getStatus()) ? "selected" : "" %>>Absent</option>
                    </select>
                    <br>
                    <label>Link học:</label>
                    <input type="url" name="meetLink" value="<%= s.getMeetLink() != null ? s.getMeetLink() : "" %>" size="50">
                    <input type="submit" value="Cập nhật">
                    <% if (s.getMeetLink() != null && !s.getMeetLink().isEmpty()) { %>
                        <a href="<%= s.getMeetLink() %>" target="_blank">Vào buổi học</a>
                    <% } %>
                </form>
            </div>
    <%  }
    } else { %>
        <p>Không có lịch nào trong tháng này.</p>
    <% } %>
</body>
</html>