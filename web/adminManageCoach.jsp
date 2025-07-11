<%-- 
    Document   : adminManageCoach
    Created on : Jul 6, 2025, 10:20:44 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DTO.Coach" %>
<%
       if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<html>
    <head>
        <title>Quản lý Coach</title>
    </head>
    <body>
        <h2>Danh sách Huấn luyện viên</h2>

        <a href="adminAddCoach.jsp">
            <button type="button">➕ Tạo Coach mới</button>
        </a>

        <table border="1" cellpadding="10">
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Giới tính</th>
                <th>Điện thoại</th>
                <th>Email</th>
                <th>Chuyên môn</th>
                <th>Kinh nghiệm</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>

            <%
                ArrayList<Coach> coachList = (ArrayList<Coach>) request.getAttribute("coachList");
                if (coachList != null) {
                    for (Coach c : coachList) {
            %>
            <tr>
                <td><%= c.getIDCoach()%></td>
                <td><%= c.getCoachName()%></td>
                <td><%= c.getGender()%></td>
                <td><%= c.getPhone()%></td>
                <td><%= c.getEmail()%></td>
                <td><%= c.getSpecialization()%></td>
                <td><%= c.getExperienceYears()%> năm</td>
                <td>
                    <%= "1".equals(c.getStatus()) ? "Đang hoạt động"
                            : ("2".equals(c.getStatus()) ? "Đã xóa" : "Không xác định")%>
                </td>

                <td>
                    <form action="EditCoachServlet" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= c.getIDCoach()%>"/>
                        <button type="submit">Sửa</button>
                    </form>

                    <form action="UpdateCoachStatusServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= c.getIDCoach()%>"/>
                        <input type="hidden" name="action" value="<%= "1".equals(c.getStatus()) ? "delete" : "restore"%>"/>
                        <button type="submit"><%= "1".equals(c.getStatus()) ? "Xóa" : "Khôi phục"%></button>
                    </form>
                </td>
            </tr>

            <%
                    }
                }
            %>
        </table>

        <a href="adminDashboard.jsp">
            <button type="button">← Trở về trang chủ</button>
        </a>
    </body>
</html>
