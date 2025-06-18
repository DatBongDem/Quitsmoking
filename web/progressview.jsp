<%-- 
    Document   : progressview
    Created on : Jun 18, 2025, 7:18:28 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*, DTO.ProgressLog" %>
<%
    List<ProgressLog> logList = (List<ProgressLog>) request.getAttribute("logList");
    String memberId = (String) request.getAttribute("memberId");
%>

<html>
    <head>
        <title>Tiến trình của thành viên <%= memberId%></title>
    </head>
    <body>
        <h2>Tiến trình bỏ thuốc của thành viên: <%= memberId%></h2>

        <%
            if (logList != null && !logList.isEmpty()) {
                for (ProgressLog log : logList) {
        %>
        <div style="border:1px solid gray; margin:10px; padding:10px;">
            <strong>Ngày: </strong><%= log.getLogDate()%><br>
            <strong>Số điếu thuốc: </strong><%= log.getNumberOfCigarettes()%><br>
            <strong>Ghi chú: </strong><%= log.getNotes()%>
        </div>
        <%
            }
        } else {
        %>
        <p>Chưa có tiến trình nào được ghi nhận.</p>
        <%
            }
        %>

        
    </body>
</html>
