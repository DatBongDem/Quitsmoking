<%@page import="DAO.ProgressLogDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DTO.ProgressLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idMember = (String) session.getAttribute("id");
    if (idMember == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<ProgressLog> logs = new ArrayList<>();
    try {
        ProgressLogDAO dao = new ProgressLogDAO();
        logs = dao.getProgressLogsByMember(idMember);
    } catch (Exception e) {
        out.println("<p class='text-danger'>Lỗi: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách nhật ký tiến trình</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Link đến file CSS riêng -->
    <link rel="stylesheet" href="css/progressList.css">
</head>
<body>

<div class="container progress-container">
    <h2 class="text-center">Danh sách nhật ký tiến trình</h2>

    <div class="table-responsive">
        <table class="table table-bordered text-center align-middle">
            <thead>
                <tr>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày kết thúc</th>
                    <th>Loại</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ProgressLog log : logs) {
                %>
                <tr>
                    <td><%= log.getStartDate() %></td>
                    <td><%= log.getEndDate() %></td>
                    <td><%= log.getType() %></td>
                    <td>
                        <% if ("save".equalsIgnoreCase(log.getStatus())) { %>
                        <form action="SubmitProgressLogServlet" method="get" class="d-inline">
                            <input type="hidden" name="idLog" value="<%= log.getIdLog() %>" />
                            <button type="submit" class="btn btn-green">✏️ Trả lời</button>
                        </form>
                        <% } else { %>
                        <form action="ViewProgressLogServlet" method="get" class="d-inline">
                            <input type="hidden" name="idLog" value="<%= log.getIdLog() %>" />
                            <button type="submit" class="btn btn-green">👁️ Xem</button>
                        </form>
                        <% } %>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
