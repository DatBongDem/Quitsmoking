<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.QuitPlan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo mới Quitplan</title>
</head>
<body>
<%
    QuitPlan qp = (QuitPlan) request.getAttribute("qp");
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>

<h1>Tạo mới Quitplan</h1>
<form action="AdminCreateQuitplanServlet" method="post">
    <p>
        <label>IDQuitPlan:</label><br/>
        <input type="text" name="idQuitPlan"
               value="<%= qp != null ? qp.getIdQuitPlan() : "" %>"
               required/>
    </p>
    <p>
        <label>Period Of Time (tháng):</label><br/>
        <input type="number" name="periodOfTime"
               value="<%= qp != null ? qp.getPeriodOfTime() : 0 %>"
               required/>
    </p>
    <p>
        <label>Goals:</label><br/>
        <textarea name="goals" rows="3" cols="50"><%= qp != null ? qp.getGoals() : "" %></textarea>
    </p>
    <p>
        <label>Progress:</label><br/>
        <textarea name="progress" rows="3" cols="50"><%= qp != null ? qp.getProgress() : "" %></textarea>
    </p>
    <p>
        <label>Price:</label><br/>
        <input type="number" step="0.01" name="price"
               value="<%= qp != null ? qp.getPrice() : 0.0 %>"
               required/>
    </p>
    <button type="submit">Tạo mới</button>
    <a href="QuitplanManagerServlet">Hủy</a>
</form>
</body>
</html>
