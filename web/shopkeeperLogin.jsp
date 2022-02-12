<%-- 
    Document   : shopkeeperLogin
    Created on : Oct 29, 2019, 1:33:57 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            .caret{
                display: none !important;
            }
        </style>
        <script>
            function login()
            {
                var emailid=document.getElementById("emailid").value;
                var password=document.getElementById("pass").value;
                
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        //alert(res);
                        if(res=="success")
                        {
                          window.location.href="shopkeeperHome.jsp";
                        }
                        else if(res=="fail")
                        {
                            document.getElementById("invalid").innerHTML="Invalid Email/Id or Invalid Password";
                        }
                        else if(res=="pending")
                        {
                            document.getElementById("invalid").innerHTML="Your account has NOT yet been approved by the admin. As soon as your account is approved,you will be sent an sms on your phone.";
                        }
                    }
                };
                xmlhttp.open("GET","./shopkeeperLoginResponse?emailid="+emailid+"&password="+password,true);
                xmlhttp.send();
            }
            function go11()
            {
                window.location.href="shopkeeperForgotPassword.jsp";
            }
        </script>
    </head>
    <body>
        <%@include file="publicheader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Login Form</h2>
                    <form>
                        <table class="table table-bordered">
                            <tr>
                                <td><label for="emailid" >Enter Email or Id</label> </td>
                                <td><input type="text" id="emailid" name="emailid" placeholder="Enter Email or Id" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="pass" > Enter password</label></td>
                                <td><input type="password" id="pass" name="pass" placeholder="Enter Password" class="form-control"/></td>
                            </tr>
                           
                                <td></td>
                                <td><input type="button" id="button" value="Login" class="btn btn-success" onclick="login()"/></td>
                            </tr>
                        </table>
                          
                            
                    </form>
                    
                    
                </div>
            </div>
            
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h6 class="text-center" id="invalid" style="color: red"></h6>
                </div>
            </div>
        </div><br/>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <button class="offset-md-5 col-md-2 btn btn-primary"  type="button" onclick="go11()">Forgot Password</button>
                </div>
            </div>
        </div>
        <br>
        
        
        
    </body>
</html>
