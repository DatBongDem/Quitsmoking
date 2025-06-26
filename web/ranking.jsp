<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, DTO.Member" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xếp hạng Huy hiệu</title>
        <link rel="stylesheet" type="text/css" href="css/rankingPage.css">
    </head>
    <body>
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