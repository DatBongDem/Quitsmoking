<%-- 
    Document   : adminAddCoach
    Created on : Jul 6, 2025, 10:50:26 PM
    Author     : Nguyen Tien Dat
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm Coach mới</title>
    </head>
    <body>
        <h2>Thêm Coach mới</h2>
        <form action="CreateCoachServlet" method="post">
            IDCoach: <input type="text" name="IDCoach" required /><br/>
            Mật khẩu: <input type="text" name="pass" required /><br/>
            Họ tên: <input type="text" name="coachName" required /><br/>
            Giới tính:
            <input type="radio" name="gender" value="male" checked /> Nam
            <input type="radio" name="gender" value="female" /> Nữ
            <br/>
            SĐT: <input type="text" name="phone" /><br/>
            Email: <input type="email" name="email" /><br/>
            Địa chỉ: <input type="text" name="address" /><br/>
            Ngày sinh (yyyy-mm-dd): <input type="text" name="dateOfBirth" /><br/>
            Chuyên môn: <input type="text" name="specialization" /><br/>
            Kinh nghiệm (năm): <input type="number" name="experienceYears" /><br/>
            Hình ảnh (URL): <input type="text" name="image" /><br/>
            <br/>
            <button type="submit">Tạo mới</button>
            <a href="ManageCoachServlet"><button type="button">Trở về</button></a>
        </form>
    </body>
</html>
