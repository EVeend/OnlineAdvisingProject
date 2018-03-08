<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to UST Online Advising System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
    </head>

    <body>
        <header>
            <div><img class="img-responsive" src="assets/img/header.png" style="max-width:60%;height:auto;margin-top:0px;padding:9px;margin-bottom:0px;max-height:100%;"></div>
        </header>
        <section style="padding:0px;">
            <div class="container">
                <div class="row">

                    <!-- LOGIN BOX -->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <h5 class="header-yellow"><i class="glyphicon glyphicon-user"></i> &nbsp; Login </h5>
                        <div class="login-box">
                            <form action="AdviserServlet" method="POST">
                                <div class="form-group"><label class="control-label"><strong>Employee Number</strong></label><input class="form-control" type="text" name="employeeNumber"></div>
                                <div class="form-group"><label class="control-label">Password </label><input class="form-control" type="password" name="password">
                                    <p class="help-block" style="color:rgb(0,0,0);"><strong>Initial password is your birthdate format :</strong> <span style="color:rgb(255,0,0);"><strong>MM/DD/YYYY</strong></span></p>
                                </div>
                                <input type="submit" value="Submit" class="btn btn-block btn-bg" name="logInEmployee">
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

                        <!-- GUIDELINES SECTION -->
                        <h5 class="header-label-box"> <span class="header-label-box-inner"><strong>GUIDELINES</strong></span></h5>
                        <p class="color-yellow"><span>&gt; <strong>Frequently Asked Questions</strong></span></p>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
    <footer style="background-color: #000000; position: absolute; width: 100%; color: white; 
            padding:10px; padding-top: 15px; margin-top: 35px; height: auto; 
            line-height: 10px; bottom: 0; z-index: -99999; padding-right: 0px; padding-left: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12s">
                    <center>
                        <p style="line-height: 12px;" class="text-cen">Copyright © 2016  University of Santo Tomas. All rights reserved.</p> 
                        <!-- <p class="text-light">All rights reserved.</p> -->
                        <p class="text-light">Powered by <a href="http://steps.ust.edu.ph/" style="color: goldenrod;" target="_blank">Santo Tomas e-Service Providers</a></p>
                    </center>
                </div>
            </div>
        </div>
    </footer>
</html>