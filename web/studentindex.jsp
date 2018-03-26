<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to UST Online Advising System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    </head>

    <body>
        <header>
            <div><img class="img-responsive" src="assets/img/header.png" style="max-width:60%;height:auto;margin-top:0px;padding:9px;margin-bottom:0px;max-height:100%;"></div>
        </header>

        <!-- BODY -->

        <section>
            <div class="container">
                <div class="row">

                    <!-- LOGIN BOX -->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <h5 class="header-yellow"><i class="glyphicon glyphicon-user"></i> &nbsp; Login </h5>
                        <div class="login-box">
                            <form action="StudentServlet" method="POST">
                                <p class="errorMessage">
                                    <c:set var="error" value="${errorMessage}" />
                                    <c:if test="${error eq 'noAccess'}">
                                        Error: Your account does not have access to this website.
                                        <c:set var="error" value="" />
                                    </c:if>
                                    <c:if test="${error eq 'noUser'}">
                                        Error: Incorrect StudentID or Password.
                                        <c:set var="error" value="" />
                                    </c:if>
                                </p>
                                <div class="form-group"><label class="control-label"><strong>Student Number</strong></label><input class="form-control" type="text" name="studentNumber"></div>
                                <div class="form-group"><label class="control-label">Password </label><input class="form-control" type="password" name="password">
                                    <p class="help-block" style="color:rgb(0,0,0);"><strong>Initial password is your birthdate format :</strong> <span style="color:rgb(255,0,0);"><strong>MM/DD/YYYY</strong></span></p>
                                </div>
                                <input type="submit" value="Submit" class="btn btn-block btn-bg" name="logInStudent">
                                <p class="text-center color-blue"><strong>Forgot your password?</strong></p>
                            </form>
                        </div>
                    </div>

                    <!-- ANNOUNCEMENTS -->

                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                        <h5 class="header-red"><i class="glyphicon glyphicon-volume-up"></i>&nbsp;
                            Announcements </h5>
                        <div class="announce-box">
                            <p>
                                <em>
                                    ANNOUNCEMENTS<br><br>

                                    08 March 2018<br>
                                    To:       <b>ANNOUNCEMENT TO ALL CONCERNED STUDENTS</b> <br>
                                    From:    Office of the Registrar<br>
                                    Re:       New Online Advising System<br><br>

                                    The UST Online Advising System is a system specifically made for the advising of irregular students. The system will be activated prior to enrollment. Once the semester starts, this will be temporarily closed. Announcements regarding about the system will also be posted here.
                                    For further information, clarification about the system. You may contact STePS (Santo Tomas e-service Providers) at 406-1611 local 8427.
                                    Thank you very much and please be guided accordingly.

                                </em>                            
                            </p>
                        </div>
                        <div style="height:20px;"></div>

                        <!-- GUIDELINES -->

                        <h5 class="header-label-box"> <span class="header-label-box-inner"><strong>GUIDELINES</strong></span></h5>
                        <p class="color-yellow"><span>&gt; <strong>Frequently Asked Questions</strong></span></p>
                        <p>
                            1. Who can access UST Online Advising System?<br>
                            - Only active irregular students can access their myUSTe Student Portal account. Students who are regular, those who are with Honorable dismissal, and those who have discontinued, are considered inactive.
                            <br><br>
                            2. I am an irregular student. I cannot log onto my account or access the system.<br>
                            - The student will have to contact the system administrator regarding this matter. (STePS (Santo Tomas e-service Providers) at 406-1611 local 8427.)
                            <br><br>
                            3. How does the system work?<br>
                            - The system gives a list of courses available for advising based on the student?s deficiencies. The student can add or remove courses in the Advising tab. Once the student has finished adding/removing of courses, student submits the proposed schedule and waits for the approval of the adviser. Once submitted, student can no longer add/remove courses. The adviser may approve or reject the proposed schedule. The student will be notified once the schedule has been approved/rejected.
                            <br><br>
                            4. I already submitted a proposed schedule but I want to remove/change a subject. What will I do?<br>
                            - The student will have to contact their department chair/adviser regarding this matter. 
                            <br><br>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    </body>
    <c:set var="error" value="" scope="session"/>
</html>