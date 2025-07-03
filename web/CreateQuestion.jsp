<%-- 
    Document   : CreateQuestion
    Created on : Jun 30, 2025, 12:49:17 PM
    Author     : Nghia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tạo câu hỏi cho thành viên</title>
    <link rel="stylesheet" href="css/create-question.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <%
    // Lấy idMember từ request (GET)
<<<<<<< HEAD
    String idMember = request.getParameter("idMember");
    if (idMember == null) {
        idMember = "";
    }
%>
    </head>
    <body>
        <%@include file="information/header.jspf" %>
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const container   = document.getElementById('questions');
      const hiddenCount = document.getElementById('questionCount');
      const spanDisplay = document.getElementById('countDisplay');
      const MAX_Q       = 10;

      function updateCount() {
        const n = container.querySelectorAll('.question-item').length;
        hiddenCount.value = n;
        spanDisplay.textContent = n;
      }

      function renumber() {
        container.querySelectorAll('.question-item').forEach((item, idx) => {
          const num   = idx + 1;
          const label = item.querySelector('label');
          const input = item.querySelector('input');
          const btn   = item.querySelector('button');

          label.htmlFor     = 'qs' + num;
          label.textContent = 'Câu hỏi ' + num + ':';
          input.id          = 'qs' + num;
          input.name        = 'qs' + num;
          input.placeholder = 'Nhập câu hỏi ' + num;
          btn.setAttribute('data-index', num);
        });
      }

      // Thêm câu hỏi mới
      window.addQuestion = () => {
        if (container.children.length >= MAX_Q) return;
        const div = document.createElement('div');
        div.className = 'question-item';
        div.innerHTML = `
          <label></label>
          <input type="text" />
          <button type="button">×</button>
        `;
        div.querySelector('button').addEventListener('click', () => {
          div.remove();
          renumber();
          updateCount();
        });
        container.appendChild(div);
        renumber();
        updateCount();
      };

      // Khởi tạo 1 câu hỏi mặc định
      addQuestion();
    });
  </script>

=======
        String idMember = request.getParameter("idMember");
        if (idMember == null) idMember = "";
        String userName = "Nguyễn Minh Khải"; // Lấy từ session nếu cần
    %>
</head>
<body>
<div class="main-bg">
    <!-- HEADER -->
    <div class="custom-header">
        <div class="header-top">
            <div class="header-info">
                <span><i class="fas fa-phone"></i> 000-000-000</span>
                <span><i class="fas fa-clock"></i> 6:00 AM - 10:00 PM (Mon-Fri)</span>
                <span><i class="fas fa-envelope"></i> tiendantse181844</span>
            </div>
            <div class="header-user">
                <i class="fas fa-user"></i>
                <span><%= userName %></span>
            </div>
        </div>
        <div class="header-main">
            <div class="header-logo">
                <span class="logo-text">BFBB</span>
            </div>
            <ul class="header-nav">
                <li><a href="homepage.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Testing</a></li>
                <li><a href="#">Ranking</a></li>
            </ul>
        </div>
    </div>
>>>>>>> 457b1eabb32d540d270933229988eebf4931c621

    <!-- FORM -->
    <div class="main-container">
        <div class="form-card">
            <div class="form-title-row">
                <div class="form-title-left">
                    <span class="icon-circle"><i class="fas fa-question"></i></span>
                    <span class="form-title-text">Nhập Câu Hỏi Cho Thành Viên:</span>
                </div>
                <span class="member-id"><%= idMember %></span>
            </div>
            <div class="desc">
                <span class="count-badge" id="countBadge"><span id="countDisplay">1</span>/10</span> câu hỏi
            </div>
            <form method="get" action="SaveQuestionsServlet" class="question-form" autocomplete="off">
                <input type="hidden" name="idMember" value="<%= idMember %>"/>
                <div class="plan-section">
                    <span class="plan-label">Chọn thời hạn (ngày):</span>
                    <label class="plan-radio">
                        <input type="radio" id="plan3" name="planDays" value="3" required>
                        <span class="plan-custom"></span>
                        3 ngày
                    </label>
                    <label class="plan-radio">
                        <input type="radio" id="plan5" name="planDays" value="5">
                        <span class="plan-custom"></span>
                        5 ngày
                    </label>
                    <label class="plan-radio">
                        <input type="radio" id="plan7" name="planDays" value="7">
                        <span class="plan-custom"></span>
                        7 ngày
                    </label>
                </div>
                <input type="hidden" id="questionCount" name="questionCount" value="1"/>
                <div id="questions"></div>
                <button type="button" class="btn add-btn" id="addBtn">
                    <i class="fas fa-plus"></i> Thêm câu hỏi
                </button>
                <button type="submit" class="btn submit-btn">
                    <i class="fas fa-database"></i> Lưu vào CSDL
                </button>
            </form>
        </div>
    </div>
</div>
<script src="js/create-question.js"></script>
</body>
</html>
