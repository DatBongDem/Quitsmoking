<%-- 
    Document   : adminManageQuiz
    Created on : Jul 10, 2025, 9:47:36 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.Quiz" %>
<%@ page import="DAO.QuizDao" %>

<%
    // Kiểm tra đăng nhập admin
   if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
    QuizDao dao = new QuizDao();
    List<Quiz> quizList = dao.getAllQuiz();
%>

<html>
<head>
    <title>Quản lý câu hỏi Quiz</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td, th {
            border: 1px solid #ccc;
            padding: 8px;
        }
        textarea {
            width: 100%;
            height: 60px;
        }
    </style>
</head>
<body>
    <h2>Quản lý câu hỏi Quiz</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Câu hỏi</th>
            <th>Đáp án A</th>
            <th>Đáp án B</th>
            <th>Đáp án C</th>
            <th>Đáp án D</th>
            <th>Hành động</th>
        </tr>
        <%
            for (Quiz q : quizList) {
        %>
        <form action="UpdateQuizServlet" method="post">
            <tr>
                <td><input type="text" name="idQuiz" value="<%= q.getIDQuiz() %>" readonly style="width:60px;"></td>
                <td><textarea name="question"><%= q.getQuestion() %></textarea></td>
                <td><textarea name="answerA"><%= q.getAnswerA() %></textarea></td>
                <td><textarea name="answerB"><%= q.getAnswerB() %></textarea></td>
                <td><textarea name="answerC"><%= q.getAnswerC() %></textarea></td>
                <td><textarea name="answerD"><%= q.getAnswerD() %></textarea></td>
                <td>
                    <button type="submit">Cập nhật</button>
                </td>
            </tr>
        </form>
        <%
            }
        %>
    </table>
</body>
</html>
