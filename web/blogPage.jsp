<%@page import="DTO.Member"%>
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
        <%
            String keyword = request.getParameter("keyword");
        %>
        <link rel="stylesheet" href="css/blogPageStyle.css">
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>
        <%@include file="information/bootstrap.jspf" %>
    </head>

    <body>
        <%@include file="information/header.jspf" %>
        <main>
            <section class="hero">
                <h1 class="blog-title">Blog Page</h1>
                <form action="BlogPostServlet" method="post">
                    <!-- Thanh tìm ki?m -->
                    <div class="blog-search-bar" style="margin-top: 15px; text-align: center;">
                        <input type="text"  name="keyword" placeholder="Tìm kiếm blog..." value="<%= keyword != null ? keyword : ""%>" 
                               style="padding: 10px; width: 60%; max-width: 500px; border: 1px solid #ccc; border-radius: 5px;">

                        <button type="submit" style="padding: 10px 20px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">Tìm kiếm</button>
                    </div>
                </form>
            </section>


            <section class="new-sections">
                <h1>Danh sách Bài Viết</h1>

                <%
                    // Lấy danh sách các bài viết từ request
                    List<BlogPost> blogPosts = (List<BlogPost>) request.getAttribute("blogPosts");
                    List<Member> member = (List<Member>) request.getAttribute("member");
                    if (blogPosts != null && !blogPosts.isEmpty()) {
                        for (BlogPost post : blogPosts) {
                            for (Member mem : member) {
                %>
                <div class="blog-post">
                    <h2><%= post.getTitle()%></h2>
                    <p><%= post.getContent()%></p>
                    <img src="images/Blog/<%= post.getImage()%>" alt="Image for <%= post.getTitle()%>" class="blog-image" />
                    <p>
                        <img src="<%= mem.getImage()%>" alt="Avatar"
                             style="width: 30px; height: 30px; border-radius: 50%; object-fit: cover; vertical-align: middle; margin-right: 8px;">
                        <strong><%= mem.getMemberName()%></strong>
                    </p>

                    <p style="color: red">Ngày đăng: <%= post.getPublishDate()%></p>
                </div>
                <%
                        }
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