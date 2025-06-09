<%-- 
    Document   : PostNewBlog
    Created on : Jun 9, 2025, 12:41:53 PM
    Author     : Nghia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/PostNewBlogStyle.css">
        <link rel="stylesheet" href="css/stylehomepage.css">

    </head>
    <body>
              <%@include file="information/header.jspf" %>
        <div class="bodys">
        <div class="containers">
      
            <h2>📝 Đăng Bài Viết Mới</h2>


            <form action="PostBlogServlet" method="post" enctype="multipart/form-data">
                <%
                    String message = (String) request.getAttribute("message");
                    if (message != null) {
                %>
                <p style="color: green; font-weight: bold;"><%= message%></p>
                <%
                    }
                %>
                <label for="title">Tiêu đề bài viết:</label>
                <input type="text" id="title" name="title" required>

                <label for="content">Nội dung:</label>
                <textarea id="content" name="content" rows="8" required></textarea>

                <label for="image">Chọn ảnh minh họa:</label>
                <input type="file" id="image" name="image" accept="image/*">

                <button type="submit">Đăng bài</button>


            </form>
        </div>
                </div>
                <%@include file="information/footer.jspf" %>
    </body>
</html>
