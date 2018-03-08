<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grades | UST Online Advising System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <li role="presentation"><a style="color: black;" href="studentindex.jsp">Logout</a></li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>

        <!-- CURRICULUM -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h3 class="text-nowrap" style="color:#ffcd48;">My Grades</h3>
                    </div>
                    <div class="col-md-12">
                        <div class="panel-group" role="tablist" aria-multiselectable="true" id="accordion-1">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-1">2017-2018, Second Semester</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-1" role="tabpanel">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Course Code</th>
                                                    <th>Grade</th>
                                                    <th>Remarks</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${not empty myGrades}">
                                                    <c:forEach items="${myGrades}" var="myGrade">
                                                        <tr>
                                                            <td>${myGrade.getCourseID()}</td>
                                                            <td>${myGrade.getGrade()}</td>
                                                            <td>${myGrade.getRemarkType()}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>