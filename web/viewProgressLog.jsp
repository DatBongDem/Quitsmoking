<%-- 
    Document   : viewProgressLog
    Created on : Jul 3, 2025, 8:35:18 AM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="DTO.ProgressLog"%>

<html>
<head>
    <title>Xem tiến trình</title>
</head>
<body>
<%
    ProgressLog log = (ProgressLog) request.getAttribute("log");
    if (log == null) {
%>
    <p style="color:red;">Không tìm thấy dữ liệu nhật ký.</p>
    <a href="progressList.jsp">⬅ Quay lại danh sách</a>
<%
    } else {
%>

    <h2>Xem chi tiết tiến trình</h2>
    <p><b>Loại:</b> <%= log.getType() %></p>
    <p><b>Ngày bắt đầu:</b> <%= log.getStartDate() %></p>
    <p><b>Ngày kết thúc:</b> <%= log.getEndDate() %></p>

    <%-- ✅ Thêm phần ghi chú progress --%>
    <%
        String progress = log.getProgress();
        if (progress != null && !progress.trim().isEmpty()) {
    %>
        <div style="margin-top: 20px; margin-bottom: 20px;">
            <p><b>Ghi chú tiến trình:</b></p>
            <textarea readonly rows="4" cols="70"><%= progress %></textarea>
        </div>
    <%
        }
    %>

    <hr>

    <%
        for (int i = 1; i <= 5; i++) {
            String question = (String) ProgressLog.class.getMethod("getQs" + i).invoke(log);
            String answer = log.getAnswer(i);
            if (question != null && !question.trim().isEmpty()) {
    %>
        <div style="margin-bottom: 20px;">
            <p><b>Câu hỏi <%= i %>:</b> <%= question %></p>
            <textarea readonly rows="3" cols="60"><%= answer != null ? answer : "" %></textarea>
        </div>
    <%
            }
        }
    %>

    <a href="progressList.jsp">⬅ Quay lại danh sách</a>
<%
    }
%>
</body>
</html>
