<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - BBFB</title>
        <link rel="stylesheet" href="css/StyleAboutUs.css">
        <link href="css/stylehomepage.css" rel="stylesheet" type="text/css"/>

         <%@include file="information/bootstrap.jspf" %>
</head>

    <body>
        <%@include file="information/header.jspf" %>

        <main>
            <section class="about-us-blur">
                <div class="overlay">
                    <h2>About Us</h2>
                    <p>BBFB’s mission is to empower individuals to quit smoking and achieve a healthier, happier life
                        through personalized programs and a supportive community.</p>
                </div>
            </section>

            <section class="mission">

                <div class="image">
                    <img src="images/aboutUs/anhh.png" alt="Community">
                </div>
                <div class="content">
                    <h3>What will you gain by joining us ?</h3>
                    <ol>
                        <li>Personalized Quitting Plan: We design a plan tailored to each individual's habits, health, and
                            goals, increasing the chances of successfully quitting smoking.</li>
                        <li>Expert Counseling: Members will receive ongoing support from medical professionals,
                            psychologists, and coaches through online consultations and workshops.</li>
                        <li>Supportive Community: Join a positive and inspiring community where members can share
                            experiences, encourage one another, and progress together.</li>
                        <li>Resources and Tools: The website provides articles, videos, and in-depth materials about the
                            harmful effects of smoking, how to deal with cravings, and how to stay motivated.</li>

                    </ol>
                </div>

            </section>

            <section class="story">
                <div class="content">
                    <h3>Our Story</h3>
                    <p>BBFB was founded with a passion for helping people overcome smoking addiction. Through personalized
                        plans, expert guidance, and a community-first approach, we strive to create lasting impact on health
                        and well-being.</p>
                </div>
                <div class="image">
                    <img src="images/aboutUs/cay.png" alt="Our Story">
                </div>
            </section>
        </main>

        <%@include file="information/footer.jspf" %>
    </body>

</html>