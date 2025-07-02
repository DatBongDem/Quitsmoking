<%-- 
    Document   : progress
    Created on : Jun 17, 2025, 5:26:02 PM
    Author     : Nguyen Tien Dat
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ProgressLog"%>
<%@page import="DTO.Question"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Question"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>



<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiến trình cai thuốc - Health Center</title>
    <link rel="stylesheet" href="css/progress.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <%@include file="information/bootstrap.jspf" %>
    <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="information/header.jspf" %>
         <h2>Progress Logs for Member: <%= session.getAttribute("id") %></h2>
    
    <!-- Kiểm tra nếu không có logs nào -->

    
    <%
    List<ProgressLog> logs = (List<ProgressLog>) request.getAttribute("logs");
    if (logs == null || logs.isEmpty()) {
    %>
        <p>No progress logs found for your account.</p>
    <%
    } else {
    %>
        <form action="ProgressLogServlet" method="post">
            <table border="1">
                <thead>
                    <tr>
                        <th>ID Log</th>
                        <th>Member ID</th>
                        <th>Coach ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Type</th>
                        <th>Questions</th>
                        <th>Answers</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (ProgressLog log : logs) {
                        List<String> questions = new ArrayList<>();
                        if (log.getQs1() != null) questions.add(log.getQs1());
                        if (log.getQs2() != null) questions.add(log.getQs2());
                        //... kiểm tra các câu hỏi
                    %>
                    <tr>
                        <td><%= log.getIdLog() %></td>
                        <td><%= log.getIdMember() %></td>
                        <td><%= log.getIdCoach() %></td>
                        <td><%= log.getStartDate() %></td>
                        <td><%= log.getEndDate() %></td>
                        <td><%= log.getType() %></td>
                        <td>
                            <%
                            int questionIndex = 0;
                            for (String question : questions) {
                                questionIndex++;
                            %>
                                <div>
                                    <label for="qs<%= questionIndex %>"><%= question %></label>
                                </div>
                            <%
                            }
                            %>
                        </td>

                        <td>
                            <%
                            questionIndex = 0;
                            for (String question : questions) {
                                questionIndex++;
                            %>
                                <textarea name="answer_<%= log.getIdLog() %>_<%= questionIndex %>" placeholder="Enter your answer" required></textarea>
                            <%
                            }
                            %>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <button type="submit" class="btn-action primary">Lưu câu trả lời</button>
        </form>
    <%
    }
    %>
</body>
</html>