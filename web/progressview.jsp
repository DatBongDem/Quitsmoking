<%-- 
    Document   : progressview
    Created on : Jun 18, 2025, 7:18:28 PM
    Author     : Nguyen Tien Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   
    <link rel="stylesheet" href="css/progressview.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- HEADER SECTION - Phần tiêu đề trang -->
    <div class="header-container">
        <div class="header-content">
            <div class="header-icon">
                <i class="fas fa-chart-line"></i>
            </div>
            <div class="header-text">
                <h1>Tiến trình cai thuốc</h1>
                <p>Theo dõi hành trình cai thuốc của thành viên <%= memberId %></p>
            </div>
        </div>
    </div>

    <!-- MAIN CONTAINER - Container chính -->
    <div class="main-container">
        
        <!-- MEMBER INFO SECTION - Phần thông tin thành viên -->
        <div class="member-info-section">
            <div class="member-card">
                <div class="member-avatar">
                    <i class="fas fa-user-circle"></i>
                </div>
                <div class="member-details">
                    <h2>Thành viên: <%= memberId %></h2>
                    <p>Hành trình cai thuốc đang được theo dõi</p>
                </div>
                <div class="member-status">
                    <div class="status-badge active">
                        <i class="fas fa-heartbeat"></i>
                        <span>Đang theo dõi</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- PROGRESS CONTENT SECTION - Phần nội dung tiến trình -->
        <div class="progress-content-section">
            <% if (logList != null && !logList.isEmpty()) { %>
                <!-- PROGRESS STATS - Thống kê tiến trình -->
                <div class="progress-stats-container">
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-calendar-check"></i>
                            </div>
                            <div class="stat-info">
                                <div class="stat-number"><%= logList.size() %></div>
                                <div class="stat-label">Ngày ghi nhận</div>
                            </div>
                        </div>
                        
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-smoking-ban"></i>
                            </div>
                            <div class="stat-info">
                                <div class="stat-number">
                                    <%
                                        int totalCigarettes = 0;
                                        for (ProgressLog log : logList) {
                                            totalCigarettes += log.getNumberOfCigarettes();
                                        }
                                    %>
                                    <%= totalCigarettes %>
                                </div>
                                <div class="stat-label">Tổng điếu thuốc</div>
                            </div>
                        </div>
                        
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-chart-bar"></i>
                            </div>
                            <div class="stat-info">
                                <div class="stat-number">
                                    <%= Math.round((double)totalCigarettes / logList.size()) %>
                                </div>
                                <div class="stat-label">Trung bình/ngày</div>
                            </div>
                        </div>
                        
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <div class="stat-info">
                                <div class="stat-number">
                                    <%
                                        int zeroDays = 0;
                                        for (ProgressLog log : logList) {
                                            if (log.getNumberOfCigarettes() == 0) {
                                                zeroDays++;
                                            }
                                        }
                                    %>
                                    <%= zeroDays %>
                                </div>
                                <div class="stat-label">Ngày không hút</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PROGRESS TIMELINE - Dòng thời gian tiến trình -->
                <div class="progress-timeline-container">
                    <div class="timeline-header">
                        <h3>
                            <i class="fas fa-history"></i>
                            Lịch sử tiến trình
                        </h3>
                        <p>Theo dõi chi tiết từng ngày</p>
                    </div>
                    
                    <div class="progress-timeline">
                        <%
                            for (int i = 0; i < logList.size(); i++) {
                                ProgressLog log = logList.get(i);
                                String progressClass = "";
                                String progressIcon = "";
                                
                                if (log.getNumberOfCigarettes() == 0) {
                                    progressClass = "excellent";
                                    progressIcon = "fas fa-star";
                                } else if (log.getNumberOfCigarettes() <= 5) {
                                    progressClass = "good";
                                    progressIcon = "fas fa-thumbs-up";
                                } else if (log.getNumberOfCigarettes() <= 10) {
                                    progressClass = "average";
                                    progressIcon = "fas fa-minus-circle";
                                } else {
                                    progressClass = "needs-improvement";
                                    progressIcon = "fas fa-exclamation-triangle";
                                }
                        %>
                                <!-- PROGRESS LOG CARD - Thẻ nhật ký tiến trình -->
                                <div class="progress-log-card <%= progressClass %>" data-log-index="<%= i %>">
                                    <!-- Card Header - Phần đầu thẻ -->
                                    <div class="log-card-header">
                                        <div class="log-date">
                                            <i class="fas fa-calendar-alt"></i>
                                            <span><%= log.getLogDate() %></span>
                                        </div>
                                        <div class="progress-indicator">
                                            <i class="<%= progressIcon %>"></i>
                                        </div>
                                    </div>
                                    
                                    <!-- Card Content - Nội dung thẻ -->
                                    <div class="log-card-content">
                                        <!-- Cigarette Count - Số điếu thuốc -->
                                        <div class="cigarette-info">
                                            <div class="info-label">
                                                <i class="fas fa-smoking"></i>
                                                <span>Số điếu thuốc</span>
                                            </div>
                                            <div class="cigarette-count <%= progressClass %>">
                                                <%= log.getNumberOfCigarettes() %>
                                                <span class="count-unit">điếu</span>
                                            </div>
                                        </div>
                                        
                                        <!-- Notes Section - Phần ghi chú -->
                                        <div class="notes-section">
                                            <div class="notes-label">
                                                <i class="fas fa-sticky-note"></i>
                                                <span>Ghi chú</span>
                                            </div>
                                            <div class="notes-content">
                                                <% if (log.getNotes() != null && !log.getNotes().trim().isEmpty()) { %>
                                                    <%= log.getNotes() %>
                                                <% } else { %>
                                                    <em>Không có ghi chú</em>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Card Footer - Phần cuối thẻ -->
                                    <div class="log-card-footer">
                                        <div class="progress-message">
                                            <% if (log.getNumberOfCigarettes() == 0) { %>
                                                <i class="fas fa-star"></i>
                                                <span>Xuất sắc! Không hút thuốc</span>
                                            <% } else if (log.getNumberOfCigarettes() <= 5) { %>
                                                <i class="fas fa-thumbs-up"></i>
                                                <span>Tốt! Đang tiến bộ</span>
                                            <% } else if (log.getNumberOfCigarettes() <= 10) { %>
                                                <i class="fas fa-minus-circle"></i>
                                                <span>Trung bình, cần cố gắng hơn</span>
                                            <% } else { %>
                                                <i class="fas fa-exclamation-triangle"></i>
                                                <span>Cần cải thiện</span>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            <% } else { %>
                <!-- EMPTY STATE - Trạng thái không có dữ liệu -->
                <div class="empty-state-container">
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="fas fa-clipboard-list"></i>
                        </div>
                        <h3>Chưa có tiến trình nào</h3>
                        <p>Thành viên <%= memberId %> chưa ghi nhận tiến trình nào.</p>
                        <div class="empty-actions">
                            <button onclick="refreshPage()" class="refresh-btn">
                                <i class="fas fa-sync-alt"></i>
                                <span>Làm mới</span>
                            </button>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>

        <!-- NAVIGATION SECTION - Phần điều hướng -->
        <div class="navigation-section">
            <div class="nav-buttons">
                <a href="javascript:history.back()" class="nav-btn back-btn">
                    <i class="fas fa-arrow-left"></i>
                    <span>Quay lại</span>
                </a>
                
                <a href="homepage.jsp" class="nav-btn home-btn">
                    <i class="fas fa-home"></i>
                    <span>Trang chủ</span>
                </a>
                
                <button onclick="printProgress()" class="nav-btn print-btn">
                    <i class="fas fa-print"></i>
                    <span>In báo cáo</span>
                </button>
            </div>
        </div>
    </div>

    <!-- FLOATING ACTION BUTTON - Nút hành động nổi -->
    <div class="fab-container">
        <button class="fab" onclick="scrollToTop()">
            <i class="fas fa-chevron-up"></i>
        </button>
    </div>

    <script>
        // Cuộn lên đầu trang
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        }

        // Làm mới trang
        function refreshPage() {
            window.location.reload();
        }

        // In báo cáo
        function printProgress() {
            window.print();
        }

        // Hiển thị/ẩn FAB khi cuộn
        window.addEventListener('scroll', function() {
            const fab = document.querySelector('.fab-container');
            if (window.scrollY > 300) {
                fab.style.opacity = '1';
                fab.style.visibility = 'visible';
            } else {
                fab.style.opacity = '0';
                fab.style.visibility = 'hidden';
            }
        });

        // Animation cho các thẻ log
        document.addEventListener('DOMContentLoaded', function() {
            const logCards = document.querySelectorAll('.progress-log-card');
            logCards.forEach((card, index) => {
                card.style.animationDelay = (index * 0.1) + 's';
            });
        });
    </script>
</body>
</html>