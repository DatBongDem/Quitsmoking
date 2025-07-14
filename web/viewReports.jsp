<%-- 
    Document   : viewReports
    Created on : Jul 13, 2025, 2:09:05 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.ReportDTO" %>
<%
    List<ReportDTO> reportList = (List<ReportDTO>) request.getAttribute("reportList");
    int i=0;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách báo cáo</title>
        <style>
            table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; }
            th { background-color: #f2f2f2; }
        </style>
    </head>
    <body>

        <h2>Danh sách tất cả báo cáo</h2>

        <table>
            <tr>
                <th>Số thứ tự</th>
                <th>Tài khoản</th>
                <th>Vai trò</th>
                <th>Loại báo cáo</th>
                <th>Link</th>
                <th>Mô tả</th>
            </tr>

            <% if (reportList != null && !reportList.isEmpty()) {
        for (ReportDTO r : reportList) {
            i++;
            %>
            <tr>
                <td><%= i%></td>
                <td><%= r.getReporterID()%></td>
                <td><%= r.getRole()%></td>
                <td><%= r.getReportType()%></td>
                <td>
                    <% if (r.getLink() != null && !r.getLink().isEmpty()) {%>
                    <a href="<%= r.getLink()%>" target="_blank"><%= r.getLink()%></a>
                    <% } else { %>
                    Không có
                    <% }%>
                </td>
                <td><%= r.getDescription()%></td>
            </tr>
            <%     }
} else { %>
            <tr><td colspan="6">Không có báo cáo nào.</td></tr>
            <% }%>
        </table>

    </body>
</html>
