<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.QuitPlan"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Quitplan</title>
</head>
<body>
    <h1>Danh sách Quitplan</h1>

    <!-- Form tìm kiếm -->

    <br/>

    <%
        @SuppressWarnings("unchecked")
        List<QuitPlan> list = (List<QuitPlan>) request.getAttribute("quitplans");
        if (list == null || list.isEmpty()) {
    %>
        <p>Không có kế hoạch nào.</p>
    <%
        } else {
    %>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>IDQuitPlan</th>
                <th>Period Of Time</th>
                <th>Goals</th>
                <th>Progress</th>
                <th>Price</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (QuitPlan qp : list) {
        %>
            <tr>
                <td><%= qp.getIdQuitPlan()   %></td>
                <td><%= qp.getPeriodOfTime() %></td>
                <td><%= qp.getGoals()        %></td>
                <td><%= qp.getProgress()     %></td>
                <td><%= qp.getPrice()        %></td>
                <td>
                    <a href="EditQuitPlanServlet?idQuitPlan=<%= qp.getIdQuitPlan() %>">
                        Update
                    </a>
                </td>
                <td>
                    <a href="DeleteQuitPlanServlet?idQuitPlan=<%= qp.getIdQuitPlan() %>"
                       onclick="return confirm('Xác nhận xóa kế hoạch này?');">
                        Delete
                    </a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        }
    %>
</body>
</html>
