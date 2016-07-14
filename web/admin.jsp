<%-- 
    Document   : profile
    Created on : Apr 22, 2014, 4:58:16 PM
    Author     : jimivine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

    <head>
        <title>Alumni - Home Page v3</title>
        <script src="js/formatdate.js" type="text/javascript"></script>
        <link href="style2.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/knockout-3.1.0.js"></script>
        <script src="js/profile.js"></script>
    </head>



    <body> 


        <!--
        ****************************************************
        *                      Header                      *
        ****************************************************
        -->		 
        <div id="header" style="opacity: 1">
            <a href="index.jsp">
                <img id="logo" src="Images/Logo.png" alt="Alumni logo"/>
            </a>
            <div id="todays_date" data-bind="text: date"></div>
            <div id="time_now" data-bind="html: currentTime"></div>
        </div>

        <!--
        ****************************************************
        *                   Main Body                      *
        ****************************************************
        -->

        <div id="maincontainer">
            <div id="alumni">
                <img src="Images/Alumni_big.png" alt="Alumni"/>
            </div>           
            <div id="welcome">
                Welcome to Alumni
            </div>
            <div id="name" data-bind="text: username">
            </div>

        </div>

        <!--
        ****************************************************
        *                     Footer                       *
        ****************************************************
        -->
        <div id="footer">
            <section class="tabs">            
                <div class="buffer3"></div>
                <span class="anchor" id="msg"></span>
                <div class="panel">
                    <a class="tab-link" href="#msg">
                        <img src="Images/Msg.png" alt="Messages"/>
                        <h1>MESSAGES</h1>
                        <h1 class="blank">blank</h1>
                        <p>Read your messages, send messages and accept invites</p>
                    </a>                    
                    <div class="labels1"> 
                        <article>
                            <h4 id="msg-ul">MESSAGES</h4>
                            <p>Please complete the form with a username and password between 
                                8 and 20 characters long. Your username should be the name 
                                your friends recognise you by.</p>

                            <p>Once you've successfully created an account you can set up a 
                                profile, find friends and start getting in touch!</p>
                        </article>                   
                        <img src="Images/Msg_big.png" alt="Join"/>
                    </div>
                </div>
                                  
                <div class="buffer3"></div>
                <span class="anchor" id="logout"></span>
                <div class="panel">
                    <a href="#" onclick="location.href='@Url.Action("ActionName")'">
                    <a class="tab-link" href="#" onclick="location.href='LogoutController'">
                        <img src="Images/Logout.png" alt="Logout"/>
                        <h2>LOGOUT</h2>
                    </a>
                    <div class="labels1"> 
                        <article>
                            <h4 id='logout-ul'>LOGOUT</h4>
                            <p>Alumni helps you keep in touch with your friends from 
                                university. It's the best way to find out what's going on 
                                and share instantly what's on your mind.</p>

                            <p>Alumni is a free service. You sign up, login, build a profile, 
                                find your friends and then you are ready to become an 
                                active member of Alumni, the latest in social networking 
                                for students.</p>
                        </article> 

                        <img src="Images/Logout_big.png" alt="Logout"/>
                    </div>
                </div>                    
            </section>            
            <div class="buffer2"></div>
        </div>
        <script>
            $(function() {
                myApp.vm = new myApp.ProfileViewModel();
                ko.applyBindings(myApp.vm);
                myApp.vm.username(window.location.search.split("=")[1]);
//* this gets username from the URL and binds it to the viewmodel in profile.jsp
            });
        </script>
    </body>
</html>


