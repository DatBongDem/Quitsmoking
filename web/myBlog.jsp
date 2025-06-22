<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Blog</title>
    <link rel="stylesheet" href="css/blogPage.css">
</head>
<body>
    <div class="container">
        <h2>Your Blog Posts</h2>

        <% 
        // Lấy danh sách các bài viết từ request
        List<BlogPost> posts = (List<BlogPost>) request.getAttribute("posts");

        // Kiểm tra nếu danh sách bài viết không rỗng
        if (posts != null && !posts.isEmpty()) {
            for (BlogPost post : posts) {
    %>
            <div class="post">
                <h3><%= post.getTitle() %></h3>
                <p><%= post.getContent() %></p>
                <img src="<%= post.getImage() %>" alt="Image of <%= post.getTitle() %>" />
                <p><strong>Published on:</strong> <%= post.getPublishDate() %></p>
                <!-- Nút Update -->
                <a href="UpdatePostServlet?idPost=<%= post.getIdPost() %>" class="btn btn-warning">Update</a>
                <!-- Nút Delete -->
                <a href="DeletePostServlet?idPost=<%= post.getIdPost() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this post?')">Delete</a>
            </div>
    <% 
            } // End for loop
        } else { 
    %>
            <p>You have no posts yet.</p>
    <% 
        } // End if
    %>

    </div>
</body>
</html>