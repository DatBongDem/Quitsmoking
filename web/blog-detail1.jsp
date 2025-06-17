<%-- 
    Document   : blog-detail1
    Created on : Jun 17, 2025, 6:09:35 PM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="information/bootstrap.jspf" %>
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/blogPage.css">
        <link rel="stylesheet" href="css/stylehomepage.css">
        <link rel="stylesheet" href="css/blog-detail.css">
    </head>
    <body>
        <%@include file="information/header.jspf" %>

        <div class="blog-detail-container">
            <h2 class="blog-detail-title">Tại sao nên cai thuốc lá?</h2>
            <div class="blog-detail-meta">
                Ngày đăng: 17/06/2025 | Người đăng: Admin
            </div>
            <img src="images/Blog/blog1.jpg" class="blog-detail-image" alt="Ảnh minh họa bài viết">
            <div class="blog-detail-content">
                <p>Hút thuốc lá là nguyên nhân hàng đầu gây ra các bệnh về tim mạch, phổi và ung thư...</p>
                <p>Việc cai thuốc không chỉ giúp cải thiện sức khỏe mà còn tiết kiệm chi phí...</p>
                <!-- thêm nội dung khác -->
            </div>
            <a href="blog.jsp" class="back-button">← Quay lại</a>
        </div>


        <%@include file="information/footer.jspf" %>
    </body>
</html>
