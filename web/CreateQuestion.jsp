<%-- 
    Document   : CreateQuestion
    Created on : Jun 30, 2025, 12:49:17 PM
    Author     : Nghia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
    // Lấy idMember từ request (GET)
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
</head>

  <h2>Nhập Câu Hỏi Cho Thành Viên: <strong><%= idMember %></strong></h2>
  <p>Đang có <span id="countDisplay">0</span> câu hỏi</p>

  <form method="get" action="SaveQuestionsServlet">
   <input type="hidden" name="idMember" value="<%= idMember %>"/>


  <!-- đây -->
  <div>
    <label>Chọn thời hạn (ngày):</label>
    <input type="radio" id="plan3" name="planDays" value="3" required>
    <label for="plan3">3 ngày</label>

    <input type="radio" id="plan5" name="planDays" value="5">
    <label for="plan5">5 ngày</label>

    <input type="radio" id="plan7" name="planDays" value="7">
    <label for="plan7">7 ngày</label>
  </div>
  <br/>

  <input type="hidden" id="questionCount" name="questionCount" value="0"/>
  <div id="questions"></div>
  <button type="button" onclick="addQuestion()">+ Thêm câu hỏi</button>
  <br/><br/>
    <button type="submit">Lưu vào CSDL</button>
  </form>
  
    </body>
</html>
