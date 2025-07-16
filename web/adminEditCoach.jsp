<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DTO.Coach" %>

<%-- Check for admin session --%>
<% if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
} %>

<% Coach c = (Coach) request.getAttribute("coach"); %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa thông tin Coach</title>
    <%@include file="information/bootstrap.jspf" %>
    <link rel="stylesheet" href="css/admin-dasboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
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
                <li><a href="ManageCoachServlet" class="active"><i class="fas fa-users"></i> Quản lý Coach</a></li>
                <li><a href="AdminManageMemberServlet"><i class="fas fa-user-friends"></i> Quản lý Member</a></li>
                <li><a href="adminManageQuiz.jsp"><i class="fas fa-question-circle"></i> Quản lý Quiz</a></li>
                <li><a href="QuitplanManagerServlet"><i class="fas fa-calendar-alt"></i> Quản lý khóa học</a></li>
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
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">Chỉnh sửa thông tin Huấn luyện viên</h4>
                    </div>
                    <div class="card-body">
                        <% if (c != null) { %>
                        <form action="EditCoachServlet" method="post">
                            <input type="hidden" name="IDCoach" value="<%= c.getIDCoach() %>"/>
                            <div class="form-group">
                                <label for="coachName">Họ tên</label>
                                <input type="text" class="form-control" id="coachName" name="coachName" value="<%= c.getCoachName() %>">
                            </div>
                            <div class="form-group">
                                <label>Giới tính</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" <%= "male".equalsIgnoreCase(c.getGender()) ? "checked" : "" %>>
                                        <label class="form-check-label" for="male">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="female" value="female" <%= "female".equalsIgnoreCase(c.getGender()) ? "checked" : "" %>>
                                        <label class="form-check-label" for="female">Nữ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phone">Điện thoại</label>
                                    <input type="text" class="form-control" id="phone" name="phone" value="<%= c.getPhone() %>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<%= c.getEmail() %>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address" value="<%= c.getAddress() %>">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="specialization">Chuyên môn</label>
                                    <input type="text" class="form-control" id="specialization" name="specialization" value="<%= c.getSpecialization() %>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="experienceYears">Kinh nghiệm (năm)</label>
                                    <input type="number" class="form-control" id="experienceYears" name="experienceYears" value="<%= c.getExperienceYears() %>">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-info"><i class="fas fa-save"></i> Lưu thay đổi</button>
                            <a href="ManageCoachServlet" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Hủy</a>
                        </form>
                        <% } else { %>
                        <div class="alert alert-danger">Không tìm thấy thông tin coach.</div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Content -->
    </div>
</body>
</html>
