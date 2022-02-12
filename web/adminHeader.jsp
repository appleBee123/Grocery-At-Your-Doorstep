<%-- 
    Document   : publicheader
    Created on : Nov 4, 2019, 11:39:59 AM
    Author     : lenovo
--%>

        <!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              rel="stylesheet" type="text/css" />
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
         <% String username=session.getAttribute("admin").toString(); %>
        <script>
//            function go()
//            {
//              var product = document.getElementById("Product").value;
//              var xmlhttp = new XMLHttpRequest();
//              xmlhttp.onreadystatechange = function()
//              {
//                  if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
//                  {
//                      var result = xmlhttp.responseText.trim();
//                      if(result=="failed")
//                      {
//                         continue;
//                      }
//                      else
//                      {
//                          document.getElementById("div1").innerHTML = result;
//                      }
//                  }
//              };
//              xmlhttp.open("GET","./searchResponse?product=" + product,true);
//              xmlhttp.send();
//            }
             function checkc()
            {
                var username=document.getElementById("userc").value;
                var oldpassword=document.getElementById("oldpassc").value;
                var newpassword=document.getElementById("newpassc").value;
                var confirmpassword=document.getElementById("confirmpassc").value;
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
                            
                document.getElementById("oldpassc").value="";
                document.getElementById("newpassc").value="";
                document.getElementById("confirmpassc").value="";
                            document.getElementById("msgc").innerHTML="Your Password is Changed. Now You Can Login with Your New Password.";
                            setInterval(gotologin,4000);
                        }
                        else
                            (
                                alert("Invalid Old Password"));
                    }
                };
                xmlhttp.open("GET","./adminChangePasswordResponse?user="+username+"&oldpass="+oldpassword+"&newpass="+newpassword,true);
                xmlhttp.send();
            }
            function gotologin(){
                   window.location.href="adminLogin.jsp";

            }
        }
            </script>
    </head>
    <body>
        <!--<nav class="navbar navbar-expand-md bg-dark navbar-dark">-->
        <nav style="position: sticky; top: 0px;"class="navbar navbar-expand-md bg-light  navbar-light">
        <!--<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">-->
        <!--<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-bottom">-->
        <!--<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">-->
            <a  class="navbar-brand">Grocery At Your Doorstep</a>
            <button type="button" class="navbar-toggler" data-toggle="collapse"
                    data-target="#menubar1">
                <span class="navbar-toggler-icon"></span>          
            </button>
            <div class="collapse navbar-collapse" id="menubar1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="adminHome.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#changePasswordModal">Change Password</a></li>
                   
                    <li class="nav-item"><a class="nav-link" href="manageShopkeepers.jsp">Manage Shopkeepers </a></li>
                    <li class="nav-item"><a class="nav-link" href="manageCategories.jsp">Manage Categories</a></li>
                    <li class="nav-item"><a class="nav-link" href="AdminLogout.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>
        <div class="modal fade" id="changePasswordModal" role="dialog" style="z-index: 500000000000000000; ">
                        <div class="modal-dialog">
                            <!--Modal Content-->
                            <div class="modal-content">
                                <!--Modal Header-->
                                <div class="modal-header">
                                    <h4 class="modal-title">Change Password</h4>
                                    <button type="button" class="close" data-dismiss="modal">x</button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="userc">Username: </label><br/>
                                            <input type="text" id="userc" name="user" value="<%= username %>" readonly="" class="form-control"></input>
                                        </div>   
                                        <div class="form-group">
                                            <label for="oldpassc">Enter Old Password</label>
                                            <input type="password" id="oldpassc" name="oldpass" class="form-control"> 
                                        </div>  
                                        <div class="form-group">
                                            <label for="newpassc">Enter New Password</label>
                                            <input type="password" id="newpassc" name="newpass" class="form-control"> 
                                        </div>  
                                        <div class="form-group">
                                            <label for="confirmpassc">Confirm Password</label>
                                            <input type="password" id="confirmpassc" class="form-control"> 
                                        </div>  
                                        <div id="msgc"></div>
                                        <button type="button" class="btn btn-primary" onclick="checkc()">Change</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" 
                                            data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>