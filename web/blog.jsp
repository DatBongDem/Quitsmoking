<%-- 
    Document   : blog
    Created on : Jun 17, 2025, 4:13:39 PM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@include file="information/bootstrap.jspf" %>
    
    <link rel="stylesheet" href="css/blogPage.css">
    <link rel="stylesheet" href="css/stylehomepage.css">

    <title>Blog Page</title>
</head>

<body>
    
    
    <%@include file="information/header.jspf" %>

    <!-- Background -->
    <div class="background">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="inner-wrap">
                        <p class="inner-sub-title">LET'S HEALTHY MAKE YOU BEAUTIFUK</p>
                        <h1 class="inner-title">Blog Page</h1>
                        <div class="inner-blog">
                            <div class="home-page">
                                <a href="homepage.jsp">Home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Background -->

    <!-- Blog Page Content -->
    <section class="blog py-5">
        <div class="container">
            <h2 class="text-center mb-5">Tin tức về thuốc lá</h2>

            <!-- Search Form -->
            <form class="blog-search-form mb-5" action="#" method="get">
                <div class="form-row justify-content-center">
                    <div class="col-md-6 col-sm-8 mb-2">
                        <input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm bài viết..." />
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-success">Tìm kiếm</button>
                    </div>
                </div>
            </form>

            <div class="row">
                <!-- Blog Post 1 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog1.jpg" class="card-img-top" alt="No smoking">
                        <div class="card-body">
                            <h5 class="card-title">Tại sao nên cai thuốc lá?</h5>
                            <p class="card-text">Hút thuốc lá là nguyên nhân hàng đầu gây ra các bệnh về tim mạch, phổi
                                và ung thư. Việc từ bỏ thuốc lá giúp bạn cải thiện sức khỏe, tiết kiệm chi phí và sống
                                lâu hơn.</p>
                            <a href="#" class="btn btn-success">Đọc thêm</a>
                        </div>
                        <div class="card-footer text-muted">
                            Ngày đăng: 17/06/2025
                        </div>
                    </div>
                </div>

                <!-- Blog Post 2 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog2.jpg" class="card-img-top" alt="Quit smoking tips">
                        <div class="card-body">
                            <h5 class="card-title">5 bước đơn giản giúp bạn bỏ thuốc lá</h5>
                            <p class="card-text">Bỏ thuốc không dễ, nhưng với sự quyết tâm và những chiến lược đúng đắn,
                                bạn hoàn toàn có thể làm được. Cùng khám phá 5 bước quan trọng trong hành trình cai
                                thuốc.</p>
                            <a href="#" class="btn btn-success">Đọc thêm</a>
                        </div>
                        <div class="card-footer text-muted">
                            Ngày đăng: 15/06/2025
                        </div>
                    </div>
                </div>

                <!-- Blog Post 3 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog3.jpg" class="card-img-top" alt="Lợi ích cai thuốc">
                        <div class="card-body">
                            <h5 class="card-title">Lợi ích sức khỏe sau khi cai thuốc</h5>
                            <p class="card-text">Chỉ sau vài giờ không hút thuốc, cơ thể bạn đã bắt đầu phục hồi. Sau
                                vài tuần, bạn sẽ cảm nhận rõ rệt những thay đổi tích cực về hơi thở, nhịp tim và năng
                                lượng.</p>
                            <a href="#" class="btn btn-success">Đọc thêm</a>
                        </div>
                        <div class="card-footer text-muted">
                            Ngày đăng: 12/06/2025
                        </div>
                    </div>
                </div>

                <!-- Blog Post 4 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog4.jpg" class="card-img-top" alt="Câu chuyện thành công">
                        <div class="card-body">
                            <h5 class="card-title">Tôi đã bỏ thuốc sau 10 năm</h5>
                            <p class="card-text">Một người hút thuốc hơn 10 năm đã chia sẻ hành trình bỏ thuốc đầy khó
                                khăn nhưng vô cùng truyền cảm hứng. Đọc để hiểu rằng bạn cũng có thể làm được điều đó.
                            </p>
                            <a href="#" class="btn btn-success">Đọc thêm</a>
                        </div>
                        <div class="card-footer text-muted">
                            Ngày đăng: 10/06/2025
                        </div>
                    </div>
                </div>

                <!-- Blog Post 5 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog5.jpg" class="card-img-top" alt="Hỗ trợ gia đình">
                        <div class="card-body">
                            <h5 class="card-title">Gia đình giúp bạn bỏ thuốc như thế nào?</h5>
                            <p class="card-text">Sự hỗ trợ từ người thân là yếu tố quan trọng giúp người nghiện thuốc
                                vượt qua giai đoạn khó khăn. Họ là động lực mạnh mẽ để bạn không tái nghiện.</p>
                            <a href="#" class="btn btn-success">Đọc thêm</a>
                        </div>
                        <div class="card-footer text-muted">
                            Ngày đăng: 08/06/2025
                        </div>
                    </div>
                </div>

                <!-- Blog Post 6 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100 d-flex flex-column">
                        <img src="images/Blog/blog6.jpg" class="card-img-top" alt="Thống kê bỏ thuốc">
                        <div class="card-body">
                            <h5 class="card-title">Thống kê cho thấy điều gì?</h5>
                            <p class="card-text">Các số liệu mới nhất từ WHO chỉ ra rằng tỷ lệ người bỏ thuốc đang tăng
                                mạnh nhờ các chương trình cộng đồng và ý thức ngày càng cao về sức khỏe.</p>
                            <a href="#" class="btn btn-success">Đọc thêm</a>
                        </div>
                        <div class="card-footer text-muted">
                            Ngày đăng: 05/06/2025
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Blog Page Content -->

    <%@include file="information/footer.jspf" %>
</body>

</html>
