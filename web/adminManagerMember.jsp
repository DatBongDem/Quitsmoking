<%-- 
    Document   : adminManagerMember
    Created on : Jul 7, 2025, 11:58:43 AM
    Author     : Nghia
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  <h1>Danh sách Member</h1>
<form action="AdminSearchMemberServlet" method="get">
    <!-- input tìm kiếm theo tên -->
    <input
        type="text"
        name="keyword"
        placeholder="Nhập tên Member..."
        value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>"
    />
    <button type="submit">Search</button>
</form>

<%
    @SuppressWarnings("unchecked")
    List<Member> members = (List<Member>) request.getAttribute("members");
    if (members == null || members.isEmpty()) {
%>
    <p>Không có member nào.</p>
<%
    } else {
%>
<table>
    <thead>
        <tr>
            <th>IDMember</th>
            <th>MemberName</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Email</th>
            <th>IDCoach</th>        <!-- ● Thêm cột IDCoach -->
            <th>Status</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
    <%
        for (Member m : members) {
            String id = m.getIDMember();
    %>
        <tr>
            <td><%= id %></td>
            <td><%= m.getMemberName() %></td>
            <td><%= m.getGender()     %></td>
            <td><%= m.getPhone()      %></td>
            <td><%= m.getEmail()      %></td>
            <td><%= m.getIDCoach()    %></td>  <!-- ● Hiển thị IDCoach -->
            <td><%= m.getStatus()     %></td>
            <td>
                <a href="AdminUpdateMemberServlet?IDMember=<%= id %>">
                    <button type="button">Update</button>
                </a>
            </td>
            <td>
                  <% if ("1".equals(m.getStatus())) { %>
                      <!-- Delete active member -->
                      <form action="AdminDeleteMemberServlet" method="post"
                            onsubmit="return confirm('Xác nhận xoá member này?');">
                          <input type="hidden" name="IDMember" value="<%= id %>"/>
                          <button type="submit">Delete</button>
                      </form>
                  <% } else if ("2".equals(m.getStatus())) { %>
                      <!-- Restore deleted member -->
                      <form action="AdminManageMemberServlet" method="post"
                            onsubmit="return confirm('Xác nhận khôi phục member này?');">
                          <input type="hidden" name="IDMember" value="<%= id %>"/>
                          <button type="submit">Khôi phục</button>
                      </form>
                  <% } %>
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
