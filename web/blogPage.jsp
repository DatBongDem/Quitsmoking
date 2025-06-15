<%@page import="DTO.Member"%>
<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <!--        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>-->
        
    </head>

    <body>

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
                <div>
                    <h2><%= post.getTitle()%></h2>
                    <div class="bloga1">
                    <div>
                        <p>

                            <strong><%= mem.getMemberName()%></strong>
                            <img src="<%= mem.getImage()%>" alt="Avatar" class="avatar">
                        <p style="color: red;">Ngày đăng: <%= post.getPublishDate()%></p>

                        </p>

                        <img src="images/Blog/<%= post.getImage()%>" alt="Image for <%= post.getTitle()%>" class="blog-image" />
                    </div>

                    
                        <p><%= post.getContent()%></p>
                    </div>
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

    </body>

</html>