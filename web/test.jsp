<%-- 
    Document   : test
    Created on : Jun 5, 2025, 3:59:24 PM
    Author     : Nguyen Tien Dat
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>test</title>
        <link href="css/styletest.css" rel="stylesheet" type="text/css"/>
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        <%@include file="information/bootstrap.jspf" %>
    </head>
    <body>
        <%@include file="information/header.jspf" %>
        
        
        <h2>Quiz Test</h2>
        <div class="container">
            <%    List<Quiz> quizList = (List<Quiz>) request.getAttribute("quizList");

                if (quizList == null || quizList.isEmpty()) {
            %>
            <p style="text-align:center;">No quiz available.</p>
            <%
            } else {
            %>
            <form action="TestController" method="post">
                <%
                    int qNo = 1;
                    for (Quiz q : quizList) {
                %>
                <div class="question-block">
                    <p>Question <%= qNo++%>: <%= q.getQuestion()%></p>
                    <div class="answer-option">
                        <% if (q.getAnswerA() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="A" required /> A. <%= q.getAnswerA()%></label>
                            <% } %>
                    </div>
                    <div class="answer-option">
                        <% if (q.getAnswerB() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="B" /> B. <%= q.getAnswerB()%></label>
                            <% } %>
                    </div>
                    <div class="answer-option">
                        <% if (q.getAnswerC() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="C" /> C. <%= q.getAnswerC()%></label>
                            <% } %>
                    </div>
                    <div class="answer-option">
                        <% if (q.getAnswerD() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="D" /> D. <%= q.getAnswerD()%></label>
                            <% } %>
                    </div>
                </div>
                <hr/>
                <%
                    }
                %>
                <button type="submit">Submit Test</button>
            </form>
            <%
                }
            %>

        </div>
        
            
            <%@include file="information/footer.jspf" %>
    </body>
</html>
