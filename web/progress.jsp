<%-- 
    Document   : progress
    Created on : Jun 17, 2025, 5:26:02 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%
    String idMember = (String) session.getAttribute("id");
    if (idMember == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String startDate = (String) request.getAttribute("startDate");
    String todayStr = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
 
    Integer todayCigarettes = (Integer) request.getAttribute("todayCigarettes");
    Integer yesterday = (Integer) request.getAttribute("yesterdayCigarettes");
    Integer firstDay = (Integer) request.getAttribute("firstDayCigarettes");
    Boolean isFirstDay = (Boolean) request.getAttribute("isFirstDay");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiến trình cai thuốc - Health Center</title>
    <link rel="stylesheet" href="css/progress.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="progress-container">
        <!-- Header Section -->
        <div class="header-section">
            <h1 class="page-title">
                <i class="fas fa-chart-line"></i>
                Tiến trình cai thuốc ngày <%= todayStr %>
            </h1>
        </div>
        
        <!-- Info Section -->
        <div class="info-section">
            <div class="info-card">
                <div class="info-item">
                    <i class="fas fa-user"></i>
                    <span class="info-label">ID Member:</span>
                    <span class="info-value"><%= idMember %></span>
                </div>
                <div class="info-item">
                    <i class="fas fa-calendar-start"></i>
                    <span class="info-label">Ngày bắt đầu tiến trình:</span>
                    <span class="info-value"><%= startDate != null ? startDate : "null" %></span>
                </div>
            </div>
        </div>

        <!-- First Day Message -->
        <% if (isFirstDay != null && isFirstDay) { %>
            <div class="success-message">
                <i class="fas fa-party-horn"></i>
                🎉 Hôm nay là ngày đầu tiên bạn tham gia tiến trình cai thuốc! Chúc bạn thành công!
            </div>
        <% } %>

        <!-- Form Section -->
        <div class="form-container">
            <form action="ProgressLogServlet" method="post" id="progressForm">
                <input type="hidden" name="idMember" value="<%= idMember %>">

                <!-- Cigarette Count Section -->
                <div class="question-section main-question">
                    <label for="cigarettes" class="question-label">
                        <i class="fas fa-smoking"></i>
                        Hôm nay bạn đã hút bao nhiêu điếu thuốc?
                    </label>
                    <div class="cigarette-input-container">
                        <input type="number" id="cigarettes" name="cigarettes" min="0" max="100" required>
                        <span class="input-suffix">điếu</span>
                    </div>
                    <div class="quick-select">
                        <button type="button" class="quick-btn" onclick="setCigaretteCount(0)">0</button>
                        <button type="button" class="quick-btn" onclick="setCigaretteCount(5)">5</button>
                        <button type="button" class="quick-btn" onclick="setCigaretteCount(10)">10</button>
                        <button type="button" class="quick-btn" onclick="setCigaretteCount(15)">15</button>
                        <button type="button" class="quick-btn" onclick="setCigaretteCount(20)">20</button>
                    </div>
                </div>

                <!-- Questions Section -->
                <div class="questions-header">
                    <h3><i class="fas fa-clipboard-question"></i> Câu hỏi đánh giá hàng ngày</h3>
                    <p>Vui lòng trả lời thành thật để có kết quả chính xác nhất</p>
                </div>

                <div class="question-section">
                    <label for="q1" class="question-label">
                        <i class="fas fa-question-circle"></i>
                        Câu hỏi 1: Bạn có cảm thấy khó khăn khi kiềm chế không hút thuốc ở nơi cấm hút thuốc không?
                    </label>
                    <textarea id="q1" name="q1" placeholder="Chia sẻ cảm nhận của bạn..." required></textarea>
                </div>

                <div class="question-section">
                    <label for="q2" class="question-label">
                        <i class="fas fa-question-circle"></i>
                        Câu hỏi 2: Bạn có thường xuyên hút thuốc trong vài giờ đầu sau khi thức dậy không?
                    </label>
                    <textarea id="q2" name="q2" placeholder="Mô tả thói quen buổi sáng của bạn..." required></textarea>
                </div>

                <div class="question-section">
                    <label for="q3" class="question-label">
                        <i class="fas fa-question-circle"></i>
                        Câu hỏi 3: Bạn có cảm thấy stress hay lo lắng khi không thể hút thuốc trong thời gian dài không?
                    </label>
                    <textarea id="q3" name="q3" placeholder="Chia sẻ cảm xúc của bạn..." required></textarea>
                </div>

                <div class="question-section">
                    <label for="q4" class="question-label">
                        <i class="fas fa-question-circle"></i>
                        Câu hỏi 4: Hôm nay bạn có cảm thấy khao khát thuốc lá mạnh mẽ hơn những ngày trước không?
                    </label>
                    <textarea id="q4" name="q4" placeholder="Mô tả mức độ khao khát..." required></textarea>
                </div>

                <div class="question-section">
                    <label for="q5" class="question-label">
                        <i class="fas fa-question-circle"></i>
                        Câu hỏi 5: Bạn có gặp khó khăn trong việc tập trung vào công việc hôm nay không?
                    </label>
                    <textarea id="q5" name="q5" placeholder="Chia sẻ về khả năng tập trung..." required></textarea>
                </div>

                <!-- Submit Button -->
                <div class="submit-container">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-paper-plane"></i>
                        Gửi tiến trình
                    </button>
                </div>
            </form>
        </div>

        <!-- Results Section -->
        <% if (todayCigarettes != null) { %>
            <div class="results-section">
                <h3 class="results-title">
                    <i class="fas fa-chart-line"></i> 
                    Kết quả hôm nay
                </h3>
                
                <div class="result-card current-day">
                    <div class="result-icon">
                        <i class="fas fa-smoking"></i>
                    </div>
                    <div class="result-content">
                        <h4>Số điếu thuốc hôm nay</h4>
                        <span class="result-number"><%= todayCigarettes %></span>
                        <span class="result-unit">điếu</span>
                    </div>
                </div>

                <% if (!Boolean.TRUE.equals(isFirstDay)) { %>
                    <div class="progress-comparison">
                        <% if (yesterday != null) { %>
                            <div class="result-card <%= (yesterday - todayCigarettes) >= 0 ? "improvement" : "regression" %>">
                                <div class="result-icon">
                                    <i class="fas fa-<%= (yesterday - todayCigarettes) >= 0 ? "arrow-down" : "arrow-up" %>"></i>
                                </div>
                                <div class="result-content">
                                    <h4>So với hôm qua</h4>
                                    <span class="result-number">
                                        <%= Math.abs(yesterday - todayCigarettes) %>
                                    </span>
                                    <span class="result-unit">
                                        điếu <%= (yesterday - todayCigarettes) >= 0 ? "giảm" : "tăng" %>
                                    </span>
                                </div>
                            </div>
                        <% } %>
                        
                        <% if (firstDay != null) { %>
                            <div class="result-card <%= (firstDay - todayCigarettes) >= 0 ? "achievement" : "regression" %>">
                                <div class="result-icon">
                                    <i class="fas fa-trophy"></i>
                                </div>
                                <div class="result-content">
                                    <h4>So với ngày đầu tiên</h4>
                                    <span class="result-number">
                                        <%= Math.abs(firstDay - todayCigarettes) %>
                                    </span>
                                    <span class="result-unit">
                                        điếu <%= (firstDay - todayCigarettes) >= 0 ? "giảm" : "tăng" %>
                                    </span>
                                </div>
                            </div>
                        <% } %>
                    </div>

                    <!-- Motivation Message -->
                    <% if (yesterday != null && (yesterday - todayCigarettes) > 0) { %>
                        <div class="motivation-message success">
                            <i class="fas fa-star"></i>
                            Tuyệt vời! Bạn đang có tiến bộ rõ rệt. Hãy tiếp tục cố gắng!
                        </div>
                    <% } else if (yesterday != null && (yesterday - todayCigarettes) < 0) { %>
                        <div class="motivation-message warning">
                            <i class="fas fa-heart"></i>
                            Đừng nản lòng! Mỗi ngày là một cơ hội mới để cải thiện. Bạn có thể làm được!
                        </div>
                    <% } else { %>
                        <div class="motivation-message info">
                            <i class="fas fa-thumbs-up"></i>
                            Bạn đang duy trì ổn định. Hãy cố gắng giảm dần trong những ngày tới!
                        </div>
                    <% } %>
                <% } %>
            </div>
        <% } %>

        <!-- Navigation Section -->
        <div class="navigation-section">
            <a href="homepage.jsp" class="nav-btn secondary">
                <i class="fas fa-home"></i>
                Về trang chủ
            </a>
            <a href="progressHistory.jsp" class="nav-btn primary">
                <i class="fas fa-history"></i>
                Xem lịch sử tiến trình
            </a>
        </div>
    </div>

    <script src="js/progress.js"></script>
</body>
</html>