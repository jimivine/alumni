<%-- 
    Document   : test
    Created on : 26-Apr-2014, 23:25:27
    Author     : Brother Arnold
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

            <div class="large_text">Login</div>
            <div class="medium_text">
                <form name="login" id="login-form" method="post" action="AddStudentController" onsubmit="return validate_login();">
                    Username
                    <input name="user" type="text" placeholder=" Username" value="" id="user" />					
                    Password
                    <input name="pword" type="password" placeholder=" Password" value="" id="pword" />
                    <input class="button-link" type="submit" name="submit" tabindex="3" value="Login" />
                    <a href="profile2.html" target="_blank" style="text-decoration:underline;color:white;font-weight:normal">Forgotten password?</a>
                </form>
            </div>

    </body>
</html>
