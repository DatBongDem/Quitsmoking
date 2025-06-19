<%-- 
    Document   : memberschedule
    Created on : Jun 19, 2025, 12:16:29 AM
    Author     : thanh
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Schedule" %>
<%
    List<Schedule> memberScheduleList = (List<Schedule>) request.getAttribute("memberScheduleList");
    String memberName = (String) session.getAttribute("memberName");
    String idMember = (String) session.getAttribute("id");
    
    // Kiểm tra null trước khi cast
    Integer selectedMonthObj = (Integer) request.getAttribute("selectedMonth");
    Integer selectedYearObj = (Integer) request.getAttribute("selectedYear");
    
    int selectedMonth = selectedMonthObj != null ? selectedMonthObj : java.util.Calendar.getInstance().get(java.util.Calendar.MONTH) + 1;
    int selectedYear = selectedYearObj != null ? selectedYearObj : java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch học của tôi - Health Center</title>
    <link rel="stylesheet" href="css/member-schedule.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="schedule-container">
        <!-- Header Section -->
        <div class="schedule-header">
            <div class="header-content">
                <div class="header-icon">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <div class="header-text">
                    <h1 class="page-title">Lịch học của tôi</h1>
                    <p class="member-info">
                        <i class="fas fa-user"></i>
                        <%= memberName %> - Tháng <%= selectedMonth %>/<%= selectedYear %>
                    </p>
                </div>
                <div class="header-actions">
                    <a href="homepage.jsp" class="btn btn-home">
                        <i class="fas fa-home"></i>
                        Về trang chủ
                    </a>
                </div>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section">
            <div class="filter-card">
                <div class="filter-header">
                    <i class="fas fa-calendar"></i>
                    <h3>Xem lịch theo tháng</h3>
                </div>
                <form action="MemberScheduleServlet" method="get" class="filter-form">
                    <div class="form-group">
                        <label for="month">Tháng:</label>
                        <select name="month" id="month" class="form-select">
                            <% for (int i = 1; i <= 12; i++) { %>
                                <option value="<%= i %>" <%= (i == selectedMonth ? "selected" : "") %>>
                                    Tháng <%= i %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="year">Năm:</label>
                        <input type="number" name="year" id="year" value="<%= selectedYear %>" 
                               min="2020" max="2040" class="form-input" />
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                        Xem lịch
                    </button>
                </form>
            </div>
        </div>

        <!-- Schedule Content -->
        <div class="schedule-content">
            <% if (memberScheduleList != null && !memberScheduleList.isEmpty()) {
                String currentDate = "";
                for (Schedule s : memberScheduleList) {
                    String sessionDate = s.getSessionDate().toString();
                    if (!sessionDate.equals(currentDate)) {
                        currentDate = sessionDate;
            %>
                        <div class="date-section">
                            <div class="date-header">
                                <i class="fas fa-calendar-day"></i>
                                <h3>Ngày: <%= sessionDate %></h3>
                                <div class="date-weekday">
                                    <%= new java.text.SimpleDateFormat("EEEE", new java.util.Locale("vi", "VN")).format(s.getSessionDate()) %>
                                </div>
                            </div>
                        </div>
            <%      } %>
                    <div class="session-card">
                        <div class="session-header">
                            <div class="time-info">
                                <i class="fas fa-clock"></i>
                                <span class="time-range">
                                    <%= s.getStartTime() %> - <%= s.getEndTime() %>
                                </span>
                                <span class="duration">(2 giờ)</span>
                            </div>
                            <div class="status-badge status-<%= s.getStatus().toLowerCase().replace(" ", "-") %>">
                                <i class="fas fa-circle"></i>
                                <%= s.getStatus().equals("Not yet") ? "Chưa học" : 
                                    s.getStatus().equals("Present") ? "Đã học" : "Vắng mặt" %>
                            </div>
                        </div>
                        
                        <div class="session-body">
                            <div class="coach-info">
                                <div class="coach-avatar">
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <div class="coach-details">
                                    <h4>Huấn luyện viên: <%= s.getIDCoach() != null ? s.getIDCoach() : "Chưa phân công" %></h4>
                                    <p>Chuyên gia cai thuốc lá</p>
                                </div>
                            </div>
                            
                            <% if (s.getDetail() != null && !s.getDetail().trim().isEmpty()) { %>
                            <div class="session-details">
                                <h5><i class="fas fa-info-circle"></i> Nội dung buổi học:</h5>
                                <p><%= s.getDetail() %></p>
                            </div>
                            <% } %>
                            
                            <div class="session-actions">
                                <% if (s.getMeetLink() != null && !s.getMeetLink().isEmpty()) { %>
                                    <a href="<%= s.getMeetLink() %>" target="_blank" class="btn btn-primary">
                                        <i class="fas fa-video"></i>
                                        Tham gia buổi học
                                    </a>
                                <% } else { %>
                                    <div class="no-link">
                                        <i class="fas fa-info-circle"></i>
                                        <span>Chưa có link học</span>
                                    </div>
                                <% } %>
                                
                                <% if ("Present".equals(s.getStatus())) { %>
                                    <div class="completed-badge">
                                        <i class="fas fa-check-circle"></i>
                                        <span>Đã hoàn thành</span>
                                    </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
            <%  }
            } else { %>
                <div class="no-schedule">
                    <div class="no-schedule-icon">
                        <i class="fas fa-calendar-times"></i>
                    </div>
                    <h3>Chưa có lịch học</h3>
                    <p>Bạn chưa có lịch học nào trong tháng <%= selectedMonth %>/<%= selectedYear %>.</p>
                    <p>Vui lòng liên hệ với huấn luyện viên để được xếp lịch.</p>
                </div>
            <% } %>
        </div>

        <!-- Study Tips -->
        <div class="tips-section">
            <div class="tips-card">
                <div class="tips-header">
                    <i class="fas fa-lightbulb"></i>
                    <h3>Lời khuyên cho buổi học</h3>
                </div>
                <div class="tips-content">
                    <div class="tip-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Chuẩn bị tinh thần tích cực trước buổi học</span>
                    </div>
                    <div class="tip-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Tham gia đúng giờ và đầy đủ các buổi học</span>
                    </div>
                    <div class="tip-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Ghi chú lại những điều quan trọng</span>
                    </div>
                    <div class="tip-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Đặt câu hỏi khi có thắc mắc</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/member-schedule.js"></script>
</body>
</html>