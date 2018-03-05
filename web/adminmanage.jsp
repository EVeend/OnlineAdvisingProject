<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Advising System Front-End</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
    </head>

    <body>
        <header style="height:100px;background-color:#000000;padding:3px;">
            <div><img class="img-responsive" src="assets/img/ustoaheader.png" style="height:93px;margin-top:0px;padding:9px;margin-bottom:0px;"></div>
        </header>

        <!-- NAVBAR -->

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header"><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <form action="AdminServlet" method="get">
                        <ul class="nav navbar-nav">
                            <li role="presentation"><button class="formBTN" type="submit" name="myProfile">MyProfile</button></li>
                            <li role="presentation"><button class="formBTN" type="submit" name="manage">Manage</button></li>
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

        <!-- MANAGE USERS -->
        
        <section style="padding:0px;">
            <div class="container-fluid" style="padding-right:90px;padding-left:90px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h5 class="header-prof-yellow" style="margin:0px;">Manage Users</h5>
                        <div style="height:15px;"></div>
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#tab1" data-toggle="tab">STUDENTS</a></li>
                            <li><a href="#tab2" data-toggle="tab">FACULTY</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1" name="studentList">
                                <div style="padding:10px;"></div>
                                <div class="table-responsive">
                                    <table class="table">
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
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab2" name="facultyList">
                                <div style="padding:10px;"></div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width:190px;">Employee Number</th>
                                                <th style="width:200px;">Last Name</th>
                                                <th style="width:200px;">First Name</th>
                                                <th style="width:220px;">College</th>
                                                <th style="width:220px;">Department</th>
                                                <th style="width:170px;">Rank</th>
                                                <th style="width:200px;" colspan="2">Account Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty facultyList}"> 
                                                <c:forEach items="${facultyList}" var="faculty">
                                                    <tr>
                                                        <td>${student.getUserID()}</td>
                                                        <td>${student.getLastName()}</td>
                                                        <td>${student.getFirstName()}</td>
                                                        <td>${student.getCollege()}</td>
                                                        <td>${student.getDepartment()}</td>
                                                        <td>${student.getRank()}</td>
                                                        <td>${student.getAccountStatus()}</td>
                                                        <td><a href="#updateAccountStatus">SET</a></td>
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
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>

</html>