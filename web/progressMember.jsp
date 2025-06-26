<%-- 
    Document   : progressMember
    Created on : Jun 26, 2025, 9:30:49 AM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.ProgressLog" %>

<html>
<head>
    <title>Tiến trình bỏ thuốc</title>
    <link rel="stylesheet" type="text/css" href="css/progressMember.css">
</head>
<body>
    <h2>Tiến trình bỏ thuốc của bạn</h2>

    <%
        List<ProgressLog> logList = (List<ProgressLog>) request.getAttribute("logList");
        if (logList != null && !logList.isEmpty()) {
    %>
        <table border="1">
            <tr>
                <th>Ngày</th>
                <th>Số điếu hút</th>
                <th>Câu trả lời</th>
            </tr>
            <% for (ProgressLog log : logList) { %>
            <tr>
                <td><%= log.getLogDate() %></td>
                <td><%= log.getNumberOfCigarettes() %></td>
                <td>
                    <%
                        String notes = log.getNotes();
                        if (notes != null && !notes.isEmpty()) {
                            // Dùng regex để tách các câu theo định dạng "Câu 1:", "Câu 2:"
                            String regex = "(Câu \\d+:.*?)(?=Câu \\d+:|$)";
                            java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex, java.util.regex.Pattern.DOTALL);
                            java.util.regex.Matcher matcher = pattern.matcher(notes);

                            while (matcher.find()) {
                    %>
                        <div class="note-item"><%= matcher.group(1).trim() %></div>
                    <%
                            }
                        } else {
                    %>
                        <div class="note-item">Không có câu trả lời</div>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>Chưa có tiến trình nào được ghi nhận.</p>
    <% } %>
</body>
</html>