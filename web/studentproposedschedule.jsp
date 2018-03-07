<!DOCTYPE html>
<html>
    <style>

        #tabs{

            border-top-left-radius: 15px;
            color: #000;
            background: #fff;
            position:fixed;
            right:10px;
            text-align: center;
            bottom: 100px;
            padding: 10px;
            height:30px;
            width: 80px;
            overflow:hidden;
            -webkit-transition: opacity 0.7s linear;
            -webkit-transition: all 0.7s ease-in-out;
            -moz-transition: all 0.7s ease-in-out;
            -o-transition: all 0.7s ease-in-out;
            z-index:999999999;
        }



        #tabs:hover{
            text-align: center;
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
            -webkit-transition: opacity 0.7s linear;
            -webkit-transition: all 0.7s ease-in-out;
            -moz-transition: all 0.7s ease-in-out;
            -o-transition: all 0.7s ease-in-out;
            padding:5px;
            height:150px;
            width:250px;
            z-index:999999999;
            opacity: 2.0;
            background:white;
        }



        .ttitle {
            background: #E3E4FA;
            padding: 5px;
            font-size: 12px;
        }

    </style>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Proposed Schedule | UST Online Advising System</title>
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


        <!-- PROPOSED SCHEDULE SECTION -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px; padding-bottom: 20px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="header-prof-yellow" style="margin:0px;">Proposed Schedule</h5>
                        <div style="height:15px;"></div>
                        <div class="table-responsive">
                            <c:if test="${hasSubmittedSchedule}"> 
                                <h5>Your schedule has been submitted, please wait for the adviser to evaluate your submitted schedule.</h5>
                            </c:if>
                            <c:if test="${hasScheduleEvaluated}"> 
                                <h5>Your schedule has been evaluated, check here for the result</h5>
                                <!-- Trigger the modal with a button -->
                                <a data-toggle="modal" data-target="#update" class="btn btn-warning btn-sm"/>View</a>
                            </c:if>

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:135px;">Course Code</th>
                                        <th style="width:250px;">Course Title</th>
                                        <th style="width:100px;">Lecture Units</th>
                                        <th style="width:100px;">Lab Units</th>
                                        <th style="width:140px;">Section </th>
                                        <th style="width:275px;">Schedule </th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty studentProposedSchedule}">
                                            <c:forEach items="${studentProposedSchedule}" var="course">
                                                <tr>
                                                    <td>${course.getCourseID()}</td>
                                                    <td>${course.getCourseName()}</td>
                                                    <td>${course.getCourseLectUnits()}</td>
                                                    <td>${course.getCourseLabUnits()}</td>
                                                    <td>${course.getSection()} </td>
                                                    <td>
                                                        <c:if test="${not empty course.getSchedule()}"> 
                                                            <c:forEach items="${course.getSchedule()}" var="sched">
                                                                ${sched.getRoom()} ${sched.getDay()} ${sched.getStartTime()} - ${sched.getEndTime()} <br>
                                                            </c:forEach>
                                                        </c:if>
                                                    </td>
                                                    <td> 
                                                        <c:if test="${not hasScheduleEvaluated && not hasSubmittedSchedule}"> 
                                                            <form action="StudentServlet" method="post">
                                                                <input type="hidden" name="courseID" value="${course.getCourseID()}">
                                                                <input type="hidden" name="courseSection" value="${course.getSection()}">
                                                                <button class="btn btn-danger" type="submit" name="removeFromSchedule">REMOVE </button>
                                                            </form>
                                                        </c:if>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                        <p style="color:#7f7f7f">${noProposedSched}</p>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                            <p>Current total units: ${totalUnits}</p>
                        </div>
                        <div>
                            <form action="StudentServlet" method="post">
                                <button class="btn btn-info float-right" type="submit" name="availableCourses">Back to available courses</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding-right: 70px; ">
                <<c:if test="${not hasScheduleEvaluated && not hasSubmittedSchedule}"> 
                    <form action="StudentServlet" method="post">
                        <button style="margin-right: 20px; "class="btn btn-info float-right btn-danger" type="submit" name="submitSchedule">Submit</button>
                        <button style="margin-right: 20px; " class="btn btn-info float-right btn-warning" type="submit" name="resetSchedule">Reset</button> 
                        <button style="margin-right: 20px; " class="btn btn-info float-right" type="submit">Back</button> 
                    </form>
                </c:if>
            </div>
        </section>

        <!-- bubble tab -->

        <div class="wrapper">

            <div id="tabs">
                <b style="font-size: 16px;">?</b><br>
                <p><div style="background: #ffcd49 ;padding: 5px;font-size: 12px;"><b>HELP</b></div>
                <p>BLAH BLAH BLAH</p>

            </div>

            <!-- bubble tab -->





            <footer style="background-color: #000000; position: relative; width: 100%; color: white; 
                    padding:10px; padding-top: 15px; margin-top: 50px; height: auto; 
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

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>

</html>