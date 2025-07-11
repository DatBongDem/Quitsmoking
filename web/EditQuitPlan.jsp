<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DTO.QuitPlan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa QuitPlan</title>
</head>
<body>
<%
    QuitPlan qp = (QuitPlan) request.getAttribute("qp");
    if (qp == null) {
%>
    <p>Không tìm thấy kế hoạch để chỉnh sửa.</p>
<%
    } else {
%>
    <h2>Chỉnh sửa QuitPlan: <%= qp.getIdQuitPlan() %></h2>
    <form action="EditQuitPlanServlet" method="post">
        <!-- Giữ nguyên ID để servlet biết bản ghi nào cần update -->
        <input type="hidden" name="idQuitPlan" value="<%= qp.getIdQuitPlan() %>"/>

        <p>
            <label for="periodOfTime">Thời gian (tháng):</label><br/>
            <input type="number" id="periodOfTime" name="periodOfTime"
                   value="<%= qp.getPeriodOfTime() %>" required/>
        </p>

        <p>
            <label for="goals">Mục tiêu (Goals):</label><br/>
            <input type="text" id="goals" name="goals"
                   value="<%= qp.getGoals() %>" required/>
        </p>

        <p>
            <label for="progress">Tiến độ (Progress):</label><br/>
            <input type="text" id="progress" name="progress"
                   value="<%= qp.getProgress() %>" required/>
        </p>

        <p>
            <label for="price">Giá (Price):</label><br/>
            <input type="number" step="0.01" id="price" name="price"
                   value="<%= qp.getPrice() %>" required/>
        </p>

        <button type="submit">Lưu thay đổi</button>
        <a href="QuitplanManagerServlet">Hủy</a>
    </form>
<%
    }
%>
</body>
</html>
