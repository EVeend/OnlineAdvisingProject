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
        </div>
    </header>
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
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Back</button>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>