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
            <div><img class="img-responsive" src="assets/img/ustoaheader.png" style="height:93px;margin-top:0px;padding:9px;margin-bottom:0px;"></div>
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
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: white;">Advising <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><button class="navbar-items" type="submit" name="availableCourses"/>Available Courses</button></li>
                                    <li role="presentation"><button class="navbar-items" type="submit" name="proposedSchedule"/>Proposed Schedule</button></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#" style="color: white;">Account <span class="caret"></span></a>
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

        <!-- PROPOSED SCHEDULE -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h3 style="margin:0px;color:#ffcd40;">List of Proposed Schedules</h3>
                        <div style="height:15px;"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:251px;">Student Number</th>
                                        <th style="width:251px;"> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty proposedSchedList}"> 
                                        <c:forEach items="${proposedSchedList}" var="sched">
                                            <tr>
                                                <td>${sched.getUserID()}</td>
                                                <td> 
                                                    <!-- Trigger the modal with a button -->
                                                    <a data-toggle="modal" data-target="#update" class="btn btn-warning btn-sm" href="AdviserServlet?view=view&studentID=<c:out value="${sched.getUserID()}"/>">View</a>
                                                    <!-- Modal -->
                                                    <div id="update" class="modal fade" role="dialog">
                                                        <div class="modal-dialog modal-lg">

                                                            <!-- Modal content-->
                                                            <div class="modal-content">
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
    <footer> 
        <div id="footer">
            <div class="navbar navbar-fixed-bottom" style="background-color: #000000; padding: 2px; width: 1500px;">
                <p class="muted credit"><h5 style="margin-left: 250px; color: white;"> Copyright © 2016 University of Santo Tomas. All Rights Reserved. Powered by Santo Tomas e-Service Providers (sTeps) </h5>
                </p>
            </div>
        </div>
    </footer>
</html>