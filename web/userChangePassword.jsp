<%-- 
    Document   : userChangePassword
    Created on : Nov 2, 2019, 1:54:06 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <style>
            .caret{
                display: none !important;
            }
        </style>
        <script>
            function change()
            {
                var username=document.getElementById("username").value;
                var oldpassword=document.getElementById("oldpass").value;
                var newpassword=document.getElementById("newpass").value;
                var confirmpassword=document.getElementById("confirmpass").value;
                if(oldpassword==""||newpassword==""||confirmpassword=="")
                {
                    alert("All Fields Must Be filled");
                }
                else if(newpassword!=confirmpassword)
                {
                    alert("New Password and Confirm Password Must Be the Same");
                }
                else
                {
                 var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        if(res=="success")
                        {
                            document.getElementById("oldpass").value="";
                                    document.getElementById("newpass").value="";
                                    document.getElementById("confirmpass").value="";
                            
                            document.getElementById("msg").innerHTML="Your Password is Changed. Now You Can Login with Your New Password.";
                            setInterval(gouser,4000);
                        }
                        else
                            (
                                alert("Invalid Old Password"));
                    }
                };
                xmlhttp.open("GET","./userChangePasswordResponse?username="+username+"&oldpass="+oldpassword+"&newpass="+newpassword,true);
                xmlhttp.send();
            }
        }
        function gouser(){
                   window.location.href="userSignup.jsp";

            }
        </script>
    </head>
    <body>
        <%@include file="UserHeader.jsp" %>
        <% String username=session.getAttribute("username").toString(); %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
            <h1>Change Password</h1><br/>
        <div>
                                    <form>
                                        <table class="table table-bordered">
                                            <tr>
                                    
                                                <td> <label for="username">Username: </label></td>
                                            <td> <input type="text" id="username" name="username" value="<%= username %>" readonly="" class="form-control"</input></td>
                                            </tr>  
                                            <tr>
                                                <td><label for="oldpass">Enter Old Password</label></td>
                                                <td><input type="password" id="oldpass" name="oldpass" class="form-control"></td>
                                            </tr>  
                                            <tr>
                                                <td><label for="newpass">Enter New Password</label></td>
                                                <td><input type="password" id="newpass" name="newpass" class="form-control"></td>
                                            </tr>  
                                            <tr>
                                                <td><label for="confirmpass">Confirm Password</label></td>
                                                <td><input type="password" id="confirmpass" class="form-control"></td> 
                                            </tr> 
                                            <tr>
                                                <td></td>
                                                <td><button type="button" class="btn btn-primary" onclick="change()">Change</button></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                        <div id="msg"></div>
                                        </div>
            </div>
        </div>
    </body>
</html>
