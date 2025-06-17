<!doctype html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <link rel="stylesheet" href="css/styleregister.css">
        <link rel="stylesheet" href="css/stylehomepage.css">
        <title>Create Account Page</title>      
    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>


        <div class="register-form">
            <div class="container">
                <div class="inner-form">
                    <h2 class="inner-title">Register</h2>
                    <form action="RegisterServlet" method="post">
                        <div class="form-group">
                            <label for="memberid">ID Member</label>
                            <input type="text" class="form-control" name="memberid" required>
                        </div>

                        <div class="form-group">
                            <label for="fullname">Full Name</label>
                            <input type="text" class="form-control" name="fullname" required>
                        </div>

                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <div class="inner-form-gender">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                                           checked>
                                    <label class="form-check-label" for="male">Male</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                                           checked>
                                    <label class="form-check-label" for="male">Female</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" id="other" value="other"
                                           checked>
                                    <label class="form-check-label" for="male">Other</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>

                        <div class="form-group">
                            <label for="confirm">Confirm Password</label>
                            <input type="password" class="form-control" name="confirmPassword" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="tel" class="form-control" name="phone" required>
                        </div>

                        <div class="form-group">
                            <label for="address">Adress</label>
                            <textarea name="address" class="form-control" rows="2" required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="dob">Date of Birth</label>
                            <input type="date" class="form-control" name="dob" required>
                        </div>

                        <button type="submit" class="btn btn-green btn-block">Register</button>

                    </form>
                </div>
                <c:if test="${not empty errorMessage}">
                    <div class="error-message">
                        <p>${errorMessage}</p>
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div class="success-message">
                        <p>${successMessage}</p>
                    </div>
                </c:if>
            </div>
        </div>

    </body>

</html>