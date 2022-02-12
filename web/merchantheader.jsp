<%-- 
    Document   : publicheader
    Created on : Nov 4, 2019, 11:39:59 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Grocery Store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- font-awesome icons -->
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" /> 
        <!-- //font-awesome icons -->
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            .modal-backdrop.show {
                opacity: 0;
            }
            .logo_products {
    padding: 0em 0 1em;
}
/*             #divresp{
                margin-top: 4%;
                background-color: wheat;
            }*/
        </style>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
                                        <% int id=Integer.parseInt( session.getAttribute("id").toString()); %>
function gotodetails(pid){
    window.location.href="productdetail.jsp?pid="+pid;
}
             function gosearch(obj)
            {
                
              var key = document.getElementById("Product1").value;
              var xmlhttp = new XMLHttpRequest();
              xmlhttp.onreadystatechange = function()
              {
                  if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                  {
                     var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        jsonar = mainjson["ans"];
                        if (jsonar.length == 0)
                        {
//                            continue;
                        } else
                        {
                            var tab = "<div style='width: 253px'>";
                           
                            for (var i = 0; i < jsonar.length; i++)
                            {
                                var productobj = jsonar[i];
                                product =  productobj.productname;
                             var   pid = productobj.productid;
                                tab += "<label onclick=\"gotodetails("+pid+")\">"+product+"</label><br>";
    
                                
                            }
                            tab += "</div>";
                            tab +=" ";
                            document.getElementById("divresp").innerHTML = tab;
                        }
                    }
              };
              xmlhttp.open("GET","./searchResponse?key="+key,true);
              xmlhttp.send();
            }

 function changec()
            {
                var shopkeeperid=document.getElementById("idc").value;
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
                            document.getElementById("msgc").innerHTML="Your Password is Changed. Now You Can Login with Your New Password.";
                            setInterval(gotologin,4000);
                        }
                        else
                            (
                                alert("Invalid Old Password"));
                    }
                };
                xmlhttp.open("GET","./shopkeeperChangePasswordResponse?id="+shopkeeperid+"&oldpass="+oldpassword+"&newpass="+newpassword,true);
                xmlhttp.send();
            }
        }
        
        function gotologin(){
                   window.location.href="shopkeeperLogin.jsp";
            }
            
            function fetch(){
              document.getElementById("cityp").value='<%=session.getAttribute("city").toString()%>';
              document.getElementById("securityQuestionp").value='<%=session.getAttribute("securityquestion").toString()%>';
              var jsonarr;         
              var xmlhttp = new XMLHttpRequest();
                                  
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                          jsonarr = mainjson["ans"];
//                                alert(jsonarr.length);
                        if (jsonarr.length == 0)
                        {
                            alert("No photo found");
                        } else
                        {
                            document.getElementById("imaget").src=jsonarr[0].image;
                            
                            
                        }
                    }
                };
              
                xmlhttp.open("GET", "./fetchPhoto?id="+<%=id%>, true);
                xmlhttp.send();
          }
             function edit()
            {
//                fetch();
                var shopkeeperid=document.getElementById("idp").value;
                var name=document.getElementById("namep").value;
                var shopname=document.getElementById("shopnamep").value;
                var phoneno=document.getElementById("phonenop").value;
                var email=document.getElementById("emailp").value;
                var address=document.getElementById("addressp").value;
                var website=document.getElementById("websitep").value;
                var city=document.getElementById("cityp").value;
                var securityquestion=document.getElementById("securityQuestionp").value;
                var securityanswer=document.getElementById("securityAnswerp").value;
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
                if(name==""||shopname==""||phoneno==""||email==""||address==""||website==""||securityanswer=="")
                {
                    alert("All Fields Must Be filled");
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
                            document.getElementById("namep").value = "";
                                document.getElementById("shopnamep").value = "";
                                
                                document.getElementById("phonenop").value = "";
                                document.getElementById("emailp").value = "";
                                document.getElementById("addressp").value = "";
                                document.getElementById("websitep").value = "";
                                
                                document.getElementById("securityAnswerp").value = "";
                                
                            
                            document.getElementById("msgp").innerHTML="Your Profile is Edited Successfully.";
                            alert("Update Successful");
                            $("#editProfileModal").modal("hide");
                            
                        }
                        else
                        {
                                            
                
                document.getElementById("msgp").innerHTML="Your Profile Updation Failed.";
                    }
                }
                };
                xmlhttp.open("GET","./editProfileResponse?id2="+shopkeeperid+"&name="+name+"&shopname="+shopname+"&phoneno="+phoneno+"&email="+email+"&address="+address+"&website="+website+"&city="+city+"&securityQuestion="+securityquestion+"&securityAnswer="+securityanswer,true);
                xmlhttp.send();
            }
        }
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
            
            
              function change2()
            {
//                fetch();
                var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("formphoto").elements;
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
                    var xhr1 = new XMLHttpRequest;
                    xhr1.onreadystatechange = function ()
                    {
                        if (xhr1.readyState === 4 && xhr1.status == 200)
                        {
                            //get response from server
                            
                            var res1 = xhr1.responseText.trim();
                            //alert(res1);
                            if (res1 === "fail")
                            {
                                document.getElementById("msgt").innerHTML = "Update Failed";
                            } else
                            {

                                
                                alert("Update Successful");
                                document.getElementById("msgt").innerHTML = "Update Successful";
                                $("#editPhotoModal").modal("hide");
                                
                               
                                
                            }
                        }
                    };
                   
                    xhr1.open("POST", "./editPhotoResponse?id="+<%=id%>, true);
                    xhr1.send(formdata);
                }
            }
            
            
            
            
        </script>
 <% String name= session.getAttribute("name").toString(); %>
                    <% String shopname= session.getAttribute("shopname").toString(); %>
                    <% String phoneno= session.getAttribute("phoneno").toString(); %>
                    <% String email= session.getAttribute("email").toString(); %>
                    <% String address= session.getAttribute("address").toString(); %>
                    <% String website= session.getAttribute("website").toString(); %>
                    <% String city= session.getAttribute("city").toString(); %>
                    <% String securityquestion= session.getAttribute("securityquestion").toString(); %>
                   
                   
                    <% String securityanswer= session.getAttribute("securityanswer").toString(); %>
                    
        <!-- start-smoth-scrolling -->
    </head>

    <body onload="fetch()">
        <!-- header -->
