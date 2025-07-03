<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="DTO.ProgressLog"%>
<%@page import="java.lang.reflect.Method"%>

<html>
<head>
    <title>Trả lời câu hỏi tiến trình</title>
</head>
<body>
<%
    ProgressLog log = (ProgressLog) request.getAttribute("log");
    if (log == null) {
%>
    <p style="color:red;">Không tìm thấy dữ liệu nhật ký.</p>
<% return; } %>

<h2>Trả lời câu hỏi từ huấn luyện viên</h2>

<!-- Hiển thị progress -->
<% 
    String progress = log.getProgress();
    if (progress != null && !progress.trim().isEmpty()) {
%>
    <div style="margin-bottom: 20px;">
        <p><b>Nhật ký ghi chú:</b></p>
        <textarea readonly rows="4" cols="70"><%= progress %></textarea>
    </div>
<% } %>

<form action="SubmitProgressLogServlet" method="post">
    <input type="hidden" name="idLog" value="<%= log.getIdLog() %>">

    <%
        for (int i = 1; i <= 5; i++) {
            Method getQs = ProgressLog.class.getMethod("getQs" + i);
            Method getAs = ProgressLog.class.getMethod("getAs" + i);
            String question = (String) getQs.invoke(log);
            String answer = (String) getAs.invoke(log);

            if (question != null && !question.trim().isEmpty()) {
    %>
    <div style="margin-bottom: 15px;">
        <label><b>Câu hỏi <%= i %>:</b> <%= question %></label><br>
        <textarea name="as<%= i %>" rows="3" cols="60"><%= answer != null ? answer : "" %></textarea>
    </div>
    <%
            }
        }
    %>

    <button type="submit" name="action" value="save">💾 Lưu</button>
    <button type="submit" name="action" value="submit">📤 Gửi</button>
</form>
</body>
</html>
