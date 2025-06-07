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

        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        <link href="css/styletest.css" rel="stylesheet" type="text/css"/>

        <%@include file="information/bootstrap.jspf" %>
    </head>
    <body>
        <div>
            <%@include file="information/header.jspf" %>
        </div>



        <h2>Quiz Test</h2>
        <div class="container">
            <%    List<Quiz> quizList = (List<Quiz>) request.getAttribute("quizList");

                if (quizList == null || quizList.isEmpty()) {
            %>
            <p style="text-align:center;">No quiz available.</p>
            <%
            } else {
            %>
            <form action="TestServlet" method="post">
                <%
                    int qNo = 1;
                    for (Quiz q : quizList) {
                %>
                <div class="question-block">
                    <p>Question <%= qNo++%>: <%= q.getQuestion()%></p>
                    <input type="hidden" name="quizID" value="<%= q.getIDQuiz()%>" /> 
                    <div class="answer-option">
                        <% if (q.getAnswerA() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="<%= q.getAnswerA()%>" required /> A. <%= q.getAnswerA()%></label>
                            <% } %>
                    </div>
                    <div class="answer-option">
                        <% if (q.getAnswerB() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value=" <%= q.getAnswerB()%>" /> B. <%= q.getAnswerB()%></label>
                            <% } %>
                    </div>
                    <div class="answer-option">
                        <% if (q.getAnswerC() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="<%= q.getAnswerC()%>" /> C. <%= q.getAnswerC()%></label>
                            <% } %>
                    </div>
                    <div class="answer-option">
                        <% if (q.getAnswerD() != null) {%>
                        <label><input type="radio" name="answer_<%= q.getIDQuiz()%>" value="<%= q.getAnswerD()%>" /> D. <%= q.getAnswerD()%></label>
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
            <c:if test="${not empty errorMessage}">
                <p style="color: red;">${errorMessage}</p>
            </c:if>
            <c:if test="${not empty successMessage}">
                <p style="color: green;">${successMessage}</p>
            </c:if>

            <%-- Hiển thị nút để trở về trang homepage nếu thành công --%>
            <c:if test="${success == true}">
                <a href="homepage.jsp">
                    <button>Trở về trang chủ</button>
                </a>
            </c:if>
            <%-- Hiển thị nút để trở về trang homepage --%>

        </div>


        <%@include file="information/footer.jspf" %>
    </body>
</html>
