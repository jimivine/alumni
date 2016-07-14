<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

    <head>
        <title>Alumni - Profile Page v3</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="keywords" content="Alumni" /> 
	<meta name="description" content="Welcome to Alumni." /> 
	<meta name="Author" content="James Vine" />
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
                <div class="buffer2"></div>
                <span class="anchor" id="findf"></span>
                <div class="panel">
                    <a class="tab-link" href="#findf">
                        <img src="Images/FindF.png" alt="Find Friends"/>
                        <h1>FIND</h1>
                        <h1>FRIENDS</h1>
                        <p>View friends profiles and invite them to connect with you</p>
                    </a>
                    <div class="labels1"> 
                        <article>
                            <h4 id="findf-ul">FIND FRIENDS</h4>
                        </article>
                        <article class="findfriends">
                            <form>
                                <h3>Enter name</h3>
                                <input name="findname" type="text" placeholder="Name" data-bind="value: findname"/>
                                <input name="search" class="button-link2" type="button" onclick="myApp.checkSearch()" value="Search"/>
                            </form>
                        </article>
                        <article id="invite" class="msgfriends">
                            <h3>Enter message</h3>
                            <input name="message" type="text" placeholder="Message" size="250" style="width:280px;height:90px;margin-bottom:10px" value=""/>
                            <h3></h3>
                            <a class="button-link2" href="#" onclick="myApp.addFriend()">Send Invite</a>
                        </article>                         
                        <article class="results">
                            <section id="results_img">
                                <img class="mypic" src="Images/Sample1.jpg" alt="Friend"/>
                            </section>
                            <section class="results_text">
                                <h3 id="name_of_friend_found" data-bind="text: f_full_name"></h3>
                                <h4 id="uni_of_friend_found" data-bind="text: f_uni_name"></h4>
                                <h4 id="studies_of_friend_found" data-bind="text: f_course"></h4>
                                <h4 id="year_of_friend_found" data-bind="text: f_years"></h4>
                                <p id="status_of_friend_found" data-bind="text: f_status"></p> 
                            </section>
                        </article>             

                        <img src="Images/FindF_big.png" alt="About"/>                       
                    </div>
                </div>
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
                                <!-- Folders -->
                                <ul class="folders" data-bind="foreach: folders">
                                    <li data-bind="text: $data, 
                                        css: { selected: $data == $root.chosenFolderId() },
                                        click: $root.goToFolder"></li>
                                </ul>
                                <!-- Mails grid -->
                                <table class="mails" data-bind="with: chosenFolderData">
                                    <thead><tr><th>From</th><th>To</th><th>Subject</th><th>Date</th></tr></thead>
                                    <tbody data-bind="foreach: mails">
                                        <tr>
                                            <td data-bind="text: from"></td>
                                            <td data-bind="text: to"></td>
                                            <td data-bind="text: subject"></td>
                                            <td data-bind="text: date"></td>
                                        </tr>     
                                    </tbody>
                                </table>
                        </article>                   
                        <img src="Images/Msg_big.png" alt="Join"/>
                    </div>
                </div>
                <div class="buffer3"></div>
                <span class="anchor" id="view"></span>
                <div class="panel">
                    <a class="tab-link" onclick="myApp.viewProfile()" href="#view">
                        <img src="Images/Profile.png" alt="View Profile"/>
                        <h1>VIEW</h1>
                        <h1>PROFILE</h1>
                        <p>Check out your profile page and what your friends are doing</p>
                    </a>
                    <div class="labels1"> 
                        <article class="myprofile">
                            <h4 class="profile-ul">PROFILE</h4>
                            <div id="myprofilepic">
                                <img class="mypic" src="Images/Sample1.jpg" alt="Sample"/>
                            </div>
                            <div id="myname">
                                <h2 data-bind="text: full_name"></h2>
                            </div>
                            <div id="myuni_and_year">
                                <h3 data-bind="text: uniyears"></h3>
                            </div>
                            <div id="mycourse">
                                <h3 data-bind="text: course"></h3>
                            </div>
                            <div id="mystatus">
                                <h3 data-bind="text: status"></h3>
                            </div>
                            <h4 id="header2">MY FRIENDS</h4>
                            <div id="myfriends">
                                <ul data-bind="foreach: friend">
                                    <li data-bind="text: friend"></li>
                                </ul>
                            </div>
                        </article>
                        <img src="Images/Profile_big.png" alt="Profile"/>
                    </div>
                </div>                    
                <div class="buffer3"></div>                 
                <span class="anchor" id="upd"></span>
                <div class="panel">
                    <a class="tab-link" href="#upd" onclick="myApp.fillProfileForm()">
                        <img src="Images/UpdProf.png" alt="Update Profile"/>
                        <h1>UPDATE</h1>
                        <h1>PROFILE</h1>
                        <p>Change your profile picture and update your status</p>
                    </a>                    
                    <div class="labels1">
                        <article><h4 id="upd-ul">UPDATE PROFILE</h4></article>                        
                        <article class="update_profile">

                            <form>
                                <input name="user_name" type="hidden" data-bind="text: username"/>
                                <h2>Update Profile Details</h2>
                                <h4>Enter Full Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter University</h4>
                                <input name="full_name" type="text" placeholder="Full Name" data-bind="value: updFullname"/>
                                <input name="uni" type="text" placeholder="University" data-bind="value: updUni"/>
                                <h4>Enter years there&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter course studied</h4>
                                <input name="years" type="text" placeholder="Years from - to" data-bind="value: updYears"/>
                                <input name="course" type="text" placeholder="Course" data-bind="value: updCourse"/>
                                <h4>Enter status</h4>     
                                <textarea name="status" placeholder="Status" rows="4" cols="50" maxlength="250" style="width:365px;height:90px;margin-bottom:10px" data-bind="value: updStatus"></textarea>
                                <br/>
                                <input name="updSubmit" class="button-link2" type="button" onclick="myApp.updProfile()" value="Update Profile"/>
                                <br/><br/>
                            </form>
                        </article>
                        <img id="updprofimg" src="Images/UpdProf_big.png" alt="Update Profile"/>
                    </div>
                </div>                
                <div class="buffer3"></div>
                <span class="anchor" id="findu"></span>
                <div class="panel">
                    <a class="tab-link" href="#findu">
                        <img src="Images/FindU.png" alt="Find University"/>
                        <h1>FIND</h1>
                        <h1>UNIVERSITY</h1>
                        <p>Find details about a university. If you can't find it let us know</p>
                    </a>
                    <div class="labels1">
                        <article>
                            <h4 id='findu-ul'>FIND UNIVERSITY</h4> 
                            <p>Click on a university to find out more about it.</p>
                        </article>
                        <article id="uniroll">
                            <ul data-bind="foreach: university">
                                <li> <a data-bind="text: name, attr: { href: href}"></a> </li>
                            </ul>
                        </article>
                        <article class="uniselect">
                            <section class="uni_text">
                                <h3 id="name_of_uni">Name of University</h3>
                                <h4 id="address of uni">Address of University</h4>
                                <h4 id="web address of uni">Web Address of University</h4>
                            </section>
                        </article>
                        <img src="Images/FindU_big.png" alt="About"/>
                    </div>
                </div>                    
                <div class="buffer3"></div>
                <span class="anchor" id="logout"></span>
                <div class="panel">
                    <a class="tab-link" href="logout.jsp">
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
        <div id="invite" class="msgfriends">
            <h3>Enter message</h3>
            <input name="message" type="text" placeholder="Message" size="250" style="width:280px;height:90px;margin-bottom:10px" value=""/>
            <h3></h3>
            <a class="button-link2" href="" target="_blank">Send Invite</a>
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


