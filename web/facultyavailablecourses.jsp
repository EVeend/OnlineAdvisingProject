<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Proposed Schedule | UST Online Advising System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    </head>

    <body>
        <header class="black-border">
            <div><img class="img-responsive" src="assets/img/header.png" style="max-width:60%;height:auto;margin-top:0px;padding:9px;margin-bottom:0px;max-height:100%;"></div>
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
                            <li role="presentation"><a style="color: black;" href="adminfacultyindex.jsp">Logout</a></li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>

        <!-- AVAILABLE COURSES -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="header-prof-yellow" style="margin:0px;">Available Courses</h5>
                        <div style="height:15px;"></div>
                        <form>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:135px;">Course Code</th>
                                            <th style="width:250px;">Course Title</th>
                                            <th style="width:100px;">Lecture Units</th>
                                            <th style="width:100px;">Lab Units</th>
                                            <th style="width:140px;">Section </th>
                                            <th style="width:280px;">Schedule </th>
                                            <th style="width:200px;">Status</th>
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
                                                                FULL
                                                            </c:when>
                                                            <c:otherwise>
                                                                AVAILABLE
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td> 
                                                        <c:set var="string1" value="${course.getCourseID()}"/>
                                                        <c:set var="courseID" value="${fn:replace(string1,' ', '')}" />
                                                        <a data-toggle="modal" data-target="#update" class="btn btn-warning btn-sm" href="AdviserServlet?classList=classList&courseID=<c:out value="${courseID}"/>&section=<c:out value="${course.getSection()}"/>">View</a>
                                                        <!-- Modal -->
                                                        <div id="sched" class="modal fade" role="dialog">
                                                            <div class="modal-dialog modal-lg">

                                                                <!-- Modal content-->
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h4 class="modal-title"><center> ${studentID}'S PROPOSED SCHEDULE</center> </h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <section style="padding:0px;">
                                                                            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <div class="table-responsive">
                                                                                            <c:set var="courseID" value="${course}"/>
                                                                                            <c:set var="courseSection" value="${section}"/>
                                                                                            <h3>Course: ${courseID}</h3>
                                                                                            <h3>Section: ${courseSection}</h3>
                                                                                            <table class="table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th style="width:130px;">Student Number</th>
                                                                                                        <th style="width:300px;">Name</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <c:if test="${not empty classList}"> 
                                                                                                        <c:forEach items="${classList}" var="student">
                                                                                                            <tr>
                                                                                                                <td>${student.getUserID()}</td>
                                                                                                                <td>${student.getLastName()}, ${student.getFirstName()} </td>
                                                                                                            </tr>
                                                                                                        </c:forEach>
                                                                                                    </c:if>
                                                                                                    <c:set var="student" value="" scope="session"/>
                                                                                                    <c:set var="courseID" value="" scope="session"/>
                                                                                                    <c:set var="courseSection" value="" scope="session"/>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </section>

                                                                        <button type="button" style="margin-left: 800px; font-family: arial;" class="btn btn-success" data-dismiss="modal">Approve</button> <br> <br>
                                                                        <button type="button" style="margin-left: 800px; font-family: arial;" class="btn btn-danger" data-dismiss="modal">Reject</button>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-info" data-dismiss="modal">Back</button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
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
    <footer style="background-color: #000000; position: absolute; width: 100%; color: white; 
            padding:10px; padding-top: 15px; margin-top: 35px; height: auto; 
            line-height: 10px; bottom: auto; z-index: -99999; padding-right: 0px; padding-left: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12s">
                    <center>
                        <p style="line-height: 12px;" class="text-cen">Copyright � 2016  University of Santo Tomas. All rights reserved.</p> 
                        <!-- <p class="text-light">All rights reserved.</p> -->
                        <p class="text-light">Powered by <a href="http://steps.ust.edu.ph/" style="color: goldenrod;" target="_blank">Santo Tomas e-Service Providers</a></p>
                    </center>
                </div>
            </div>
        </div>
    </footer>
</html>