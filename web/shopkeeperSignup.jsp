<%-- 
    Document   : shopkeeperSignup
    Created on : Oct 25, 2019, 11:01:42 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .caret{
                display: none !important;
            }
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script>
            function readandpreview(fileobj,imageid)
            {
                var firstfile = fileobj.files[0];
                var reader = new FileReader();
                reader.onload = (function(f)
                {
                  return function read(e)
                  {
                      document.getElementById(imageid).src = e.target.result;
                  }
                })(firstfile);
                reader.readAsDataURL(firstfile);
            }
            function signup()
            {
                var name = document.getElementById("name").value;
                var shopname = document.getElementById("shopname").value;
                var phoneno = document.getElementById("phoneno").value;
                var email = document.getElementById("emailid").value;
                var websitename = document.getElementById("websitename").value;
                var securityQuestion = document.getElementById("securityQuestion").value;
                var securityAnswer = document.getElementById("securityAnswer").value;
                var pass = document.getElementById("pass").value;
                var confpass = document.getElementById("confpass").value;
                var city=document.getElementById("city").value;
                var address=document.getElementById("address").value;
                 var img=document.getElementById("photo").files.length;
                 var i;
                 var ch;
                 var cha;
                 var chdot;
                 var ia=-1;
                 var idot=-1;
                 for (i=0;i<email.length;i++)
                 {
                     ch=email.charAt(i);
                     if(ch=='@')
                     {
                         cha=ch;
                         ia=i;
                     }
                     if(ch=='.')
                     {
                         chdot=ch;
                         idot=i;
                     }
                 }
                
                
                if(name==""|| shopname==""|| phoneno=="" || email=="" || websitename=="" || securityAnswer=="" || pass=="" || confpass=="" ||  address=="" || img==0)
                {
                   // alert(name+" "+shopname+" "+phoneno+" "+email+" "+websitename+" "+pass+" "+confpass+" "+address+" "+img);
                    alert("All fields are mandatory");
                }
                else if(isNaN(phoneno))
                {
                    alert("Phone no should only contain digits");
                }
                else if(phoneno.length!=10)
                {
                    alert("Phone no should be 10 digits");
                } 
                
                 else if(ia==-1||idot==-1||ia<idot!=true)
                {
                    alert("Enter valid email id");
                }
                else if(pass != confpass)
                {
                    alert("Password and Confirm Password not matched");
                }
                
               
                
               else
                {
                    var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("form1").elements;
                var flag = 0;
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }
                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length > 0)
                        {
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    }
                 
                    else
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {
                    var xhr = new XMLHttpRequest;
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText.trim();
                            if (res!="success")
                            {
                                document.getElementById("error").innerHTML = "<div class=\"alert alert-danger\"> Signup Failed</div>";
                            } else
                            {
                                document.getElementById("name").value = "";
                                document.getElementById("shopname").value = "";
                                document.getElementById("phoneno").value = "";
                                

                                document.getElementById("emailid").value = "";
                                document.getElementById("websitename").value = "";
                                document.getElementById("securityAnswer").value = "";
                                document.getElementById("pass").value = "";
                                document.getElementById("confpass").value = "";
                                document.getElementById("address").value = "";
                                
                                document.getElementById("photo").value = "";
                                document.getElementById("image").src = "";
                                alert("Signup Successful");
                                document.getElementById("error").innerHTML = "<div class=\"alert alert-success\">Sign Up Successful. Now You Can Login With Your New Password</div><br>\n";
                                setInterval(now,4000);
                            }
                        }
                    };
                    xhr.open("POST", "./shopkeeperSignupResponse", true);
                    xhr.send(formdata);
                }
                }
                
                
            }
            function now()
            {
                window.location.href="shopkeeperLogin.jsp";
            }
        
            </script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="publicheader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Signup Form</h2>
                    <form id="form1">
                        <table class="table table-bordered">
                            <tr>
                                <td><label for="name"> Enter Name</label> </td>
                                <td><input type="text" id="name" name="name" placeholder="Enter Name" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="shopname"> Enter Shop's Name</label></td>
                                <td><input type="text" id="shopname" name="shopname" placeholder="Enter Your Shop's Name" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="phoneno"> Enter Phone Number</label></td>
                                <td><input type="text" id="phoneno" name="phoneno" placeholder="Enter Phone Number" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="emailid"> Enter Email</label></td>
                                <td><input type="email" id="emailid" name="emailid" placeholder="Enter Email" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="websitename"> Enter Website Name</label></td>
                                <td><input type="text" id="websitename" name="websitename" placeholder="Enter Website Name" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="securityQuestion"> Select Security Question</label></td>
                                <td><select id="securityQuestion" name="securityQuestion"    class="form-control">
                                        <option >What is the name of your first best friend?</option>
                                        <option >What is the name of your first pet?</option>
                                        <option >What is your maiden name?</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><label for="securityAnswer"> Enter Your Security Answer</label></td>
                                <td><input type="text" id="securityAnswer" name="securityAnswer" placeholder="Enter Your Security Answer" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="pass"> Enter Password</label></td>
                                <td><input type="password" id="pass" name="pass" placeholder="Enter Password" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="confpass"> Enter Confirm Password</label></td>
                                <td><input type="password" id="confpass" name="confpass" placeholder="Enter Same Password Again to Confirm" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><label for="city"> Enter City</label></td>
                                <td><select id="city" name="city"    class="form-control">
                                        <option >Amritsar</option>
                                        <option >Moga</option>
                                        <option >Jalandhar</option>
                                        <option >Lucknow</option>
                                        <option >Delhi</option>
                                        <option >Bangalore</option>
                                        <option >Hyderabad</option>
                                        <option >Ahmedabad</option>
                                        <option >Chennai</option>
                                        <option >Kolkata</option>
                                        <option >Surat</option>
                                        <option >Pune</option>
                                        <option >Jaipur</option>
                                        <option >Jalandhar</option>
                                        <option >Mumbai</option>
                                    </select></td>
                                
                            </tr>
                            <tr>
                                <td><label for="address"> Enter Address of Your Shop</label></td>
                                
                                <td><textarea  id="address" name="address" placeholder="Enter Address of Your Shop" class="form-control"></textarea></td>
                            </tr>
                            
                            <tr>
                                <td><label for="photo">Photo</label></td>
                                <td> <input type="file" id="photo" onchange="readandpreview(this,'image')" name="photo" /></br>
                                <img src="" id="image" name="image" height="60" width="60" /></td>
                            </tr>
                                <td></td>
                                <td><input type="button" id="button" name="button" value="Signup" class="btn btn-success" onclick="signup()"/></td>
                            </tr>
                            
                        </table>
                        <div id="error"></div>
                    </form>
                </div>
            </div>
            
        </div>
    </body>
</html>
