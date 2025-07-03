<%@page import="java.util.List"%>
<%@page import="DTO.ProgressLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idMember = (String) session.getAttribute("id"); // đã lưu trong session khi login
    if (idMember == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    DAO.ProgressLogDAO dao = new DAO.ProgressLogDAO();
    List<ProgressLog> logs = dao.getProgressLogsByMember(idMember);
%>

<h2>Danh sách nhật ký tiến trình</h2>

<table border="1" cellpadding="10">
    <tr>

        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th>Loại</th>
        <th>Trạng thái</th>

    </tr>

    <%
        for (ProgressLog log : logs) {
    %>
    <tr>


        <td><%= log.getStartDate()%></td>
        <td><%= log.getEndDate()%></td>
        <td><%= log.getType()%></td>

        <td>
            <% if ("save".equalsIgnoreCase(log.getStatus())) {%>
            <form action="SubmitProgressLogServlet" method="get" style="display:inline;">
                <input type="hidden" name="idLog" value="<%= log.getIdLog()%>" />
                <button type="submit">✏️ Trả lời</button>
            </form>
            <% } else {%>
            <form action="ViewProgressLogServlet" method="get" style="display:inline;">
                <input type="hidden" name="idLog" value="<%= log.getIdLog()%>" />
                <button type="submit">Xem</button>
            </form>
            <% } %>
        </td>
    </tr>
    <%
        }
    %>
</table>
