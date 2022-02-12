<%-- 
    Document   : shopkeeperForgotPassword
    Created on : Oct 30, 2019, 11:13:46 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .caret{
                display: none !important;
            }
        </style>
        <title>JSP Page</title>
        <script>
            function hideDiv()
            {
                document.getElementById("securityQuestionDiv").style.display="none";
            }
            function submitGo()
            {
                 var username=document.getElementById("username").value;
                
                
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        //alert(res);
                        if(res=="fail")
                        {
                          document.getElementById("invalid").innerHTML="Invalid Username";
                        }
                        else 
                        {
                          document.getElementById("securityQuestionDiv").style.display="block";
                          document.getElementById("securityQuestion").value=res;
                          
                          document.getElementById("securityAnswer").focus();
                        }
                       
                    }
                };
                xmlhttp.open("GET","./userForgotPasswordResponse?username="+username,true);
                xmlhttp.send();
            }
            function submitGo2()
            {
                var username=document.getElementById("username").value;
                var securityAnswer=document.getElementById("securityAnswer").value;
                
                
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        //alert(res);
                        if(res=="fail")
                        {
                          document.getElementById("invalid").innerHTML="Invalid Security Answer";
                        }
                        else 
                        {
                        alert("Success");
                        }
                       
                    }
                };
                xmlhttp.open("GET","./userForgotPasswordResponse2?username="+username+"&securityAnswer="+securityAnswer,true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body onload="hideDiv()">
        <%@include file="publicheader.jsp" %>
        <br/>
         <div class="container">
            <div class="row">
                <div class="col-md-12">
                    
                    <form>
                        <table class="table table-bordered">
                            <tr>
                                <td><label for="username" >Enter Username</label> </td>
                                <td><input type="text" id="username" name="username" placeholder="Enter Username" class="form-control"/></td>
                            </tr>
                           
                           
                                <td></td>
                                <td><input type="button" id="button" value="Submit" class="btn btn-success" onclick="submitGo()"/></td>
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
        <br/>
         <div class="container" id="securityQuestionDiv"  >
            <div class="row">
                <div class="col-md-12">
                    
                    <form>
                        <table class="table table-bordered">
                            <tr>
                                <td><label for="securityQuestion" >Your Security Question</label> </td>
                                <td><input type="text" id="securityQuestion" name="securityQuestion" readonly class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="securityAnswer" >Enter Your Security Answer</label> </td>
                                <td><input type="text" id="securityAnswer" name="securityAnswer"  class="form-control"/></td>
                            </tr>
                           
                           
                                <td></td>
                                <td><input type="button" id="button" value="Submit" class="btn btn-success" onclick="submitGo2()"/></td>
                            </tr>
                        </table>
                        
                    </form>
                    
                    
                </div>
            </div>
            
        </div>
    </body>
</html>
