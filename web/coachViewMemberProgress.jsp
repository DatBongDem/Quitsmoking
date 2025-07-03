<%-- 
    Document   : coachViewMemberProgress
    Created on : Jul 3, 2025, 9:42:51 AM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="DTO.ProgressLog"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Method"%>

<html>
<head>
    <title>Tiến trình của thành viên</title>
    <style>
        textarea { width: 100%; resize: none; }
        .log-block { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; }
    </style>
</head>
<body>
    <h2>Tiến trình của thành viên: <%= request.getAttribute("idMember") %></h2>

    <%
        List<ProgressLog> logs = (List<ProgressLog>) request.getAttribute("logs");
        if (logs == null || logs.isEmpty()) {
    %>
        <p>Không có tiến trình nào.</p>
    <%
        } else {
            for (ProgressLog log : logs) {
    %>
    <div class="log-block">
        <p><b>Loại:</b> <%= log.getType() %></p>
        <p><b>Ngày bắt đầu:</b> <%= log.getStartDate() %></p>
        <p><b>Ngày kết thúc:</b> <%= log.getEndDate() %></p>
        <p><b>Ghi chú tiến trình:</b> <%= log.getProgress() != null ? log.getProgress() : "(Trống)" %></p>
        
        <hr>

        <%
            for (int i = 1; i <= 5; i++) {
                Method getQ = ProgressLog.class.getMethod("getQs" + i);
                Method getA = ProgressLog.class.getMethod("getAs" + i);
                String question = (String) getQ.invoke(log);
                String answer = (String) getA.invoke(log);

                if (question != null && !question.trim().isEmpty()) {
        %>
        <p><b>Câu hỏi <%= i %>:</b> <%= question %></p>
        <textarea rows="2" readonly><%= 
            "submit".equalsIgnoreCase(log.getStatus()) && answer != null ? answer : "" 
        %></textarea>
        <hr>
        <%
                }
            }
        %>

        <% if ("submit".equalsIgnoreCase(log.getStatus())) { %>
        <form action="GradeProgressServlet" method="post">
            <input type="hidden" name="idLog" value="<%= log.getIdLog() %>">
            <label>Chấm điểm: </label>
            <input type="number" name="point" value="<%= log.getPoint() %>" min="0" max="100" required>
            <button type="submit">💾 Lưu điểm</button>
        </form>
        <% } %>
    </div>
    <%
            }
        }
    %>

    
</body>
</html>
