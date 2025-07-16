<%-- 
    Document   : viewReports
    Created on : Jul 13, 2025, 2:09:05 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.ReportDTO" %>
<%
    List<ReportDTO> reportList = (List<ReportDTO>) request.getAttribute("reportList");
    int i=0;
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách báo cáo</title>
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
                    <h2 class="h2 mb-4">Danh sách tất cả báo cáo</h2>

                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead class="bg-success text-white">
                                <tr>
                                    <th>Số thứ tự</th>
                                    <th>Tài khoản</th>
                                    <th>Vai trò</th>
                                    <th>Loại báo cáo</th>
                                    <th>Link</th>
                                    <th>Mô tả</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (reportList != null && !reportList.isEmpty()) {
                                        for (ReportDTO r : reportList) {
                                            i++;
                                %>
                                <tr>
                                    <td><%= i%></td>
                                    <td><%= r.getReporterID()%></td>
                                    <td><%= r.getRole()%></td>
                                    <td><%= r.getReportType()%></td>
                                    <td>
                                        <% if (r.getLink() != null && !r.getLink().isEmpty()) {%>
                                        <a href="<%= r.getLink()%>" target="_blank"><%= r.getLink()%></a>
                                        <% } else { %>
                                        Không có
                                        <% }%>
                                    </td>
                                    <td><%= r.getDescription()%></td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr><td colspan="6" class="text-center">Không có báo cáo nào.</td></tr>
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
