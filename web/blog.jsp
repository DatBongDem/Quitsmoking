<%-- 
    Document   : blog
    Created on : Jun 17, 2025, 4:13:39 PM
    Author     : Thinkpad
--%>
<%@ page errorPage="error.jsp" %>
<%@page import="DTO.Member"%>
<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                                    <%  String userRole = (String) session.getAttribute("role");
                                    if (userRole == "member"){ %>
                                    <a href="PostNewBlog.jsp">Post New</a>
                                    <a href="MyBlogServlet">My Blog</a>
                                            <% }
                                            %>
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
                <form class="blog-search-form mb-5" action="BlogPostServlet" method="post">
                    <div class="form-row justify-content-center">
                        <div class="col-md-6 col-sm-8 mb-2">
                            <input type="text" class="form-control" name="keyword" value="<%= request.getAttribute("keyword") != null ? request.getAttribute("keyword") : ""%>"  placeholder="Tìm kiếm bài viết..." />

                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-success">Tìm kiếm</button>
                        </div>
                    </div>
                </form>

                <div class="row">
                    <%
                        List<BlogPost> blogPosts = (List<BlogPost>) request.getAttribute("blogPosts");
                        List<Member> members = (List<Member>) request.getAttribute("members");

                        if (blogPosts != null && !blogPosts.isEmpty()) {
                            for (BlogPost post : blogPosts) {
                                String memberId = post.getIdMember();
                                Member member = null;
                                if (members != null) {
                                    for (Member m : members) {
                                        if (m.getIDMember().equals(memberId)) {
                                            member = m;
                                            break;
                                        }
                                    }
                                }
                    %>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 d-flex flex-column">
                            <img src="images/Blog/<%= post.getImage()%>" class="card-img-top" alt="No smoking">
                            <div class="card-body">
                                <h5 class="card-title"><%= post.getTitle()%></h5>
                                
                                <a href="BlogDetailServlet?id=<%= post.getIdPost()%>" class="btn btn-success">Đọc thêm</a>
                            </div>
                            <div class="card-footer text-muted">
                                <div><%= post.getPublishDate()%></div>
                                <div>Người đăng: <%= member != null ? member.getMemberName() : "Unknown"%></div>
                            </div>
                        </div>
                    </div>
                    <%
                        } // end for
                    } else {
                    %>
                    <div class="col-12">
                        <p class="text-center">Không có bài viết nào.</p>
                    </div>
                    <%
                        }
                    %>
                </div> <!-- end .row -->  



        </section>

        <%@include file="information/footer.jspf" %>


    </body>

</html>
