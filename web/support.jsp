<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Support, DAO.SupportDAO" %>
<%
    String idMember = (String) request.getAttribute("idMember");
    String idCoach = (String) request.getAttribute("idCoach");

    SupportDAO dao = new SupportDAO();
    List<Support> messages = dao.getAllMessagesBetween(idMember, idCoach);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Support Chat</title>
    
    <style>
        .chat-container {
            width: 600px;
            margin: 50px auto;
            border: 1px solid #ccc;
            padding: 20px;
        }

        .chat-box {
            height: 400px;
            overflow-y: scroll;
            border: 1px solid #eee;
            padding: 10px;
            margin-bottom: 15px;
        }

        .message {
            margin-bottom: 10px;
        }

        .member {
            color: blue;
        }

        .coach {
            color: green;
            text-align: right;
        }

        .chat-form textarea {
            width: 100%;
            height: 60px;
        }

        .chat-form button {
            margin-top: 5px;
            float: right;
        }
    </style>
    <link rel="stylesheet" href="css/blogPageStyle.css">
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        <%@include file="information/bootstrap.jspf" %>
</head>
<body>
    <%@include file="information/header.jspf" %>
    <div class="chat-container">
        <h3>Chat with your coach</h3>

        <div class="chat-box">
            <% for (Support msg : messages) { %>
                <div class="message <%= msg.getAuthorSend().equals("member") ? "member" : "coach" %>">
                    <strong><%= msg.getAuthorSend() %>:</strong> <%= msg.getContent() %>
                    <br><small><%= msg.getFeedbackDate() %></small>
                </div>
            <% } %>
        </div>

        <form class="chat-form" action="SendSupportServlet" method="post">
            <input type="hidden" name="idMember" value="<%= idMember %>">
            <input type="hidden" name="idCoach" value="<%= idCoach %>">
            <input type="hidden" name="authorSend" value="member">
            <textarea name="content" placeholder="Type your message..." required></textarea>
            <button type="submit">Send</button>
        </form>
    </div>
     <%@include file="information/footer.jspf" %>      
    
</body>
</html>
