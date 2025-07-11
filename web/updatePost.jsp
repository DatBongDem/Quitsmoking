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
  <form action="UpdatePostServlet" method="post" enctype="multipart/form-data">
    <!-- IDPost và IDMember chỉ dùng để gửi về, không cho sửa -->
  <p><strong>Debug: IDPost hiện tại là</strong> <%= post.getIdPost() %></p>
    <input type="hidden" name="idMember" value="<%= post.getIdMember() %>"/>

    <p>
      <label>Tiêu đề:</label><br/>
      <input type="text" name="title" value="<%= post.getTitle() %>" required/>
    </p>

    <p>
      <label>Nội dung:</label><br/>
      <textarea name="content" rows="8" cols="60" required><%= post.getContent() %></textarea>
    </p>

    <p>
      <label>Ảnh hiện tại:</label><br/>
      <img src="<%= request.getContextPath() + post.getImage() %>" width="200"/><br/>
      <label>Chọn ảnh mới:</label><br/>
      <input type="file" name="imageFile" accept="image/*"/>
      <input type="hidden" name="existingImage" value="<%= post.getImage() %>"/>
    </p>

    <p>
      <label>Ngày xuất bản:</label><br/>
      <input type="date" name="publishDate"
             value="<%= post.getPublishDate()!=null?post.getPublishDate().toString():"" %>"
             required/>
    </p>

    <button type="submit">Lưu thay đổi</button>
    <a href="ManageBlogServlet">Hủy</a>
  </form>
<%
  }
%>
</body>
</html>
