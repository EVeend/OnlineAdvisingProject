<%-- 
    Document   : Popup
    Created on : 03 7, 18, 3:45:03 PM
    Author     : edwar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #cornernoticesbottomleft {
                background-color:#ffffff; /* background colour */
                border-top:1px solid #000000; /* top border width and colour */
                border-right:1px solid #000000; /* right border width and colour */
                width:45px; /* width before hovering */
                height:45px; /* height before hovering */
                font-size:11px; /* font size */
                font-family:arial; /* font */
                border-radius:0px 45px 0px 0px;
                -moz-border-radius:0px 45px 0px 0px;
                position:fixed;
                overflow:hidden;
                bottom:0px;
                left:0px;
                z-index:99999;
                padding:2px;
                -webkit-transition: opacity 0.7s linear;
                -webkit-transition: all 0.7s ease-in-out;
                -moz-transition: all 0.7s ease-in-out;
                -o-transition: all 0.7s ease-in-out;}

            #texticonbottomleft{
                font-size:40px; /* size of text icon */
                color:#000000; /* colour of text icon */
                margin-top:7px;
                margin-right:15px;
                text-align:right;
                -webkit-transition: opacity 0.7s linear;
                -webkit-transition: all 0.7s ease-in-out;
                -moz-transition: all 0.7s ease-in-out;
                -o-transition: all 0.7s ease-in-out;}

            #cornernoticesbottomleft:hover{
                width:300px; /* width after hovering */
                height:300px; /* height after hovering */
                border-radius:0px 45px 0px 0px;
                -moz-border-radius:0px 45px 0px 0px;}

            .textbottomleft{
                margin-top:9px;}


            #fourout {
                position:fixed;
                top:164px;right:1px;
                text-align:center;
                -webkit-transition-duration:0.3s;-moz-transition-duration:0.3s;-o-transition-duration:0.3s;transition-duration:0.3s;
                z-index:99999999; }

            #fourout_inner {
                position:fixed;
                width:230px; height:auto;
                top:140px; right:-250px;
                padding:10px;
                background:#FFFFFF; /* change #FFFFFF; to transparent; if you want the background of the slide out tab to be transparent and not white*/
                -webkit-transition-duration:0.3s;-moz-transition-duration:0.3s;-o-transition-duration:0.3s;transition-duration:0.3s;
                text-align:left;
                z-index:99999999; }

            #fourout:hover {
                right:250px;
                z-index:99999999; }

            #fourout:hover #fourout_inner {
                right:0px;
                z-index:99999999; }

            .fourtitle {
                position:absolute;
                right:-11px; top:3px;
                font-family:arial; font-size:16px;    
                -webkit-transform:rotate(-90deg); -moz-transform:rotate(-90deg); -ms-transform:rotate(-90deg); -o-transform:rotate(-90deg); transform:rotate(-90deg);
                z-index:99999999; }
            </style>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            <style>
            #cornernoticesbottomleft {
                background-color:#ffffff; /* background colour */
                border-top:1px solid #000000; /* top border width and colour */
                border-right:1px solid #000000; /* right border width and colour */
                width:45px; /* width before hovering */
                height:45px; /* height before hovering */
                font-size:11px; /* font size */
                font-family:arial; /* font */
                border-radius:0px 45px 0px 0px;
                -moz-border-radius:0px 45px 0px 0px;
                position:fixed;
                overflow:hidden;
                bottom:0px;
                left:0px;
                z-index:99999;
                padding:2px;
                -webkit-transition: opacity 0.7s linear;
                -webkit-transition: all 0.7s ease-in-out;
                -moz-transition: all 0.7s ease-in-out;
                -o-transition: all 0.7s ease-in-out;}

            #texticonbottomleft{
                font-size:40px; /* size of text icon */
                color:#000000; /* colour of text icon */
                margin-top:7px;
                margin-right:15px;
                text-align:right;
                -webkit-transition: opacity 0.7s linear;
                -webkit-transition: all 0.7s ease-in-out;
                -moz-transition: all 0.7s ease-in-out;
                -o-transition: all 0.7s ease-in-out;}

            #cornernoticesbottomleft:hover{
                width:300px; /* width after hovering */
                height:300px; /* height after hovering */
                border-radius:0px 45px 0px 0px;
                -moz-border-radius:0px 45px 0px 0px;}

            .textbottomleft{
                margin-top:9px;}


            #fourout {
                position:fixed;
                top:164px;right:1px;
                text-align:center;
                -webkit-transition-duration:0.3s;-moz-transition-duration:0.3s;-o-transition-duration:0.3s;transition-duration:0.3s;
                z-index:99999999; }

            #fourout_inner {
                position:fixed;
                width:230px; height:auto;
                top:140px; right:-250px;
                padding:10px;
                background:#FFFFFF; /* change #FFFFFF; to transparent; if you want the background of the slide out tab to be transparent and not white*/
                -webkit-transition-duration:0.3s;-moz-transition-duration:0.3s;-o-transition-duration:0.3s;transition-duration:0.3s;
                text-align:left;
                z-index:99999999; }

            #fourout:hover {
                right:250px;
                z-index:99999999; }

            #fourout:hover #fourout_inner {
                right:0px;
                z-index:99999999; }

            .fourtitle {
                position:absolute;
                right:-11px; top:3px;
                font-family:arial; font-size:16px;    
                -webkit-transform:rotate(-90deg); -moz-transform:rotate(-90deg); -ms-transform:rotate(-90deg); -o-transform:rotate(-90deg); transform:rotate(-90deg);
                z-index:99999999; }
            </style>
        </head>
        <body>
            <div class="container">
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#error1">For Overlapping Sched</button>

            <!-- Modal -->
            <div class="modal fade" id="error1" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                        <br>
                        <center>    <h4 style="color: red; font-weight: bold;" class="modal-title">Sorry!</h4> </center>
                        <center>  <div class="modal-body" style="font-size: 12px;"> </center>
                        <p>Your chosen course overlaps another course. </p>
                        <p>Please try again. </p>
                    </div>
                    <button type="button" class="btn-danger" data-dismiss="modal"> OK </button>
                    <br> <br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
