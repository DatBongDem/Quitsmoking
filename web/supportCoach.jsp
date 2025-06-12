<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, DTO.Member, DTO.Support"%>
<%
    List<Member> memberList = (List<Member>) request.getAttribute("memberList");
    List<Support> chatMessages = (List<Support>) request.getAttribute("chatMessages");
    String selectedMemberId = (String) request.getAttribute("selectedMemberId");
%>
<html>
<head>
    <title>Support - Coach</title>
    <style>
        .container {
            display: flex;
            height: 90vh;
            font-family: Arial;
        }
        .member-list {
            width: 25%;
            background-color: #f0f0f0;
            overflow-y: auto;
            border-right: 1px solid #ccc;
        }
        .member-item {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        .member-item a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        .chat-section {
            width: 75%;
            display: flex;
            flex-direction: column;
            padding: 15px;
        }
        .chat-box {
            flex-grow: 1;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
        }
        .chat-input {
            margin-top: 10px;
        }
        .chat-input form {
            display: flex;
        }
        .chat-input textarea {
            flex: 1;
            resize: none;
        }
        .chat-input button {
            padding: 10px;
        }
    </style>
    
    <link rel="stylesheet" href="css/blogPageStyle.css">
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        <%@include file="information/bootstrap.jspf" %>
</head>
<body>
    <%@include file="information/header.jspf" %>
<div class="container">
    <!-- Danh sách thành viên -->
    <div class="member-list">
        <h3 style="text-align:center;">Thành viên</h3>
        <%
            if (memberList != null && !memberList.isEmpty()) {
                for (Member m : memberList) {
        %>
            <div class="member-item">
                <a href="CoachSupportServlet?memberId=<%=m.getIDMember()%>">
                    <%= m.getMemberName() %>
                </a>
            </div>
        <%
                }
            } else {
        %>
            <p style="text-align:center;">Không có thành viên nào.</p>
        <%
            }
        %>
    </div>

    <!-- Khung chat -->
    <div class="chat-section">
        <div class="chat-box" id="chatBox">
            <% if (chatMessages != null) {
                for (Support msg : chatMessages) {
            %>
                <p><strong><%= msg.getAuthorSend() %>:</strong> <%= msg.getContent() %> 
                    <small>(<%= msg.getFeedbackDate() %>)</small></p>
            <% } } else { %>
                <p>Chưa có tin nhắn nào.</p>
            <% } %>
        </div>

        <!-- Gửi tin nhắn -->
        <div class="chat-input">
            <form action="CoachSupportServlet" method="post">
                <input type="hidden" name="memberId" value="<%=selectedMemberId%>">
                <textarea name="message" rows="3" required></textarea>
                <button type="submit">Gửi</button>
            </form>
        </div>
    </div>
</div>
       <%@include file="information/footer.jspf" %>                
</body>
</html>
