<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Available Courses | UST Online Advising System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    </head>

    <body>
        <header class="black-border">
            <div><img class="img-responsive" src="assets/img/header.png" style="max-width:80%;height:auto;margin-top:0px;padding:9px;margin-bottom:0px;max-height:100%;"></div>
        </header>

        <!-- NAVBAR -->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header"><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <form action="AdviserServlet" method="get">
                        <ul class="nav navbar-nav">
                            <li role="presentation"><button class="formBTN" type="submit" name="myProfile">MyProfile</button></li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: black;">Advising <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="studentList"/>Students List</a></li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="availableCourses"/>Available Courses</button></li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="proposedSchedule"/>Proposed Schedule</button></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: black;">Account <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="changePassword"/>Change Password</button></li>
                                </ul>
                            </li>
                            <li role="presentation"><button class="logoutBTN" type="submit" name="logout"/>Logout</button></li>
                        </ul>
                    </form>

                </div>
            </div>
        </nav>
        <!-- STUDENTS LIST SECTION -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="header-prof-yellow" style="margin:0px;">Students List</h5>
                        <div style="height:15px;"></div>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:150px;">Student Number</th>
                                        <th style="width:200px;">Last Name</th>
                                        <th style="width:200px;">First Name</th>
                                        <th style="width:100px;">Year</th>
                                        <th style="width:200px;">College</th>
                                        <th style="width:200px;">Program</th>
                                        <th style="width:100px;">Block</th>
                                        <th style="width:100px;">Retention Status</th>
                                        <th style="width:100px;">Payment Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty studentList}"> 
                                        <c:forEach items="${studentList}" var="student">
                                            <tr>
                                                <td>${student.getUserID()}</td>
                                                <td>${student.getLastName()}</td>
                                                <td>${student.getFirstName()}</td>
                                                <td>${student.getYear()}</td>
                                                <td>${student.getCollege()}</td>
                                                <td>${student.getProgram()}</td>
                                                <td>${student.getBlock()}</td>
                                                <td>${student.getRetentionStatus()}</td>
                                                <td>${student.getPaymentStatus()}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div id="loginModal" class="modal">
                <div class="modal-content"> <span id="closeBTN">&times;</span>
                    <h2>Log in</h2>
                    <form>
                        <input type="text" name="username" placeholder="Username">
                        <input type="text" name="password" placeholder="Password">
                        <input type="submit" name="loginBTN" value="Login" class="submitBTN">
                    </form>
                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>

    <footer style="background-color: #000000; position: absolute; width: 100%; color: white; 
            padding:10px; padding-top: 15px; margin-top: 35px; height: auto; 
            line-height: 10px; bottom: auto; z-index: -99999; padding-right: 0px; padding-left: 0px;">
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