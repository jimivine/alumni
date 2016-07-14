<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

    <head>
        <title>Alumni - Home Page</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="keywords" content="Alumni" /> 
	<meta name="description" content="Welcome to Alumni." /> 
	<meta name="Author" content="James Vine" />
        <link href="style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/formatdate.js" type="text/javascript"></script>
        <script src="js/jquery.js"></script>
        <script src="js/knockout-3.1.0.js"></script>
        <script src="js/login.js"></script>
    </head>

    <body> 


        <!--
        ****************************************************
        *                      Header                      *
        ****************************************************
        -->		 
        <div id="header">
            <a href="#">
                <img id="logo" src="Images/Logo.png" alt="Alumni logo"/>
            </a>
            <div id="todays_date" data-bind="text: date"></div>
            <div id="time_now" data-bind="html: currentTime"></div>
        </div>

        <div class="vbuffer1"></div>
        <!--
        ****************************************************
        *               Background Transition              *
        ****************************************************
        -->
        <div id="bg_transition">
            <img src="Images/ARU_short.jpg" alt="ARU"/>
            <img src="Images/Bradford_short.jpg" alt="Bradford"/>
            <img src="Images/Brum_short.jpg" alt="Birmingham"/>
            <img src="Images/Cardiff_short.jpg" alt="Cardiff"/>
            <img src="Images/Lampeter_short.jpg" alt="Lampeter"/>
            <img src="Images/Soton_short.jpg" alt="Southampton"/>
        </div>


        <!--
        ****************************************************
        *                     Login Bar                    *
        ****************************************************
        -->
        <div id="login">
            <div class="large_text">Login</div>
            <div class="medium_text">
                <form id="login-form">
                    Username
                    <input name="username" id="username" data-bind="value: username" type="text" placeholder=" Username" tabindex="1" value="" />					
                    Password
                    <input name="password" id="password" data-bind="value: password" type="password" placeholder=" Password" tabindex="2" value="" />
                    <input class="button-link" name="submit" type="button" onclick="myApp.getLogin()" tabindex="3" value="Login" />
                    <a href="mailto:jimivine@gmail.com?Subject=Forgotten%20Alumni%20Password" target="_top" tabindex="4" 
                       style="text-decoration:underline;color:white;font-weight:normal">
                        Forgotten password?
                    </a>
                </form>
            </div>
        </div>

        <!--
        ****************************************************
        *                     Footer                       *
        ****************************************************
        -->
        <div id="footer">
            <section class="tabs">            
                <div class="buffer1"></div>
                <span class="anchor" id="about"></span>
                <div class="panel">
                    <a class="tab-link" href="#about">
                        <img src="Images/About.png" alt="About"/>
                        <h1>ABOUT ALUMNI</h1>
                        <p>Find out about our free service and how to keep in touch with your friends</p>
                    </a>
                    <div class="labels1"> 
                        <article>
                            <h4 id='about-ul'>ABOUT ALUMNI</h4>
                            <p>Alumni helps you keep in touch with your friends from 
                                university. It's the best way to find out what's going on 
                                and share instantly what's on your mind.</p>

                            <p>Alumni is a free service. You sign up, login, build a profile, 
                                find your friends and then you are ready to become an 
                                active member of Alumni, the latest in social networking 
                                for students.</p>
                        </article> 
                        <img src="Images/About_big.png" alt="About"/>
                    </div>
                </div>                    
                <div class="buffer2"></div>
                <span class="anchor" id="join"></span>
                <div class="panel">
                    <a class="tab-link" href="#join">
                        <img src="Images/Join.png" alt="Join"/>
                        <h1>JOIN ALUMNI</h1>
                        <p>Join up to the fastest growing network for students on the internet and it's free!</p>
                    </a>                    
                    <div class="labels1"> 
                        <article>
                            <h4 id='join-ul'>JOIN ALUMNI</h4>
                            <p>Please complete the form with a username and password between 
                                8 and 20 characters long. Your username should be the name 
                                your friends recognise you by.</p>

                            <p>Once you've successfully created an account you can set up a 
                                profile, find friends and start getting in touch!</p>
                        </article>
                        <article class="signup">
                            <img src="Images/Join_big.png" alt="Join"/>
                            <form name="joinus" id="joinus-form"> 
                                <h2>Create an account</h2>
                                <h4>Your username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Full name</h4>
                                <input name="newUsername" id="newUsername" type="text" placeholder="Username" data-bind="value: newUsername"/>
                                <input name="newFullname" id="newFullname" type="text" placeholder="Full name" data-bind="value: newFullname"/>
                                <h4>Your email</h4>
                                <input name="newEmail" type="text" placeholder="Email address" data-bind="value: newEmail"/>
                                <h4>Your password</h4>
                                <input name="newPassword" id="newPassword" type="password" placeholder="Password" data-bind="value: newPassword"/>
                                <h4>Please confirm your password</h4>
                                <input name="newConfirm" type="password" placeholder="Re-enter password" data-bind="value: newConfirm"/>
                                <h4></h4>   
                                <input name="newCheck" type="checkbox" data-bind="checked: newCheck"/>                
                                I agree with the <a href="#" onclick="return displayTandC();" style="text-decoration:underline;color:#164f7d;font-weight:bold">terms and conditions</a>
                                <h4></h4> 
                                <input name="newSubmit" class="button-link2" type="button" onclick="myApp.checkDetails()" value="Sign Up"/>
                                <h4></h4> 
                            </form>
                        </article>                        
                    </div>
                </div>
                <div class="buffer2"></div>                 
                <span class="anchor" id="roll"></span>
                <div class="panel">
                    <a class="tab-link" href="#roll">
                        <img class="icon" src="Images/Roll.png" alt="Roll"/>
                        <h1>ROLL OF HONOUR</h1>
                        <p>See which universities we have on-line. If you can't find yours be the first to join</p>
                    </a>                    
                    <div class="labels1"><article>
                        <h4 id='roll-ul'>ROLL OF HONOUR</h4></article>                        
                        <article id="uniroll">
                            <ul data-bind="foreach: university">
                                <li data-bind="text: university"></li>
                            </ul>
                        </article>
                        <img src="Images/Roll_big.png" alt="Roll"/>
                    </div>
                </div>            
                <div class="buffer1"></div>
            </section>            
        </div>
        <script>
            $(function() {
                myApp.vm = new myApp.LoginViewModel();
                ko.applyBindings(myApp.vm);
            });
        </script>
    </body>
</html>
