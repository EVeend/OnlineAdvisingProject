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
                            <div class="tab-pane active" id="tab1">
                                <div style="padding:10px;"></div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Student No.</th>
                                                <th>Last Name</th>
                                                <th>First Name</th>
                                                <th>Middle Name</th>
                                                <th>Section</th>
                                                <th>Course</th>
                                                <th>College</th>
                                                <th>Retention Status</th>
                                                <th>Inactive button</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2015081861</td>
                                                <td>Crisostomo</td>
                                                <td>Joshua</td>
                                                <td>Santos</td>
                                                <td>3ECE-E</td>
                                                <td>Electronics and Communications Engineering</td>
                                                <td>Faculty of Engineering</td>
                                                <td>Irregular</td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab2">
                                <div style="padding:10px;"></div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Employee No.</th>
                                                <th>Last Name</th>
                                                <th>First Name</th>
                                                <th>Middle Name</th>
                                                <th>Department</th>
                                                <th>College</th>
                                                <th>Rank</th>
                                                <th>Inactive button</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2005010001</td>
                                                <td>Santos</td>
                                                <td>Joseph</td>
                                                <td>Reyes</td>
                                                <td>Electronics Engineering</td>
                                                <td>Faculty of Engineering</td>
                                                <td>Assistant Professor</td>
                                                <td></td>
                                            </tr>
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