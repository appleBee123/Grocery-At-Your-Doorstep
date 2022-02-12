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
            #div1{
                margin-top: 4%;
                background-color: wheat;
            }
        </style>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
            function go(obj)
            {
                
              var key = document.getElementById("Product").value;
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
                            document.getElementById("div1").innerHTML = tab;
                        }
                    }
              };
              xmlhttp.open("GET","./searchResponse?key="+key,true);
              xmlhttp.send();
            }

function gotodetails(pid){
    window.location.href="productdetail.jsp?pid="+pid;
}
function showcart(){
    window.location.href="usercart.jsp";
}
    


        </script>
        <!-- start-smoth-scrolling -->
    </head>

    <body>
        <!-- header -->
        <div class="agileits_header">
            <div class="w3l_offers">
                <a href="products.html">Today's special Offers !</a>
            </div>
            <div style="position: static;" class="w3l_search">
                <form action="#" method="post">
                    <input type="text" name="Product" id="Product" value="Search a product..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Search a product...';
                                        }" required="" onkeyup="go(this)">
                                        <div style="position: absolute; z-index: 200; " id="div1">
            
        </div>
                    <input type="submit" value=" ">
                </form>
            </div>
            <div class="product_list_header">  
                <form action="#" method="post" class="last">
                    <fieldset>
                        <input type="hidden" name="cmd" value="_cart" />
                        <input type="hidden" name="display" value="1" />
                        <input type="button" name="submit" value="View your cart"  onclick="showcart()"/>
                    </fieldset>
                </form>
            </div>
            <%
                if (session.getAttribute("username") == null) {
                    System.out.println("username null");
            %>
            <div class="w3l_header_right">

                <ul>

                    <li class="dropdown profile_details_drop">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret" ></span></a>
                        <div class="mega-dropdown-menu">
                            <div class="w3ls_vegetables">
                                <ul class="dropdown-menu drp-mnu">
                                    <li><a href="userSignup.jsp">Login</a></li> 
                                    <li><a href="userSignup.jsp">Sign Up</a></li>
                                </ul>
                            </div>                  
                        </div>	
                    </li>
                </ul>
            </div>
            <%        } else {
                System.out.println("username exists");
         String username=session.getAttribute("username").toString(); 

            %>
            <div class="w3l_header_right">

                <ul>
                    <li class="dropdown profile_details_drop">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
                        <div class="mega-dropdown-menu">
                            <div class="w3ls_vegetables">
                                <ul class="dropdown-menu drp-mnu">
                                    <li>Welcome <%= username %></li>
                                    <li><a href="userChangePassword.jsp">Change Password</a></li> 
                                    <li><a href="UserLogout.jsp">Logout</a></li>
                                    <!--<li><a href="userSignup.jsp">Sign Up</a></li>-->
                                </ul>
                            </div>                  
                        </div>	
                    </li>
                </ul>
            </div>
            <%     }%>

            <div class="w3l_header_right1">
                <h2><a href="contactus.jsp">Contact Us</a></h2>
            </div>
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
                    <h1 ><a href="index.jsp"><span>Grocery</span> Store</a></h1>
                </div>
                <div class="w3ls_logo_products_left1">
                    <br>
                    <ul class="special_items">
                        
                        <!--<li><a href="events.html">Events</a><i>/</i></li>-->
                        <% if(session.getAttribute("username")==null){%>
                        <li> 
                        <ul>
                                        <li class="dropdown profile_details_drop">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Merchant<span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
							<ul class="dropdown-menu drp-mnu">
								<li><a href="shopkeeperLogin.jsp">Login</a></li> 
								<li><a href="shopkeeperSignup.jsp">Sign Up</a></li>
							</ul>
						</div>                  
					</div>	
				</li><i>/</i>
                                    </ul>
                        </li>
                        <li><a href="about.jsp">About Us</a><i>/</i></li>
                        
                        <li><a href="contactus.jsp">Contact Us</a></li>
                        <%}
                           
                           else{%>
                           
                        <li><a href="userChangePassword.jsp">Change Password</a><i>/</i></li>
                       <li><a href="UserLogout.jsp">Logout</a></li>
                        <%}%>
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
        <!-- //header -->