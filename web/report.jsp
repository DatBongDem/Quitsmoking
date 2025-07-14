<%-- 
    Document   : report
    Created on : Jul 13, 2025, 1:55:27 PM
    Author     : Nguyen Tien Dat
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%

    String reporterID;
    if ((String) session.getAttribute("id") == null) {
        reporterID = "không có";
    } else {
        reporterID = (String) session.getAttribute("id");
    }
    String role;
    if ((String) session.getAttribute("role")==null) {
        role = "guest";
    } else {
        role = (String) session.getAttribute("role");        
    }
    String type = request.getParameter("type");
    String postId = request.getParameter("postId");

    if (type == null) {
        type = "system";
    }

    String link = "";
    if ("blog".equals(type) && postId != null && !postId.isEmpty()) {
        link = "http://localhost:8080/PageQuitSmoking/BlogDetailServlet?id=" + postId;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gửi báo cáo</title>
    </head>
    <body>

        <h2>Gửi báo cáo - <%= ("system".equals(type) ? "Hệ thống" : "Bài viết")%></h2>

        <%  String message = (String) request.getAttribute("message");
            if (message != null) {%>
        <p style="color: green;"><%= message%></p>
        <% }%>

        <form action="ReportServlet" method="post">
            <input type="hidden" name="reporterID" value="<%= reporterID%>">
            <input type="hidden" name="role" value="<%= role%>">
            <input type="hidden" name="type" value="<%= type%>">

            <label>Loại báo cáo:</label>
            <select name="reportType" required>
                <% if ("system".equals(type)) { %>
                <option value="Lỗi tải trang">Lỗi tải trang</option>
                <option value="Lỗi phông chữ">Lỗi phông chữ</option>
                <option value="Không xem được ảnh">Không xem được ảnh</option>
                <option value="Nút bấm không được">Nút bấm không được</option>
                <option value="Khác">Khác</option>
                <% } else { %>
                <option value="Quấy rối, lăng mạ, ngược đãi">Quấy rối, lăng mạ, ngược đãi</option>
                <option value="Tự tử, gây thương tích, hình ảnh bạo lực">Tự tử, gây thương tích, hình ảnh bạo lực</option>
                <option value="Chia sẽ, buôn bán hàng cấm">Chia sẽ, buôn bán hàng cấm</option>
                <option value="Nội dung người lớn">Nội dung người lớn</option>
                <option value="Thông tin sai sự thật">Thông tin sai sự thật</option>
                <option value="Khác">Khác</option>
                <% } %>
            </select><br><br>

            <label>Link liên quan:</label>
            <% if ("blog".equals(type)) {%>
            <input type="text" name="link" value="<%= link%>" readonly><br><br>
            <% } else { %>
            <input type="text" name="link"><br><br>
            <% }%>

            <label>Mô tả:</label><br>
            <textarea name="description" rows="5" cols="40" required></textarea><br><br>

            <input type="submit" value="Gửi báo cáo">
        </form>

    </body>
</html>
