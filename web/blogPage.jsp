<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blog Page</title>

        <link rel="stylesheet" href="css/blogPageStyle.css">
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        <%@include file="information/bootstrap.jspf" %>
    </head>

    <body>
        <%@include file="information/header.jspf" %>
        <main>
            <section class="hero">
                <h1 class="blog-title">Blog Page</h1>

                <!-- Thanh tìm ki?m -->
                <div class="blog-search-bar" style="margin-top: 15px; text-align: center;">
                    <input type="text" placeholder="Tìm ki?m blog..." style="padding: 10px; width: 60%; max-width: 500px; border: 1px solid #ccc; border-radius: 5px;">
                    <button style="padding: 10px 20px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">Tìm ki?m</button>
                </div>
            </section>

            
            <section class="new-sections">
                <h1>Danh sách Bài Viết</h1>

                <%
                    // Lấy danh sách các bài viết từ request
                    List<BlogPost> blogPosts = (List<BlogPost>) request.getAttribute("blogPosts");

                    if (blogPosts != null && !blogPosts.isEmpty()) {
                        for (BlogPost post : blogPosts) {
                %>
                <div class="blog-post">
                    <h2><%= post.getTitle()%></h2>
                    <p><%= post.getContent()%></p>
                    <img src="images/Blog/<%= post.getImage()%>" alt="Image for <%= post.getTitle()%>" class="blog-image" />
                    <p>Ngày đăng: <%= post.getPublishDate()%></p>
                </div>
                <%
                    }
                } else {
                %>
                <p>Không có bài viết nào.</p>
                <%
                    }
                %>
            </section>
        </main>
        <%@include file="information/footer.jspf" %>
    </body>

</html>