<!--        <div class="agileits_header">
            <div class="w3l_offers">
                <a href="products.html">Today's special Offers !</a>
            </div>
            <div style="position: static;" class="w3l_search">
                <form action="#" method="post">
                    <input type="text" name="Product1" id="Product1" value="Search a product..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Search a product...';
                                        }" required="" onkeyup="gosearch(this)">
   <div style="position: absolute; z-index: 4;" id="divresp">
            
        </div>
                    <input type="submit" value=" ">
                </form>
            </div>-->
<!--            <div class="product_list_header">  
                <form action="#" method="post" class="last">
                    <fieldset>
                        <input type="hidden" name="cmd" value="_cart" />
                        <input type="hidden" name="display" value="1" />
                        <input type="submit" name="submit" value="View your cart" class="button" style="display: none" />
                    </fieldset>
                </form>
            </div>-->
            <%
                if (session.getAttribute("username") == null) {
                    System.out.println("username null");
            %>
            <div class="w3l_header_right">

                <ul>

                    <li class="dropdown profile_details_drop" style="display: none">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
                        <div class="mega-dropdown-menu" style="display: none">
                            <div class="w3ls_vegetables" style="display: none">
                                <ul class="dropdown-menu drp-mnu" style="display: none">
                                    <li><a href="userSignup.jsp">Login</a></li> 
                                    <li><a href="userSignup.jsp">Sign Up</a></li>
                                </ul>
                            </div>                  
                        </div>	
                    </li>
                </ul>
            </div>
            <%         } else {
                System.out.println("username exists");
         String username=session.getAttribute("username").toString(); 

            %>
            <div class="w3l_header_right" >

                <ul>
                    <li class="dropdown profile_details_drop" style="display: none">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
                        <div class="mega-dropdown-menu" style="display: none">
                            <div class="w3ls_vegetables" style="display: none">
                                <ul class="dropdown-menu drp-mnu" style="display: none">
                                    <li>Welcome <%= username %></li>
                                    <li><a href="userChangePassword.jsp">Change Password</a></li> 
                                    <li>Logout</li>
                                    <li><a href="userSignup.jsp">Sign Up</a></li>
                                </ul>
                            </div>                  
                        </div>	
                    </li>
                </ul>
            </div>
            <%     }%>

<!--            <div class="w3l_header_right1">
                <h2><a href="mail.html">Contact Us</a></h2>
            </div>-->
            <div class="clearfix"> </div>
        </div>
        <!-- script-for sticky-nav -->
        <script>
            $(document).ready(function () {
                var navoffeset = $(".agileits_header").offset().top;
                $(window).scroll(function () {
                    var scrollpos = $(window).scrollTop();
                    if (scrollpos >= navoffeset) {
                        $(".agileits_header").addClass("fixed");
                    } else {
                        $(".agileits_header").removeClass("fixed");
                    }
                });

            });
        </script>
        
        <!-- //script-for sticky-nav -->
        <div class="logo_products">
            <div class="container">
                <div class="w3ls_logo_products_left">
                    <br>
                    <h1><a href="index.jsp"><span>Grocery</span> Store</a></h1>
                </div>
                <div class="w3ls_logo_products_left1">
                    <ul class="special_items">
                        
                        <li><a href="shopkeeperHome.jsp">Home</a><i>/</i></li>
                        <li><a href="#" data-target="#changePasswordModal" data-toggle="modal">Change Password</a><i>/</i></li>
                        
                         <li><a href="addProducts.jsp">Add Products</a><i>/</i></li>
                         <li><a href="manageProducts.jsp">Manage Products</a><i>/</i></li>
        <li><a href="#" data-target="#editProfileModal" data-toggle="modal">Edit profile</a><i>/</i></li>
        <li><a href="#" data-target="#editPhotoModal" data-toggle="modal">Edit photo</a><i>/</i></li>

                        
                        
                        <li><a href="shopkeeperLogout.jsp">Logout</a></li>
                    </ul>
                </div>
