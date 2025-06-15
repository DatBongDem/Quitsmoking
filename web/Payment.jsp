<%-- 
    Document   : Payment
    Created on : Jun 15, 2025, 3:38:10 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận thanh toán - Vietnamese Payment</title>
    <link rel="stylesheet" href="css/PaymentStyle.css">
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="container">
            <div class="header-content">
                <h1>Xác nhận thanh toán</h1>
                <p>Kiểm tra thông tin và chọn phương thức thanh toán</p>
            </div>
        </div>
    </div>

    <div class="container">
        <form action="PaymentServlet" method="post" class="payment-form">
            <div class="form-grid">
                <!-- Left Column -->
                <div class="left-column">
                    <!-- Customer Information -->
                    <div class="card">
                        <div class="card-header">
                            <div class="icon user-icon"></div>
                            <h2>Thông tin khách hàng</h2>
                        </div>
                        
                        <div class="verification-badge">
                            <div class="check-icon"></div>
                            <div>
                                <span class="badge-title">Thông tin đã được xác thực</span>
                                <p class="badge-subtitle">Dữ liệu được tự động ký từ cơ sở dữ liệu hệ thống</p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="customerName">Họ và tên</label>
                            <input type="text" id="customerName" name="customerName" value="Nguyễn Văn An" required>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <div class="input-with-icon">
                                    <div class="icon mail-icon"></div>
                                    <input type="email" id="email" name="email" value="nguyenvanan@email.com" required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Số điện thoại</label>
                                <div class="input-with-icon">
                                    <div class="icon phone-icon"></div>
                                    <input type="tel" id="phone" name="phone" value="0901234567" required>
                                </div>
                            </div>
                        </div>
<div class="form-group">
                            <label for="idNumber">Số CMND/CCCD</label>
                            <div class="input-with-icon">
                                <div class="icon hash-icon"></div>
                                <input type="text" id="idNumber" name="idNumber" value="123456789012" required>
                            </div>
                        </div>
                        
                        <div class="verification-success">
                            <div class="check-icon"></div>
                            <span>Thông tin đã được xác thực từ cơ sở dữ liệu</span>
                        </div>
                    </div>

                    <!-- Payment Methods -->
                    <div class="card">
                        <div class="card-header">
                            <div class="icon credit-card-icon"></div>
                            <h2>Phương thức thanh toán</h2>
                        </div>
                        
                        <div class="payment-methods">
                            <div class="payment-method" data-method="momo">
                                <input type="radio" id="momo" name="paymentMethod" value="momo" required>
                                <label for="momo">
                                    <div class="method-content">
                                        <div class="method-icon momo-icon">M</div>
                                        <div class="method-info">
                                            <h3>MoMo</h3>
                                            <p>Thanh toán qua ví MoMo</p>
                                        </div>
                                    </div>
                                    <div class="chevron-icon"></div>
                                </label>
                            </div>
                            
                            <div class="payment-method" data-method="zalopay">
                                <input type="radio" id="zalopay" name="paymentMethod" value="zalopay" required>
                                <label for="zalopay">
                                    <div class="method-content">
                                        <div class="method-icon zalopay-icon">Z</div>
                                        <div class="method-info">
                                            <h3>ZaloPay</h3>
                                            <p>Thanh toán qua ví ZaloPay</p>
                                        </div>
                                    </div>
                                    <div class="chevron-icon"></div>
                                </label>
                            </div>
                            
                            <div class="payment-method" data-method="vnpay">
                                <input type="radio" id="vnpay" name="paymentMethod" value="vnpay" required>