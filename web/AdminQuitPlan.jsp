<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.QuitPlan"%>

<%-- Check for admin session --%>
<% if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
} %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Quitplan</title>
    <%@include file="information/bootstrap.jspf" %>
    <link rel="stylesheet" href="css/admin-dasboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .main-content {
            flex: 1;
            padding: 20px;
            margin-left: 150px;
            margin-top: 30px;
        }
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
                <li><a href="QuitplanManagerServlet" class="active"><i class="fas fa-calendar-alt"></i> Quản lý khóa học</a></li>
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
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="h2">Danh sách Quitplan</h2>
                    <a href="AdminCreateQuitplan.jsp" class="btn btn-success"><i class="fas fa-plus-circle"></i> Tạo Quitplan</a>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered">
                        <thead class="bg-success text-white">
                            <tr>
                                <th>ID</th>
                                <th>Thời gian (tháng)</th>
                                <th>Mục tiêu</th>
                                <th>Tiến độ</th>
                                <th>Giá</th>
                                <th class="text-center">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<QuitPlan> list = (List<QuitPlan>) request.getAttribute("quitplans");
                               if (list != null && !list.isEmpty()) {
                                   for (QuitPlan qp : list) { %>
                            <tr>
                                <td><%= qp.getIdQuitPlan() %></td>
                                <td><%= qp.getPeriodOfTime() %></td>
                                <td><%= qp.getGoals() %></td>
                                <td><%= qp.getProgress() %></td>
                                <td><%= String.format("%,.0f", qp.getPrice()) %> VND</td>
                                <td class="text-center table-actions">
                                    <a href="EditQuitPlanServlet?idQuitPlan=<%= qp.getIdQuitPlan() %>" class="btn btn-sm btn-info" title="Sửa"><i class="fas fa-edit"></i></a>
                                    <a href="DeleteQuitPlanServlet?idQuitPlan=<%= qp.getIdQuitPlan() %>" class="btn btn-sm btn-danger" onclick="return confirm('Xác nhận xóa kế hoạch này?');" title="Xóa"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                            <% } } else { %>
                            <tr>
                                <td colspan="6" class="text-center">Không có kế hoạch nào.</td>
                            </tr>
                            <% } %>
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
