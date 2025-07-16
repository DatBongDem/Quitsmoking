<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DTO.Coach" %>

<%-- Check for admin session --%>
<% if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    } %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý Huấn luyện viên</title>
        <%@include file="information/bootstrap.jspf" %>
        <link rel="stylesheet" href="css/admin-dasboard.css"> <%-- Reuse dashboard styles --%>
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
                    <li>
                        <a href="ManageCoachServlet">
                            <i class="fas fa-users"></i> Quản lý Coach
                        </a>
                    </li>
                    <li>
                        <a href="AdminManageMemberServlet">
                            <i class="fas fa-user-friends"></i> Quản lý Member
                        </a>
                    </li>
                    <li>
                        <a href="adminManageQuiz.jsp">
                            <i class="fas fa-question-circle"></i> Quản lý Quiz
                        </a>
                    </li>
                    <li>
                        <a href="QuitplanManagerServlet">
                            <i class="fas fa-chalkboard-teacher"></i> Quản lý khóa học
                        </a>
                    </li>
                    <li>
                        <a href="ViewAllReportsServlet">
                            <i class="fa-solid fa-circle-info"></i> Xem báo cáo
                        </a>
                    </li>

                    <li><a href="AdminBlogViewServlet"><i class="fas fa-blog"></i> Quản lý Blog</a></li>
                    <li><a href="RegistrationResult.jsp"><i class="fas fa-registered"></i> Quản lý Đăng ký</a></li>
                </ul>
                <div class="logout">
                    <form action="AdminLogoutServlet" method="get">
                        <button type="submit" class="btn-logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</button>
                    </form>
                </div>
            </div>
            <!-- End Sidebar -->

            <!-- Main Content -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="h2">Danh sách Huấn luyện viên</h2>
                        <a href="adminAddCoach.jsp" class="btn btn-success">
                            <i class="fas fa-plus-circle"></i> Tạo Coach mới
                        </a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead class="bg-success text-white">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giới tính</th>
                                    <th scope="col">Điện thoại</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Chuyên môn</th>
                                    <th scope="col">Kinh nghiệm</th>
                                    <th scope="col">Trạng thái</th>
                                    <th class="text-center">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% ArrayList<Coach> coachList = (ArrayList<Coach>) request.getAttribute("coachList");
                                    if (coachList != null && !coachList.isEmpty()) {
                                        for (Coach c : coachList) {%>
                                <tr>
                                    <th scope="row"><%= c.getIDCoach()%></th>
                                    <td><%= c.getCoachName()%></td>
                                    <td><%= c.getGender()%></td>
                                    <td><%= c.getPhone()%></td>
                                    <td><%= c.getEmail()%></td>
                                    <td><%= c.getSpecialization()%></td>
                                    <td><%= c.getExperienceYears()%> năm</td>
                                    <td class="text-center">
                                        <span class="badge <%= "1".equals(c.getStatus()) ? "badge-success" : "badge-danger"%>">
                                            <%= "1".equals(c.getStatus()) ? "Hoạt động" : "Đã xóa"%>
                                        </span>
                                    </td>
                                    <td class="text-center table-actions">
                                        <form action="EditCoachServlet" method="get" class="d-inline">
                                            <input type="hidden" name="id" value="<%= c.getIDCoach()%>"/>
                                            <button type="submit" class="btn btn-sm btn-info" title="Sửa">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </form>
                                        <form action="UpdateCoachStatusServlet" method="post" class="d-inline">
                                            <input type="hidden" name="id" value="<%= c.getIDCoach()%>"/>
                                            <input type="hidden" name="action" value="<%= "1".equals(c.getStatus()) ? "delete" : "restore"%>"/>
                                            <button type="submit" class="btn btn-sm <%= "1".equals(c.getStatus()) ? "btn-danger" : "btn-warning"%>" title="<%= "1".equals(c.getStatus()) ? "Xóa" : "Khôi phục"%>">
                                                <i class="fas <%= "1".equals(c.getStatus()) ? "fa-trash-alt" : "fa-undo"%>"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <% }
                                } else { %>
                                <tr>
                                    <td colspan="9" class="text-center">Không có dữ liệu.</td>
                                </tr>
                                <% }%>
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
