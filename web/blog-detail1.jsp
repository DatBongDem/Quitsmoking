<%-- 
    Document   : blog-detail1
    Created on : Jun 17, 2025, 6:09:35 PM
    Author     : Thinkpad
--%>

<%@page import="DTO.BlogPost"%>
<%@page import="DTO.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="information/bootstrap.jspf" %>
        <title>JSP Page</title>
        <%
  // Lấy ra đối tượng post và author
  BlogPost post   = (BlogPost) request.getAttribute("post");
  Member   author = (Member)   request.getAttribute("author");
%>
        <link rel="stylesheet" href="css/blogPage.css">
        <link rel="stylesheet" href="css/stylehomepage.css">
        <link rel="stylesheet" href="css/blog-detail.css">
    </head>
    <body>
        <%@include file="information/header.jspf" %>

        <div class="blog-detail-container">
            <h2 class="blog-detail-title"><%= post.getTitle() %></h2>
            <div class="blog-detail-meta">
                <%= post.getPublishDate() %> | Người đăng: <%= (author!=null? author.getMemberName() : "Unknown") %>
            </div>
            <img src="images/Blog/<%= post.getImage() %>" class="blog-detail-image" alt="Ảnh minh họa bài viết">
            <div class="blog-detail-content">
                <p>  <%= post.getContent() %></p>
              
                <!-- thêm nội dung khác -->
            </div>
            <a href="BlogPostServlet" class="back-button">← Quay lại</a>
        </div>


        <%@include file="information/footer.jspf" %>
    </body>
</html>
