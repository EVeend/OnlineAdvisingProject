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
    <script></script>
    <body>
        <header style="height:100px;background-color:#000000;padding:3px;">
            <div><img class="img-responsive" src="assets/img/ustoaheader.png" style="height:93px;margin-top:0px;padding:9px;margin-bottom:0px;"></div>
        </header>

        <!-- NAVBAR -->

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header"><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <form action="StudentServlet" method="get">
                        <ul class="nav navbar-nav">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: white;">MyProfile <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="profile"/>Profile</li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="mySchedule"/>My Schedule</li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="curriculum"/>Curriculum</li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="deficiencies"/>Deficiencies</li>
                                </ul>
                            </li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: white;">Advising <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="availableCourses"/>Available Courses</a></li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="proposedSchedule"/>Proposed Schedule</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: white;">Account <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="changePassword"/>Change Password</a></li>
                                </ul>
                            </li>
                            <li role="presentation"><button class="logoutBTN" type="submit" name="logout"/>Logout</li>
                        </ul>
                    </form>

                </div>
            </div>
        </nav>

        <!-- PROFILE -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h3 class="text-nowrap" style="color:#ffcd48;">Student Profile</h3>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><img class="img-responsive" src="${Student_Picture}" style="height:145px;max-height:100%;"></div>
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                        <h5 class="header-prof-yellow" style="margin:0px;">Personal Information</h5>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:251px;">Student Number</th>
                                        <th>${Student_ID}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Last Name</td>
                                        <td>${Last_Name}  </td>
                                    </tr>
                                    <tr>
                                        <td>First Name</td>
                                        <td>${First_Name}  </td>
                                    </tr>
                                    <tr>
                                        <td>Middle Name</td>
                                        <td>${Middle_Name}  </td>
                                    </tr>
                                    <tr>
                                        <td>Birth date</td>
                                        <td>${Birthdate} </td>
                                    </tr>
                                    <tr>
                                        <td>Email Address</td>
                                        <td>${Email}  </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div></div>
                        <h5 class="header-prof-yellow" style="margin:0px;">Course Information</h5>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Course </th>
                                        <th>${Program}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Degree </td>
                                        <td>Bachelor of Science ${Program}</td>
                                    </tr>
                                    <tr>
                                        <td>College </td>
                                        <td>${College}</td>
                                    </tr>
                                    <tr>
                                        <td>Status </td>
                                        <td>${Status} </td>
                                    </tr>
                                    <tr>
                                        <td>Retention Status</td>
                                        <td>${Retention_Status} </td>
                                    </tr>
                                    <tr>
                                        <td>Current Section </td>
                                        <td>${Block} </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
    <footer> 
        <div id="footer">
            <div class="navbar navbar-fixed-bottom" style="background-color: #000000; padding: 2px; width: 1500px;">
                <p class="muted credit"><h5 style="margin-left: 250px; color: white;"> Copyright © 2016 University of Santo Tomas. All Rights Reserved. Powered by Santo Tomas e-Service Providers (sTeps) </h5>
                </p>
            </div>
        </div>
    </footer>
</html>