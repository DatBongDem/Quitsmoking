<%-- 
    Document   : viewProgressLog
    Created on : Jul 3, 2025, 8:35:18 AM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="DTO.ProgressLog"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xem tiến trình</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- File CSS riêng -->
    <link rel="stylesheet" href="css/viewProgressLog.css">
</head>
<body>

<div class="container progress-container">
<%
    ProgressLog log = (ProgressLog) request.getAttribute("log");
    if (log == null) {
%>
    <div class="alert alert-danger mt-4">Không tìm thấy dữ liệu nhật ký.</div>
    <a href="progressList.jsp" class="btn btn-outline-success mt-3">⬅ Quay lại danh sách</a>
<%
    } else {
%>
    <h2 class="text-center mb-4">Xem chi tiết tiến trình</h2>

    <div class="mb-3">
        <strong>Loại:</strong> <%= log.getType() %>
    </div>
    <div class="mb-3">
        <strong>Ngày bắt đầu:</strong> <%= log.getStartDate() %>
    </div>
    <div class="mb-3">
        <strong>Ngày kết thúc:</strong> <%= log.getEndDate() %>
    </div>

    <%
        String progress = log.getProgress();
        if (progress != null && !progress.trim().isEmpty()) {
    %>
    <div class="mb-4">
        <label class="form-label"><strong>Ghi chú tiến trình:</strong></label>
        <textarea readonly class="form-control bg-light" rows="4"><%= progress %></textarea>
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
    <div class="mb-4">
        <label class="form-label"><strong>Câu hỏi <%= i %>:</strong> <%= question %></label>
        <textarea readonly class="form-control bg-light" rows="3"><%= answer != null ? answer : "" %></textarea>
    </div>
    <%
            }
        }
    %>

    <a href="progressList.jsp" class="btn btn-success">⬅ Quay lại danh sách</a>
<%
    }
%>
</div>

</body>
</html>
