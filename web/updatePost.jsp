
<%@page import="DTO.BlogPost"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cập nhật bài viết</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <%
            BlogPost post = (BlogPost) request.getAttribute("post");
            if (post == null) {
        %>
        <p>Không tìm thấy bài viết để chỉnh sửa.</p>
        <%
        } else {
        %>
        <h2>Chỉnh sửa bài viết</h2>
        <%= post.getIdPost() %>
        <form action="UpdatePostServlet" method="post" enctype="multipart/form-data">
            

            <input type="hidden" name="idMember" value="<%= post.getIdMember()%>"/>
            <input type="hidden" name="IDPost" value="<%= post.getIdPost() %>"/>
            <p>
                <label>Tiêu đề:</label><br/>
                <input type="text" name="title" value="<%= post.getTitle()%>" required/>
            </p>

            <p>
                <label>Nội dung:</label><br/>
                <textarea name="content" rows="8" cols="60" required><%= post.getContent()%></textarea>
            </p>

            <p>
                <label>Ảnh hiện tại:</label><br/>
                <img src="images/Blog/<%= post.getImage()%>" width="200"/><br/>
                <label>Chọn ảnh mới:</label><br/>
                <input type="file" id="image" name="image" accept="image/*">        
            </p>

        
            <button type="submit">Lưu thay đổi</button>
            <a href="MyBlogServlet">Hủy</a>
        </form>
        <%
            }
        %>
    </body>
</html>

