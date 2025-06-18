<%-- 
    Document   : managemembers
    Created on : Jun 18, 2025, 6:51:28 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DTO.Member" %>
<%
    List<Member> memberList = (List<Member>) request.getAttribute("memberList");
%>

<html>
    <head>
        <title>Quản lý thành viên</title>
    </head>
    <body>
        <h2>Danh sách thành viên</h2>
        <table border="1" cellpadding="10">
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Giới tính</th>
                <th>Điện thoại</th>
                <th>Email</th>
                <th>Điểm</th>
                <th>Gói</th>
                <th>Trạng thái</th>
                <th>Quản Lý</th>
            </tr>

            <%
                if (memberList != null && !memberList.isEmpty()) {
                    for (Member m : memberList) {
            %>
            <tr>
                <td><%= m.getIDMember()%></td>
                <td><%= m.getMemberName()%></td>
                <td><%= m.getGender()%></td>
                <td><%= m.getPhone()%></td>
                <td><%= m.getEmail()%></td>
                <td><%= m.getPoint()%></td>
                <td><%= m.getSubscription()%></td>
                <td><%= m.getStatus()%></td>
                <td>
                    <form action="ViewProgressServlet" method="get">
                        <input type="hidden" name="id" value="<%= m.getIDMember()%>">
                        <input type="submit" value="Xem tiến trình">
                    </form>
                        
                    <form action="ViewProgressServlet" method="get">
                        <input type="hidden" name="id" value="<%= m.getIDMember()%>">
                        <input type="submit" value="Xếp lịch">
                    </form>   
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8">Không có thành viên nào.</td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>


