<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Member" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xếp hạng Huy hiệu</title>
        <link rel="stylesheet" type="text/css" href="css/rankingPage.css">

    </head>
    <body>
        <style>
            /* Home Button */
            .home-button {
                position: fixed; /* C? ??nh v? trí */
                top: 20px; /* Cách mép trên 20px */
                left: 20px; /* Cách mép trái 20px */
                background-color: #28a745; /* Màu xanh lá ch? ??o */
                color: white; /* Màu ch? */
                padding: 10px 20px; /* Kho?ng cách bên trong nút */
                font-size: 16px; /* Kích th??c ch? */
                font-weight: bold; /* Ch? ??m */
                border: none; /* Không vi?n */
                border-radius: 8px; /* Bo góc */
                text-decoration: none; /* Lo?i b? g?ch chân */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* ?? bóng nh? */
                transition: all 0.3s ease; /* Hi?u ?ng chuy?n ??ng */
                z-index: 999; /* Hi?n th? trên cùng */
            }

            .home-button:hover {
                background-color: #218838; /* Màu ??m h?n khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* ?? bóng t?ng khi hover */
                transform: scale(1.05); /* Hi?u ?ng phóng to nh? */
                text-decoration: none;
            }

        </style>
        <a href="homepage.jsp" class="home-button">Home</a>
        <h1 class="main-page-title">Bảng xếp hạng Huy hiệu</h1>
        <h2 class="silver">🥈 Silver</h2>
        <table>
            <tr><th>STT</th><th>ID</th><th>Tên</th><th>Số huy hiệu</th></tr>
                    <%
                        List<Member> silverList = (List<Member>) request.getAttribute("silverList");
                        int i = 1;
                        if (silverList != null && !silverList.isEmpty()) { // Also check if not empty
                            for (Member m : silverList) {
                    %>
            <tr><td><%= i++%></td><td><%= m.getIDMember()%></td><td><%= m.getMemberName()%></td><td><%= m.getPoint()%></td></tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="4">Không có dữ liệu cho bảng xếp hạng Silver.</td></tr>
            <% } %>
        </table>

        <h2 class="gold">🥇 Gold</h2>
        <table>
            <tr><th>STT</th><th>ID</th><th>Tên</th><th>Số huy hiệu</th></tr>
                    <%
                        List<Member> goldList = (List<Member>) request.getAttribute("goldList");
                        i = 1;
                        if (goldList != null && !goldList.isEmpty()) { // Also check if not empty
                            for (Member m : goldList) {
                    %>
            <tr><td><%= i++%></td><td><%= m.getIDMember()%></td><td><%= m.getMemberName()%></td><td><%= m.getPoint()%></td></tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="4">Không có dữ liệu cho bảng xếp hạng Gold.</td></tr>
            <% } %>
        </table>

        <h2 class="diamond">💎 Diamond</h2>
        <table>
            <tr><th>STT</th><th>ID</th><th>Tên</th><th>Số huy hiệu</th></tr>
                    <%
                        List<Member> diamondList = (List<Member>) request.getAttribute("diamondList");
                        i = 1;
                        if (diamondList != null && !diamondList.isEmpty()) { // Added missing brace and check for emptiness
                            for (Member m : diamondList) {
                    %>
            <tr><td><%= i++%></td><td><%= m.getIDMember()%></td><td><%= m.getMemberName()%></td><td><%= m.getPoint()%></td></tr>
            <%
                } // Closes the for loop
            } // This is the fixed closing brace for the if statement!
            else {
            %>
            <tr><td colspan="4">Không có dữ liệu cho bảng xếp hạng Diamond.</td></tr>
            <% }%>
        </table>
    </body>
</html>