<%-- 
    Document   : blog
    Created on : Jun 17, 2025, 4:13:39 PM
    Author     : Thinkpad
--%>

<%@page import="DTO.Member"%>
<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <%@include file="information/bootstrap.jspf" %>

        <link rel="stylesheet" href="css/blogPage.css">
        <link rel="stylesheet" href="css/stylehomepage.css">
        <%
            String keyword = request.getParameter("keyword");
        %>
        <title>Blog Page</title>
    </head>

    <body>


        <%@include file="information/header.jspf" %>

        <!-- Background -->
        <div class="background">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="inner-wrap">
                            <p class="inner-sub-title">LET'S HEALTHY MAKE YOU BEAUTIFUK</p>
                            <h1 class="inner-title">Blog Page</h1>
                            <div class="inner-blog">
                                <div class="home-page">
                                    <a href="PostNewBlog.jsp">Post New</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Background -->

        <!-- Blog Page Content -->
        <section class="blog py-5">
            <div class="container">
                <h2 class="text-center mb-5">Tin tức về thuốc lá</h2>


            <!-- Search Form -->
            <form class="blog-search-form mb-5" action="#" method="get">
                <div class="form-row justify-content-center">
                    <div class="col-md-6 col-sm-8 mb-2">
                        <input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm bài viết..." />
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-success">Tìm kiếm</button>
                    </div>
                </div>
            </form>

            <div class="row">
                <!-- Blog Post 1 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog1.jpg" class="card-img-top" alt="No smoking">
                        <div class="card-body">
                            <h5 class="card-title">Tại sao nên cai thuốc lá?</h5>
                            <p class="card-text">Hút thuốc lá là nguyên nhân hàng đầu gây ra các bệnh về tim mạch, phổi
                                và ung thư. Việc từ bỏ thuốc lá giúp bạn cải thiện sức khỏe, tiết kiệm chi phí và sống
                                lâu hơn.</p>
                            <a href="blog-detail1.jsp" class="btn btn-success">Đọc thêm</a>

                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-success">Tìm kiếm</button>
                        </div>
                    </div>
                </form>

                <%
                    // Lấy danh sách các bài viết từ request
                    List<BlogPost> blogPosts = (List<BlogPost>) request.getAttribute("blogPosts");
                    List<Member> member = (List<Member>) request.getAttribute("member");
                    if (blogPosts != null && !blogPosts.isEmpty()) {
                        for (BlogPost post : blogPosts) {
                            for (Member mem : member) {
                %>
                <div class="row">
                    <!-- Blog Post 1 -->
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 d-flex flex-column">
                            <img src="images/Blog/<%= post.getImage()%>" class="card-img-top" alt="No smoking">
                            <div class="card-body">
                                <h5 class="card-title"><%= post.getTitle()%></h5>
                                <p class="card-text"><%= post.getContent()%></p>
                                <a href="#" class="btn btn-success">Đọc thêm</a>
                            </div>
                            <div class="card-footer text-muted">
                                <div><%= post.getPublishDate()%></div>
                                <div>Người đăng: <%= mem.getMemberName()%></div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <%
                    }
                }
            } 
            %>
          
        </section>
        <!-- End Blog Page Content -->

        <%@include file="information/footer.jspf" %>
    </body>

</html>
