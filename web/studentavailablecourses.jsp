<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Available Courses | UST Online Advising System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
        <link rel="stylesheet" href="assets/JS/homePageJS.js">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    </head>

    <script>
        function openModal() {
            $('#update').modal('show');
        }
    </script>
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
                    <form action="StudentServlet" method="get">
                        <ul class="nav navbar-nav">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: black;">MyProfile <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="profile"/>Profile</li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="myGrades"/>My Grades</li> <!-- GRADES-->
                                    <li role="presentation"><button class="navbar-items" type="submit" name="mySchedule"/>My Schedule</li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="curriculum"/>Curriculum</li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="deficiencies"/>Deficiencies</li>
                                </ul>
                            </li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: black;">Advising <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="availableCourses"/>Available Courses</a></li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="proposedSchedule"/>Proposed Schedule</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: black;">Account <span class="caret"></span></a>
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

        <!-- AVAILABLE COURSES SECTION -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="header-prof-yellow" style="margin:0px;">Available Courses</h5>
                        <div style="height:15px;"></div>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:135px;">Course Code</th>
                                        <th style="width:250px;">Course Title</th>
                                        <th style="width:100px;">Lecture Units</th>
                                        <th style="width:100px;">Lab Units</th>
                                        <th style="width:140px;">Section </th>
                                        <th style="width:140px;">No. of Available Slots</th>
                                        <th style="width:140px;">Maximum Slot</th>
                                        <th style="width:140px;">Status</th>
                                        <th style="width:280px;">Schedule </th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty coursesList}"> 
                                        <c:forEach items="${coursesList}" var="course">
                                            <tr>
                                                <td>${course.getCourseID()}</td>
                                                <td>${course.getCourseName()}</td>
                                                <td>${course.getCourseLectUnits()}</td>
                                                <td>${course.getCourseLabUnits()}</td>
                                                <td>${course.getSection()} </td>
                                                <td>${course.getAvailableSlot()}</td>
                                                 <td>${course.getMaxSlot()} </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${course.getAvailableSlot() eq 0}">
                                                            FULL
                                                        </c:when>
                                                        <c:otherwise>
                                                            Available
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:if test="${not empty course.getSchedule()}"> 
                                                        <c:forEach items="${course.getSchedule()}" var="sched">
                                                            ${sched.getRoom()} ${sched.getDay()} ${sched.getStartTime()} - ${sched.getEndTime()} <br>
                                                        </c:forEach>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${course.getAvailableSlot() eq 0}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <form action="StudentServlet" method="post">
                                                                <input type="hidden" name="courseID" value="${course.getCourseID()}">
                                                                <input type="hidden" name="courseSection" value="${course.getSection()}">
                                                                <button class="btn btn-warning" type="submit" name="addToSchedule">ADD </button>
                                                                <c:if test="${not empty errorMessage}"> 
                                                                    <script>
                                                                        console.log("Error");
                                                                        openModal();
                                                                    </script>
                                                                </c:if>
                                                                <!-- Modal -->
                                                                <div id="update" class="modal fade" role="dialog">
                                                                    <div class="modal-dialog modal-sm">
                                                                        <div class="modal-content">
                                                                            <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                                                                            <br>
                                                                            <center>    <h4 style="color: red; font-weight: bold;" class="modal-title">Sorry!</h4> </center>
                                                                            <center>  <div class="modal-body" style="font-size: 12px;"> </center>
                                                                            <p>Your chosen course overlaps another course. </p>
                                                                            <p>Please try again. </p>
                                                                        </div>
                                                                        <button type="button" class="btn-danger" dismissdata-="modal"> OK </button>
                                                                        <br> <br>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <form action="StudentServlet" method="get">
                                <button class="btn btn-info float-right" type="submit" name="proposedSchedule">See proposed schedule</button>
                            </form>
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