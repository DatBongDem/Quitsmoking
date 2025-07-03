<%-- 
    Document   : progressAnswer
    Created on : Jul 2, 2025, 9:54:23 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="DTO.ProgressLog"%>

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
        <% return; %>
        <%
            }
        %>

        <h2>Trả lời câu hỏi từ huấn luyện viên</h2>

        <form action="SubmitProgressLogServlet" method="post">
            <input type="hidden" name="idLog" value="<%= log.getIdLog() %>">

            <%
                for (int i = 1; i <= 10; i++) {
                    String question = (String) ProgressLog.class.getMethod("getQs" + i).invoke(log);
                    if (question != null && !question.trim().isEmpty()) {
            %>
            <div style="margin-bottom: 15px;">
                <label><b>Câu hỏi <%= i%>:</b> <%= question%></label><br>
                <textarea name="as<%= i%>" rows="3" cols="60"><%= log.getAnswer(i) != null ? log.getAnswer(i) : ""%></textarea>
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