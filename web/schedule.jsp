<%-- 
    Document   : schedule
    Created on : Jun 17, 2025, 11:17:40 AM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch trình - Schedule Management</title>
    <link rel="stylesheet" href="css/schedule.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- Header Section -->
    <header class="main-header">
        <div class="header-container">
            <div class="header-left">
                <button class="home-btn" onclick="goHome()">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </button>
                <h1 class="header-title">Lịch trình</h1>
            </div>
            
            <div class="header-right">
                <div class="user-info">
                    <div class="user-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="user-details">
                        <span class="user-name">Nguyễn Văn An</span>
                        <span class="user-role">Quản lý</span>
                    </div>
                    <div class="user-dropdown">
                        <i class="fas fa-chevron-down"></i>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Control Panel -->
        <section class="control-panel">
            <div class="panel-header">
                <div class="panel-title">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Tuần từ 02/06 đến 08/06</span>
                </div>
                <div class="panel-actions">
                    <button class="action-btn add-event-btn" onclick="openAddEventModal()">
                        <i class="fas fa-plus"></i>
                        <span>Thêm sự kiện</span>
                    </button>
                    <select class="year-select">
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027" selected>2027</option>
                    </select>
                    <select class="week-select">
                        <option value="week1" selected>02/06 to 08/06</option>
                        <option value="week2">09/06 to 15/06</option>
                        <option value="week3">16/06 to 22/06</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- Schedule Grid -->
        <section class="schedule-section">
            <div class="schedule-container">
                <div class="schedule-grid">
                    <!-- Header Row -->
                    <div class="grid-header">
                        <div class="time-header">WEEK</div>
                        <%
                            String[] days = {"MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"};
                            String[] dayColors = {"#4CAF50", "#2196F3", "#FF9800", "#9C27B0", "#F44336", "#607D8B", "#795548"};
                            
                            for(int i = 0; i < days.length; i++) {
                        %>
                        <div class="day-header" style="background-color: <%= dayColors[i] %>">
                            <%= days[i] %>
                        </div>
                        <% } %>
                    </div>

                    <!-- Time Slots and Content -->
                    <%
                        String[] timeSlots = {"08:00", "10:00", "12:00", "14:00", "16:00", "18:00"};
                        for(int t = 0; t < timeSlots.length; t++) {
                    %>
                    <div class="grid-row">
                        <div class="time-slot">
                            <div class="time-display"><%= timeSlots[t] %></div>
                        </div>
                        
                        <% for(int d = 0; d < days.length; d++) { %>
                        <div class="schedule-cell" 
                             data-day="<%= days[d] %>" 
                             data-time="<%= timeSlots[t] %>"
                             data-cell-id="cell-<%= d %>-<%= t %>"
                             onclick="handleCellClick('<%= days[d] %>', '<%= timeSlots[t] %>', 'cell-<%= d %>-<%= t %>')">
                            <div class="empty-slot">
                                <i class="fas fa-plus-circle add-icon"></i>
                                <span class="add-text">Thêm sự kiện</span>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <% } %>
                </div>
            </div>
        </section>
    </main>

    <!-- Modal for Add/Edit Schedule -->
    <div id="scheduleModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Thêm sự kiện mới</h3>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>
            <div class="modal-body">
                <form id="scheduleForm">
                    <input type="hidden" id="eventId" name="eventId">
                    <input type="hidden" id="cellId" name="cellId">
                    
                    <div class="form-group">
                        <label for="eventTitle">Tiêu đề sự kiện: <span class="required">*</span></label>
                        <input type="text" id="eventTitle" name="eventTitle" placeholder="Nhập tiêu đề sự kiện" required>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="eventDay">Ngày:</label>
                            <input type="text" id="eventDay" name="eventDay" readonly>
                        </div>
                        <div class="form-group">
                            <label for="eventTime">Giờ:</label>
                            <input type="text" id="eventTime" name="eventTime" readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="eventDuration">Thời lượng:</label>
                        <select id="eventDuration" name="eventDuration">
                            <option value="1">1 giờ</option>
                            <option value="2" selected>2 giờ</option>
                            <option value="3">3 giờ</option>
                            <option value="4">4 giờ</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="eventLocation">Địa điểm:</label>
                        <input type="text" id="eventLocation" name="eventLocation" placeholder="Nhập địa điểm (VD: Phòng A101)">
                    </div>
                    
                    <div class="form-group">
                        <label for="eventType">Loại sự kiện:</label>
                        <select id="eventType" name="eventType">
                            <option value="meeting">Họp</option>
                            <option value="training">Đào tạo</option>
                            <option value="presentation">Thuyết trình</option>
                            <option value="workshop">Workshop</option>
                            <option value="other">Khác</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="eventDescription">Mô tả:</label>
                        <textarea id="eventDescription" name="eventDescription" placeholder="Nhập mô tả chi tiết (tùy chọn)"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="deleteBtn" onclick="deleteEvent()" style="display: none;">
                    <i class="fas fa-trash"></i> Xóa
                </button>
                <button type="button" class="btn btn-secondary" onclick="closeModal()">Hủy</button>
                <button type="button" class="btn btn-primary" onclick="saveEvent()">
                    <i class="fas fa-save"></i> Lưu
                </button>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content confirm-modal">
            <div class="modal-header">
                <h3>Xác nhận</h3>
                <span class="close" onclick="closeConfirmModal()">&times;</span>
            </div>
            <div class="modal-body">
                <div class="confirm-content">
                    <i class="fas fa-exclamation-triangle warning-icon"></i>
                    <p id="confirmMessage">Bạn có chắc chắn muốn xóa sự kiện này?</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeConfirmModal()">Hủy</button>
                <button type="button" class="btn btn-danger" onclick="confirmDelete()">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        </div>
    </div>

    <script src="js/schedule.js"></script>
</body>
</html>