<!--                <div class="w3ls_logo_products_left1">
                    <ul class="phone_email">
                        <li><i class="fa fa-phone" aria-hidden="true"></i>(+0123) 234 567</li>
                        <li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">store@grocery.com</a></li>
                    </ul>
                </div>-->
                <div class="clearfix"> </div>
            </div>
        </div>
              <div class="modal fade" id="changePasswordModal" role="dialog">
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
                                            <label for="idc">Id: </label><br/>
                                            <input type="text" id="idc" name="id" value="<%= id %>" readonly="" class="form-control"</input>
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
                                        <button type="button" class="btn btn-primary" onclick="changec()">Change</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" 
                                            data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                           
                                        
                                        
                                         <div class="modal fade" id="editProfileModal" role="dialog" >
                        <div class="modal-dialog">
                            <!--Modal Content-->
                            <div class="modal-content">
                                <!--Modal Header-->
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Profile</h4>
                                    <button type="button" class="close" data-dismiss="modal">x</button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="idp">Id: </label><br/>
                                            <input type="text" id="idp" name="id2" value="<%= id %>" readonly="" class="form-control"</input>
                                        </div>
                                        <div class="form-group">
                                            <label for="namep">Name </label><br/>
                                            <input type="text" id="namep" name="name" value="<%= name %>"  class="form-control"</input>
                                        </div>   
                                        <div class="form-group">
                                            <label for="shopnamep">Shop Name</label>
                                            <input type="text" id="shopnamep" name="shopname" value="<%= shopname %>" class="form-control"> 
                                        </div>  
                                        <div class="form-group">
                                            <label for="phonenop">Phone Number</label>
                                            <input type="text" id="phonenop" name="phoneno" value="<%= phoneno %>" class="form-control"> 
                                        </div>  
                                        <div class="form-group">
                                            <label for="emailp">Email</label>
                                            <input type="email" id="emailp" name="email" value="<%= email %>" class="form-control"> 
                                        </div>
                                        <div class="form-group">
                                            <label for="addressp">Address </label><br/>
                                            <input type="text" id="addressp" name="address" value="<%= address %>" class="form-control"</input>
                                        </div> 
                                        <div class="form-group">
                                            <label for="websitep">Website </label><br/>
                                            <input type="text" id="websitep" name="website" value="<%= website %>" class="form-control"</input>
                                        </div> 
                                        <div class="form-group">
                                            <label for="cityp">City </label><br/>
                                           
                                            <select id="cityp" name="city"    class="form-control">
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
                                    </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="securityQuestionp">Security Question </label><br/>
                                            
                                            <select id="securityQuestionp" name="securityQuestion"    class="form-control">
                                        <option >What is the name of your first best friend?</option>
                                        <option >What is the name of your first pet?</option>
                                        <option >What is your maiden name?</option>
                                    </select>
                                        </div> 
                                        <div class="form-group">
                                            <label for="securityAnswerp">Security Answer </label><br/>
                                            <input type="text" id="securityAnswerp" name="securityAnswer" value="<%= securityanswer %>" class="form-control"</input>
                                        </div> 
                                        <div id="msgp" class="text-danger"></div>
                                        <button type="button" class="btn btn-primary" onclick="edit()">Edit</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" 
                                            data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                                        
                                        
                                        
                                        
                                         <div class="modal fade" id="editPhotoModal" role="dialog">
                        <div class="modal-dialog">
                            <!--Modal Content-->
                            <div class="modal-content">
                                <!--Modal Header-->
                                <div class="modal-header">
                                    <h4 class="modal-title">Change Photo</h4>
                                    <button type="button" class="close" data-dismiss="modal">x</button>
                                </div>
                                <div class="modal-body">
                                <form id="formphoto"  method="POST" enctype="multipart/form-data">

                                        <div class="form-group">
                                            <label for="imaget" id="lb" name="lb">Photo: </label><br/>
                                            <img src="" id="imaget" name="image" height="60" width="60"/>
                                        </div>   
                                        <div class="form-group">
                                            <label for="choosephotot" id="lt" name="l">Choose Photo:</label>
                                            <input type="file" id="choosephotot" onchange="readandpreview(this,'imaget')" name="choosephoto" class="form-control"/><br/>
                                             
                                            
                                        </div>  
                                          </form>
                                          
                                    <div id="msgt" class="text-danger"></div>
                                        <button type="button" class="btn btn-primary" onclick="change2()">Save</button>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" 
                                            data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
        <!-- //header -->