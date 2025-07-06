<%-- 
    Document   : AdminEditCoach
    Created on : Jul 6, 2025, 10:38:22 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DTO.Coach" %>
<%
    Coach c = (Coach) request.getAttribute("coach");
%>
<html>
<head><title>Sửa Coach</title></head>
<body>
    <h2>Sửa thông tin Coach</h2>
    <form action="EditCoachServlet" method="post">
        <input type="hidden" name="IDCoach" value="<%= c.getIDCoach() %>"/>

        Họ tên: <input type="text" name="coachName" value="<%= c.getCoachName() %>"/><br/>
        Giới tính: <input type="text" name="gender" value="<%= c.getGender() %>"/><br/>
        Điện thoại: <input type="text" name="phone" value="<%= c.getPhone() %>"/><br/>
        Email: <input type="text" name="email" value="<%= c.getEmail() %>"/><br/>
        Địa chỉ: <input type="text" name="address" value="<%= c.getAddress() %>"/><br/>
        Chuyên môn: <input type="text" name="specialization" value="<%= c.getSpecialization() %>"/><br/>
        Kinh nghiệm (năm): <input type="number" name="experienceYears" value="<%= c.getExperienceYears() %>"/><br/>

        <button type="submit">Lưu</button>
        <a href="ManageCoachServlet"><button type="button">Hủy</button></a>
    </form>
</body>
</html>
