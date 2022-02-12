<%-- 
    Document   : adminLogin
    Created on : Oct 22, 2019, 11:33:47 AM
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
            function login()
            {
                var username=document.getElementById("user").value;
                var password=document.getElementById("pass").value;
                
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        if(res=="success")
                        {
                          window.location.href="adminHome.jsp";
                        }
                        else
                        {
                            document.getElementById("invalid").innerHTML="Invalid Username or Password";
                        }
                    }
                };
                xmlhttp.open("GET","./ResponseAdminLogin?user="+username+"&pass="+password,true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body>
        <br><br><br><br><br>
       
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Login Form</h2>
                    <form>
                        <table class="table table-bordered">
                            <tr>
                                <td><label for="user" >Enter Username</label> </td>
                                <td><input type="text" id="user" name="user" placeholder="Enter Username" class="form-control"/></td>
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
        </div>
        
    </body>
</html>
