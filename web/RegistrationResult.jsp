<%@page import="DTO.RegistrationPayment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration List</title>
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
                    <li><a href="AdminBlogViewServlet"><i class="fas fa-blog"></i> Quản lý Blog</a></li>
                    <li><a href="viewReports.jsp"><i class="fas fa-file-alt"></i> Quản lý Báo cáo</a></li>
                    <li><a href="RegistrationResult.jsp" class="active"><i class="fas fa-registered"></i> Quản lý Đăng ký</a></li>
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
                    <h2 class="h2 mb-4">Danh sách Đăng ký</h2>

                    <%
                        // Lấy danh sách các bản ghi từ request
                        List<RegistrationPayment> registrations = (List<RegistrationPayment>) request.getAttribute("registrations");
                        String error = (String) request.getAttribute("error");
                        // Nếu có lỗi, hiển thị thông báo lỗi
                        if (error != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <strong>Lỗi: </strong><%= error %>
                    </div>
                    <%
                        }
                    %>

                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead class="bg-success text-white">
                                <tr>
                                    <th>ID Đăng ký</th>
                                    <th>ID Thành viên</th>
                                    <th>ID Thanh toán</th>
                                    <th>ID Kế hoạch bỏ thuốc</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày đăng ký</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (registrations != null && !registrations.isEmpty()) {
                                        // Duyệt qua danh sách và hiển thị thông tin từng bản ghi
                                        for (RegistrationPayment reg : registrations) {
                                %>
                                <tr>
                                    <td><%= reg.getIDRegistration() %></td>  <!-- Hiển thị IDRegistration -->
                                    <td><%= reg.getIDMember() %></td>  <!-- Hiển thị IDMember -->
                                    <td><%= reg.getIDPayment() %></td>  <!-- Hiển thị IDPayment -->
                                    <td><%= reg.getIDQuitPlan() %></td>  <!-- Hiển thị IDQuitPlan -->
                                    <td><%= reg.getStatus() %></td>  <!-- Hiển thị Status -->
                                    <td><%= reg.getRegisterDate() %></td>  <!-- Hiển thị RegisterDate -->
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="6" class="text-center">Không có đăng ký nào.</td>
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