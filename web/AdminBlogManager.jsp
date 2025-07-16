<%@page import="DTO.Member"%>
<%@page import="DTO.BlogPost"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Blog Manager</title>
        <%@include file="information/bootstrap.jspf" %>
        <link rel="stylesheet" href="css/admin-dasboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            .table-actions .btn {
                margin-right: 5px;
            }
            .table-bordered th,
            .table-bordered td {
                border: 1px solid #cccccc;
            }
            .table img {
                max-width: 100px;
                height: auto;
                display: block;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="sidebar-header">
                    <h3>Admin Manager</h3>
                </div>
                <ul class="sidebar-nav">
                    <li><a href="ManageCoachServlet"><i class="fas fa-users"></i> Quản lý Coach</a></li>
                    <li><a href="AdminManageMemberServlet"><i class="fas fa-user-friends"></i> Quản lý Member</a></li>
                    <li><a href="adminManageQuiz.jsp"><i class="fas fa-question-circle"></i> Quản lý Quiz</a></li>
                    <li><a href="QuitplanManagerServlet"><i class="fas fa-calendar-alt"></i> Quản lý khóa học</a></li>
                    
                    <li><a href="viewReports.jsp"><i class="fas fa-file-alt"></i> Quản lý Báo cáo</a></li>
                <li><a href="AdminBlogViewServlet"><i class="fas fa-blog"></i> Quản lý Blog</a></li>
                <li><a href="RegistrationResult.jsp"><i class="fas fa-registered"></i> Quản lý Đăng ký</a></li>
                </ul>
                <div class="logout">
                    <form action="AdminLogoutServlet" method="get">
                        <button type="submit" class="btn-logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</button>
                    </form>
                </div>
            </div>
            <!-- /Sidebar -->

            <!-- Main Content -->
            <div class="main-content">
                <div class="container-fluid">
                    <h2 class="h2 mb-4">Quản lý Bài viết Blog</h2>

                    <%
                        // Lấy danh sách bài viết và thành viên từ request
                        List<BlogPost> blogPosts = (List<BlogPost>) request.getAttribute("blogPosts");
                        List<Member> members = (List<Member>) request.getAttribute("members");

                        // Nếu có lỗi trong việc lấy dữ liệu, hiển thị thông báo lỗi
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <strong>Lỗi: </strong><%= error%>
                    </div>
                    <%
                        }
                    %>

                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead class="bg-success text-white">
                                <tr>
                                    <th>ID Bài viết</th>
                                    <th>Tên Thành viên</th>
                                    <th>Tiêu đề</th>
                                    <th>Nội dung</th>
                                    <th>Ngày đăng</th>
                                    <th>Hình ảnh</th>
                                    <th class="text-center">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    // Duyệt qua các bài viết để hiển thị thông tin
                                    if (blogPosts != null && !blogPosts.isEmpty()) {
                                        for (BlogPost post : blogPosts) {
                                            String memberId = post.getIdMember();
                                            String memberName = "Unknown";

                                            // Duyệt qua danh sách thành viên để tìm tên thành viên tương ứng
                                            if (members != null) {
                                                for (Member member : members) {
                                                    if (member.getIDMember().equals(memberId)) {
                                                        memberName = member.getMemberName();  // Gán tên thành viên nếu tìm thấy
                                                        break;
                                                    }
                                                }
                                            }
                                %>
                                <tr>
                                    <td><%= post.getIdPost()%></td> <!-- Hiển thị ID bài viết -->
                                    <td><%= memberName%></td> <!-- Hiển thị tên thành viên -->
                                    <td><%= post.getTitle()%></td> <!-- Hiển thị tiêu đề bài viết -->
                                    <td><%= post.getContent()%></td> <!-- Hiển thị nội dung bài viết -->
                                    <td><%= post.getPublishDate()%></td>
                                    <td>  <img src="images/Blog/<%= post.getImage()%>" alt="Blog Image">
                                    </td>

                                    <td class="text-center table-actions">
                                        <!-- Nút xóa, truyền ID bài viết vào -->
                                        <form action="AdminBlogViewServlet" method="POST" onsubmit="return confirm('Bạn có chắc chắn muốn xóa bài viết này?');" class="d-inline">
                                            <input type="hidden" name="blogPostId" value="<%= post.getIdPost()%>">
                                            <button type="submit" name="action" value="delete" class="btn btn-sm btn-danger" title="Xóa"><i class="fas fa-trash-alt"></i></button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="7" class="text-center">Không có bài viết nào.</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <a href="adminDashboard.jsp" class="btn btn-secondary mt-3">
                        <i class="fas fa-arrow-left"></i> Trở về trang chủ
                    </a>
                </div>
            </div>
            <!-- /Main Content -->
        </div>
    </body>
</html>
