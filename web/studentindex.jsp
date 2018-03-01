<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Advising System Front-End</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    </head>

    <body>
        <header style="height:100px;background-color:#000000;padding:3px;">
            <div><img class="img-responsive" src="assets/img/ustoaheader.png" style="height:93px;margin-top:0px;padding:9px;margin-bottom:0px;max-height:100%;"></div>
        </header>

        <!-- BODY -->

        <section>
            <div class="container">
                <div class="row">

                    <!-- LOGIN BOX -->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <h5 class="header-yellow"><i class="glyphicon glyphicon-user"></i> &nbsp; Login </h5>
                        <div class="login-box">
                            <form action="StudentServlet" method="post">
                                <p class="errorMessage">
                                    <c:set var="error" value="${errorMessage}" />
                                    <c:if test="${error eq 'noAccess'}">
                                        Error: Your account does not have access to this website.
                                        <c:set var="error" value="" />
                                    </c:if>
                                    <c:if test="${error eq 'noUser'}">
                                        Error: Incorrect StudentID or Password.
                                        <c:set var="error" value="" />
                                    </c:if>
                                </p>
                                <div class="form-group"><label class="control-label"><strong>Student Number</strong></label><input class="form-control" type="text" name="studentNumber"></div>
                                <div class="form-group"><label class="control-label">Password </label><input class="form-control" type="password" name="password">
                                    <p class="help-block" style="color:rgb(0,0,0);"><strong>Initial password is your birthdate format :</strong> <span style="color:rgb(255,0,0);"><strong>MM/DD/YYYY</strong></span></p>
                                </div>
                                <input type="submit" value="Submit" class="btn btn-block btn-bg" name="logInStudent">
                                <p class="text-center color-blue"><strong>Forgot your password?</strong></p>
                            </form>
                        </div>
                    </div>

                    <!-- ANNOUNCEMENTS -->

                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                        <h5 class="header-red"><i class="glyphicon glyphicon-volume-up"></i>&nbsp;
                            Announcements </h5>
                        <div class="announce-box">
                            <p><em>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</em>                            </p>
                        </div>
                        <div style="height:20px;"></div>

                        <!-- GUIDELINES -->

                        <h5 class="header-label-box"> <span class="header-label-box-inner"><strong>GUIDELINES </strong></span></h5>
                        <p class="color-yellow"> <span>&gt; <strong>Account Activation Guide</strong></span> <br><span>&gt; <strong>Frequently Asked Questions</strong></span> </p>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <footer> 
            <div id="footer">
                <div class="navbar navbar-fixed-bottom" style="background-color: #000000; padding: 2px; width: 1500px;">
                    <p class="muted credit"><h5 style="margin-left: 250px; color: white;"> Copyright © 2016 University of Santo Tomas. All Rights Reserved. Powered by Santo Tomas e-Service Providers (sTeps) </h5>
                    </p>
                </div>
            </div>
        </footer>
    </body>

</html>