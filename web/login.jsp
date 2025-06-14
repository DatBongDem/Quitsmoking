<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <link rel="stylesheet" href="css/login.css">

</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
   
    <div class="login">
        
        <div class="container">
            <div class="row d-flex align-items-stretch" style="min-height: 500px;">
                <div class="col-xl-7">
                    <div class="inner-login">
                        <div class="inner-box">
                             <c:if test="${not empty error}">
                <div class="error-message">
                    <p>${error}</p>
                </div>
            </c:if>
                            <h3 class="inner-title">Sign In</h3>
                            <form action="LoginServlet" method="get" class="form-login">
                                <label for="role" class="item-name">Select Role</label><br>
                                <div class="select-wrapper">
                                    <select class="inner-option" id="role" name="role">
                                        <option value="member" selected>Member</option>
                                        <option value="coach">Coach</option>
                                    </select>
                                </div>

                                <label for="username" class="item-name">User Name</label><br>
                                <div class="inner-input">
                                    <input type="text" id="IDMember" name="username" placeholder="ID Member">
                                </div>

                                <label for="password" class="item-name">Password</label><br>
                                <div class="inner-input">
                                    <input type="password" id="password" name="password" placeholder="Password">
                                </div>

                                <div class="inner-button">
                                    <button type="submit" class="button" value="Login">Login</button>
                                </div>
                                <!-- Remember Me + Forgot Password -->
                                <div class="inner-options">
                                    <label class="item-name">
                                        <input type="checkbox" name="remember">
                                        Remember Me
                                    </label>
                                    <a href="#">Forgot Password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5">
                    <div class="welcome">
                        <div class="inner-welcome">
                            <h2 class="inner-title-welcome">
                                Welcome to Login
                            </h2>
                                    <span class="inner-sub-title">Don't have an account?</span>
                                    <div class="inner-button">
                                        <a href="register.jsp" class="button">Sign Up</a>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>