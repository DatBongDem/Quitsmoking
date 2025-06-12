<%@page import="DTO.Member"%>
<!DOCTYPE html>
<html lang="vi">
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hồ sơ </title>
        <%
            Member member = (Member) request.getAttribute("member");
        %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="css/user-profile.css">
        
    </head>

    <body>
        <div class="user-profile">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="card profile-card">
                            <div class="profile-header">
                            </div>
                            <div class="text-center profile-image-container">
                                <img src="<%= member.getImage()%>" alt="Ảnh đại diện" class="profile-image" />
                            </div>
                            <div class="card-body profile-body">
                                <h3 class="card-title text-center mb-4">Thông tin Hồ sơ</h3>

                                <div class="detail-row">
                                    <span class="detail-label">ID thành viên:</span>
                                    <span class="detail-value" ><%= member.getIDMember()%></span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Mật khẩu:</span>
                                    <span class="detail-value">********</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Họ và tên:</span>
                                    <span class="detail-value"><%= member.getMemberName()%></span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Giới Tính</span>
                                    <span class="detail-value"><%= member.getGender()%></span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Ngày sinh:</span>
                                    <span class="detail-value"><%= member.getDateOfBirth()%></span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Ngày tham gia:</span>
                                    <span class="detail-value"><%= member.getJoinDate()%></span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Điện thoại:</span>
                                    <span class="detail-value"><%= member.getPhone()%></span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Địa chỉ:</span>
                                    <span class="detail-value"><%= member.getAddress()%></span>
                                </div>

                                <!-- Email -->
                                <div class="detail-row">
                                    <span class="detail-label">Email:</span>
                                    <span class="detail-value"><%= member.getEmail()%></span>
                                </div>

                                <!-- Trạng thái -->
                                <div class="detail-row">
                                    <span class="detail-label">Trạng thái:</span>
                                    <span class="detail-value">
                                        <%= member.getStatus() %>
                                    </span>
                                </div>

                                <div class="detail-row">
                                    <span class="detail-label">Mô Tả</span>
                                    <span class="detail-value"><%= member.getSubscription()%></span>
                                </div>
                                

                                <div class="text-center mt-4">
                                    <a href="UpdateProfileServlet?idMember=<%= member.getIDMember() %>" class="btn btn-success">
                                        Chỉnh sửa Hồ sơ
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2+UjszW/vFfrFWK7xM1uW+R5c+z4fN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    </body>

</html>