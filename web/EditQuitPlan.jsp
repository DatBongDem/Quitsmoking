<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DTO.QuitPlan" %>

<%-- Check for admin session --%>
<% if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
} %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa QuitPlan</title>
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
            <div class="container">
                <% QuitPlan qp = (QuitPlan) request.getAttribute("qp");
                   if (qp == null) { %>
                <div class="alert alert-danger">Không tìm thấy kế hoạch để chỉnh sửa.</div>
                <% } else { %>
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">Chỉnh sửa QuitPlan: <%= qp.getIdQuitPlan() %></h4>
                    </div>
                    <div class="card-body">
                        <form action="EditQuitPlanServlet" method="post">
                            <input type="hidden" name="idQuitPlan" value="<%= qp.getIdQuitPlan() %>"/>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="periodOfTime">Thời gian (tháng)</label>
                                    <input type="number" class="form-control" id="periodOfTime" name="periodOfTime" value="<%= qp.getPeriodOfTime() %>" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="price">Giá</label>
                                    <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= qp.getPrice() %>" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="goals">Mục tiêu (Goals)</label>
                                <input type="text" class="form-control" id="goals" name="goals" value="<%= qp.getGoals() %>" required>
                            </div>
                            <div class="form-group">
                                <label for="progress">Tiến độ (Progress)</label>
                                <input type="text" class="form-control" id="progress" name="progress" value="<%= qp.getProgress() %>" required>
                            </div>
                            <button type="submit" class="btn btn-info"><i class="fas fa-save"></i> Lưu thay đổi</button>
                            <a href="QuitplanManagerServlet" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Hủy</a>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <!-- /Main Content -->
    </div>
</body>
</html>
