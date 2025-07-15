<%@page import="DTO.Member"%>
<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Blog Manager</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- optional CSS file -->
</head>
<body>


     <h2>Blog Post Management</h2>

    <%
        // Lấy danh sách bài viết và thành viên từ request
        List<BlogPost> blogPosts = (List<BlogPost>) request.getAttribute("blogPosts");
        List<Member> members = (List<Member>) request.getAttribute("members");

        // Nếu có lỗi trong việc lấy dữ liệu, hiển thị thông báo lỗi
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div style="color: red;">
            <strong>Error: </strong><%= error %>
        </div>
    <%
        }
    %>

    <table border="1">
        <thead>
            <tr>
                <th>Blog Post ID</th>
                <th>Member Name</th>
                <th>Blog Post Title</th>
                <th>Content</th>
                <th>Publish Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Duyệt qua các bài viết để hiển thị thông tin
                for (BlogPost post : blogPosts) {
                    String memberId = post.getIdMember();
                    String memberName = "Unknown";

                    // Duyệt qua danh sách thành viên để tìm tên thành viên tương ứng
                    for (Member member : members) {
                        if (member.getIDMember().equals(memberId)) {
                            memberName = member.getMemberName();  // Gán tên thành viên nếu tìm thấy
                           
                        
                    }
            %>
                <tr>
                    <td><%= post.getIdPost() %></td> <!-- Hiển thị ID bài viết -->
                    <td><%= memberName %></td> <!-- Hiển thị tên thành viên -->
                    <td><%= post.getTitle() %></td> <!-- Hiển thị tiêu đề bài viết -->
                    <td><%= post.getContent() %></td> <!-- Hiển thị nội dung bài viết -->
                    <td><%= post.getPublishDate() %></td> <!-- Hiển thị ngày xuất bản -->
                    <td>
                        <!-- Nút xóa, truyền ID bài viết vào -->
                        <form action="AdminBlogViewServlet" method="POST" onsubmit="return confirm('Are you sure you want to delete this blog post?');">
                            <input type="hidden" name="blogPostId" value="<%= post.getIdPost() %>">
                            <button type="submit" name="action" value="delete">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }}
            %>
        </tbody>
    </table>

</body>
</html>
