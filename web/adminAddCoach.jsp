<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Check for admin session --%>
<% if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
} %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Coach mới</title>
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
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">Thêm Huấn luyện viên mới</h4>
                    </div>
                    <div class="card-body">
                        <form action="CreateCoachServlet" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="IDCoach">ID Coach</label>
                                    <input type="text" class="form-control" id="IDCoach" name="IDCoach" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="pass">Mật khẩu</label>
                                    <input type="password" class="form-control" id="pass" name="pass" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="coachName">Họ tên</label>
                                <input type="text" class="form-control" id="coachName" name="coachName" required>
                            </div>
                            <div class="form-group">
                                <label>Giới tính</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
                                        <label class="form-check-label" for="male">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                        <label class="form-check-label" for="female">Nữ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phone">Số điện thoại</label>
                                    <input type="text" class="form-control" id="phone" name="phone">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="dateOfBirth">Ngày sinh</label>
                                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="experienceYears">Kinh nghiệm (năm)</label>
                                    <input type="number" class="form-control" id="experienceYears" name="experienceYears">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="specialization">Chuyên môn</label>
                                <input type="text" class="form-control" id="specialization" name="specialization">
                            </div>
                            <div class="form-group">
                                <label for="image">Hình ảnh (URL)</label>
                                <input type="text" class="form-control" id="image" name="image">
                            </div>
                            <button type="submit" class="btn btn-success"><i class="fas fa-plus-circle"></i> Tạo mới</button>
                            <a href="ManageCoachServlet" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Trở về</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Content -->
    </div>
</body>
</html>
