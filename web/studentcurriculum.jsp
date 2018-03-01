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

        <!-- CURRICULUM -->

        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h3 class="text-nowrap" style="color:#ffcd48;">My Curriculum</h3>
                    </div>
                    <div class="col-md-12">
                        <div class="panel-group" role="tablist" aria-multiselectable="true" id="accordion-1">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-1">First Year, First Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-1" role="tabpanel">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Course Code</th>
                                                    <th>Course Title</th>
                                                    <th>Lec</th>
                                                    <th>Lab</th>
                                                    <th>Pre-Req</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${not empty fSemfYear}">
                                                    <c:forEach items="${fSemfYear}" var="course">
                                                        <tr>
                                                            <td>${course.getCourseID()}</td>
                                                            <td>${course.getCourseName()}</td>
                                                            <td>${course.getCourseLectUnits()}</td>
                                                            <td>${course.getCourseLabUnits()}</td>
                                                            <td><c:if test="${not empty course.getPrerequisite()}">
                                                                    <c:forEach items="${course.getPrerequisite()}" var="prereq">
                                                                        ${prereq} 
                                                                    </c:forEach>
                                                                </c:if></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-2">First Year, Second Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-2" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty sSemfYear}">
                                                        <c:forEach items="${sSemfYear}" var="course">
                                                            <tr>
                                                                <td>${course.getCourseID()}</td>
                                                                <td>${course.getCourseName()}</td>
                                                                <td>${course.getCourseLectUnits()}</td>
                                                                <td>${course.getCourseLabUnits()}</td>
                                                                <td><c:if test="${not empty course.getPrerequisite()}">
                                                                        <c:forEach items="${course.getPrerequisite()}" var="prereq">
                                                                            ${prereq} 
                                                                        </c:forEach>
                                                                    </c:if></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-3">Second Year, First Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-3" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty fSemsYear}">
                                                        <c:forEach items="${fSemsYear}" var="course">
                                                            <tr>
                                                                <td>${course.getCourseID()}</td>
                                                                <td>${course.getCourseName()}</td>
                                                                <td>${course.getCourseLectUnits()}</td>
                                                                <td>${course.getCourseLabUnits()}</td>
                                                                <td><c:if test="${not empty course.getPrerequisite()}">
                                                                        <c:forEach items="${course.getPrerequisite()}" var="prereq">
                                                                            ${prereq} 
                                                                        </c:forEach>
                                                                    </c:if></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-4">Second Year, Second Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-4" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty sSemsYear}">
                                                        <c:forEach items="${sSemsYear}" var="course">
                                                            <tr>
                                                                <td>${course.getCourseID()}</td>
                                                                <td>${course.getCourseName()}</td>
                                                                <td>${course.getCourseLectUnits()}</td>
                                                                <td>${course.getCourseLabUnits()}</td>
                                                                <td><c:if test="${not empty course.getPrerequisite()}">
                                                                        <c:forEach items="${course.getPrerequisite()}" var="prereq">
                                                                            ${prereq} 
                                                                        </c:forEach>
                                                                    </c:if></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-5">Third Year, First Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-5" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty fSemtYear}">
                                                        <c:forEach items="${fSemtYear}" var="course">
                                                            <tr>
                                                                <td>${course.getCourseID()}</td>
                                                                <td>${course.getCourseName()}</td>
                                                                <td>${course.getCourseLectUnits()}</td>
                                                                <td>${course.getCourseLabUnits()}</td>
                                                                <td><c:if test="${not empty course.getPrerequisite()}">
                                                                        <c:forEach items="${course.getPrerequisite()}" var="prereq">
                                                                            ${prereq} 
                                                                        </c:forEach>
                                                                    </c:if></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-6">Third Year, Second Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-6" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Cell 1</td>
                                                        <td>Cell 2</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-7">Fourth Year, First Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-7" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Cell 1</td>
                                                        <td>Cell 2</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-8">Fourth Year, Second Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-8" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Cell 1</td>
                                                        <td>Cell 2</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-9">Fifth Year, First Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-9" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Cell 1</td>
                                                        <td>Cell 2</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion-1" aria-expanded="false" href="#accordion-1 .item-10">Fifth Year, Second Term</a></h4>
                                </div>
                                <div class="panel-collapse collapse item-10" role="tabpanel">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Title</th>
                                                        <th>Lec</th>
                                                        <th>Lab</th>
                                                        <th>Pre-Req</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Cell 1</td>
                                                        <td>Cell 2</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                        <td>Text</td>
                                                    </tr>
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
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>

</html>