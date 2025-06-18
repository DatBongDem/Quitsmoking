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
        <style>
            /* Home Button */
            .home-button {
                position: fixed; /* C? ??nh v? tr� */
                top: 20px; /* C�ch m�p tr�n 20px */
                left: 20px; /* C�ch m�p tr�i 20px */
                background-color: #28a745; /* M�u xanh l� ch? ??o */
                color: white; /* M�u ch? */
                padding: 10px 20px; /* Kho?ng c�ch b�n trong n�t */
                font-size: 16px; /* K�ch th??c ch? */
                font-weight: bold; /* Ch? ??m */
                border: none; /* Kh�ng vi?n */
                border-radius: 8px; /* Bo g�c */
                text-decoration: none; /* Lo?i b? g?ch ch�n */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* ?? b�ng nh? */
                transition: all 0.3s ease; /* Hi?u ?ng chuy?n ??ng */
                z-index: 999; /* Hi?n th? tr�n c�ng */
            }

            .home-button:hover {
                background-color: #218838; /* M�u ??m h?n khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* ?? b�ng t?ng khi hover */
                transform: scale(1.05); /* Hi?u ?ng ph�ng to nh? */
                text-decoration: underline; /* G?ch ch�n khi hover */
            }

        </style>
        <a href="homepage.jsp" class="home-button">Home</a>    

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