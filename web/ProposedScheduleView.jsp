<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">-->
<!--        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>-->
<!--        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link href="Resource/bootstrap.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

    </head>
    <header>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title"><center> ${studentID}'S PROPOSED SCHEDULE </center> </h4>
        </div>
    </header>
    <div class="modal-body">
        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width:130px;">Course Code</th>
                                        <th style="width:300px;">Course Title</th>
                                        <th style="width:100px;">Lecture Units</th>
                                        <th style="width:100px;">Lab Units</th>
                                        <th style="width:130px;">Section </th>
                                        <th>Schedule </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty studentSched}"> 
                                        <c:forEach items="${studentSched}" var="course">
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
        <div>
            <form action="AdviserServlet" method="post">
                <h4>Remarks: </h4>
                <input type="hidden" name="studentID" value="${studentID}">
                <textarea class="form-control" name="remark"></textarea>
                <button name="approve" type="submit" style="margin-top: 20px; margin-left: 780px; font-family: arial;" class="btn btn-success">Approve</button> <br> <br>
                <button name="reject" type="submit" style="margin-left: 780px; font-family: arial;" class="btn btn-danger">Reject</button>
            </form>

        </div>

    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-info" data-dismiss="modal">Back</button>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>