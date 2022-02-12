<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Grocery Store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Sign In & Sign Up :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>-->
<!-- //for-mobile-apps -->
<!--<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />-->
<!-- font-awesome icons -->
<!--<link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" /> -->
<!-- //font-awesome icons -->
<!-- js -->
<!--<script src="js/jquery-1.11.1.min.js"></script>-->
<!-- //js -->
<!--<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>-->
<!-- start-smoth-scrolling -->
<!--<script type="text/javascript" src="js/move-top.js"></script>-->
<!--<script type="text/javascript" src="js/easing.js"></script>-->
 <style>
            .caret{
                display: none !important;
            }
        </style>
<script type="text/javascript">
     
//	jQuery(document).ready(function($) {
//		$(".scroll").click(function(event){		
//			event.preventDefault();
//			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
//		});
//	});

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
            function usernameGo(obj)
            {
                
              var key = document.getElementById("Username1").value;
              var xmlhttp = new XMLHttpRequest();
              xmlhttp.onreadystatechange = function()
              {
                  if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                  {
                     var res = xmlhttp.responseText.trim();
                        
                        if (res == "success")
                        {
//                            continue;
                        } else
                        {
//                            var tab = "<div style='width: 253px'>";
//                           
//                            for (var i = 0; i < jsonar.length; i++)
//                            {
//                                var productobj = jsonar[i];
//                                product =  productobj.productname;
//                             var   pid = productobj.productid;
//                                tab += "<label onclick=\"gotodetails("+pid+")\">"+product+"</label><br>";
//    
//                                
//                            }
//                            tab += "</div>";
//                            tab +=" ";
//                            document.getElementById("div1").innerHTML = tab;
                              alert("This Username Already Exists!");
                        }
                    }
              };
              xmlhttp.open("GET","./checkUsername?key="+key,true);
              xmlhttp.send();
            }
        function signup()
        {
           var username = document.getElementById("Username1").value;
                var password = document.getElementById("Password1").value;
                var confpassword = document.getElementById("confPassword").value;
                var email= document.getElementById("Email").value;
                var phone= document.getElementById("Phone").value;
                var securityquestion=document.getElementById("securityQuestion").value;
                var securityanswer=document.getElementById("securityAnswer").value;
                var photo=document.getElementById("Photo").value;
                var image=document.getElementById("Image").value;
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
                 if(username==""|| password==""|| confpassword==""|| email=="" || phone=="" || securityanswer=="")
                {
                    //alert(username+" "+password+" "+confpassword+" "+email+" "+phone+" "+securityanswer);
                    alert("All fields are mandatory");
                }
                else if(password != confpassword)
                {
                    alert("Password and Confirm Password Must Be the Same");
                }
                else if(ia==-1||idot==-1||ia<idot!=true)
                {
                    alert("Enter valid email id");
                }
                else if(isNaN(phone))
                {
                    alert("Phone no should only contain digits");
                }
                else if(phone.length!=10)
                {
                    alert("Phone no should be 10 digits");
                } 
                
                 

                else if (document.getElementById("Photo").files.length==0)
                {
                    alert("Choose a photo for your account");
                }
                else
                {
                        var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("form2").elements;
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
                                alert("Account Creation Failed");
                            } else
                            {

                                document.getElementById("Username1").value = "";
                                document.getElementById("Password1").value = "";
                                document.getElementById("Email").value = "";
                                document.getElementById("Phone").value = "";
                                document.getElementById("securityAnswer").value = "";
                                document.getElementById("Photo").value = "";
                                document.getElementById("Image").value = "";
                                alert("Your Account has been Created. Now You Can Login to Your Account.");
                                //document.getElementById("error1").innerHTML = "Update Successful";
                                document.getElementById("msgsignup").innerHTML="Your Account has been Created. Now You Can Login to Your Account.";
//                            setInterval(go,2000);
                            location.reload();
                               
                                
                            }
                        }
                    };
                    xhr1.open("POST", "./userSignupResponse", true);
                    xhr1.send(formdata);
                }
            }  
                
                     
        }
         function go(){
                   window.location.href="userSignup.jsp";

            }
            function login()
            {
                var username=document.getElementById("Username").value;
                var password=document.getElementById("Password").value;
                
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        if(res=="success")
                        {
                            
                      
                         window.location.href="index.jsp";
                               
                        }
                        else
                        {
                            document.getElementById("invalid").innerHTML="Invalid Username or Password";
                        }
                    }
                };
                xmlhttp.open("GET","./responseUserLogin?Username="+username+"&Password="+password,true);
                xmlhttp.send();
            }
</script>
<!-- start-smoth-scrolling -->
</head>
	
<body>
    <%@include file="publicheader.jsp" %>
<!-- header -->
<!--	<div class="agileits_header">
		<div class="w3l_offers">
			<a href="products.html">Today's special Offers !</a>
		</div>
		<div class="w3l_search">
			<form action="#" method="post">
				<input type="text" name="Product" value="Search a product..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search a product...';}" required="">
				<input type="submit" value=" ">
			</form>
		</div>
		<div class="product_list_header">  
			<form action="#" method="post" class="last">
                <fieldset>
                    <input type="hidden" name="cmd" value="_cart" />
                    <input type="hidden" name="display" value="1" />
                    <input type="submit" name="submit" value="View your cart" class="button" />
                </fieldset>
            </form>
		</div>
		<div class="w3l_header_right">
			<ul>
				<li class="dropdown profile_details_drop">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
							<ul class="dropdown-menu drp-mnu">
								<li><a href="userLogin.jsp">Login</a></li> 
								<li><a href="userSignup.jsp">Sign Up</a></li>
							</ul>
						</div>                  
					</div>	
				</li>
			</ul>
		</div>
		<div class="w3l_header_right1">
			<h2><a href="mail.html">Contact Us</a></h2>
		</div>
		<div class="clearfix"> </div>
	</div>
 script-for sticky-nav 
	<script>
	$(document).ready(function() {
		 var navoffeset=$(".agileits_header").offset().top;
		 $(window).scroll(function(){
			var scrollpos=$(window).scrollTop(); 
			if(scrollpos >=navoffeset){
				$(".agileits_header").addClass("fixed");
			}else{
				$(".agileits_header").removeClass("fixed");
			}
		 });
		 
	});
        
	</script>
 //script-for sticky-nav 
	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1><a href="index.html"><span>Grocery</span> Store</a></h1>
			</div>
			<div class="w3ls_logo_products_left1">
				<ul class="special_items">
					<li><a href="events.html">Events</a><i>/</i></li>
					<li><a href="about.html">About Us</a><i>/</i></li>
					<li><a href="products.html">Best Deals</a><i>/</i></li>
					<li><a href="services.html">Services</a></li>
				</ul>
			</div>
			<div class="w3ls_logo_products_left1">
				<ul class="phone_email">
					<li><i class="fa fa-phone" aria-hidden="true"></i>(+0123) 234 567</li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">store@grocery.com</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>-->
<!-- //header -->
<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">Home</a><span>|</span></li>
				<li>Sign In & Sign Up</li>
			</ul>
		</div>
	</div>
<!-- //products-breadcrumb -->
<!-- banner -->
	<div class="banner">
<!--		<div class="w3l_banner_nav_left">
		<nav class="navbar nav_bottom">
			  Brand and toggle get grouped for better mobile display 
			  <div class="navbar-header nav_2">
				  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
			   </div> 
			    Collect the nav links, forms, and other content for toggling 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav nav_1">
						<li><a href="products.html">Branded Foods</a></li>
						<li><a href="household.html">Households</a></li>
						<li class="dropdown mega-dropdown active">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Veggies & Fruits<span class="caret"></span></a>				
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>	
										<li><a href="vegetables.html">Vegetables</a></li>
										<li><a href="vegetables.html">Fruits</a></li>
									</ul>
								</div>                  
							</div>				
						</li>
						<li><a href="kitchen.html">Kitchen</a></li>
						<li><a href="short-codes.html">Short Codes</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Beverages<span class="caret"></span></a>
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="drinks.html">Soft Drinks</a></li>
										<li><a href="drinks.html">Juices</a></li>
									</ul>
								</div>                  
							</div>	
						</li>
						<li><a href="pet.html">Pet Food</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Frozen Foods<span class="caret"></span></a>
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="frozen.html">Frozen Snacks</a></li>
										<li><a href="frozen.html">Frozen Nonveg</a></li>
									</ul>
								</div>                  
							</div>	
						</li>
						<li><a href="bread.html">Bread & Bakery</a></li>
					</ul>
				 </div> /.navbar-collapse 
			</nav>
		</div>-->
		<div class="w3l_banner_nav_right">
<!-- login -->
		<div class="w3_login">
			<h3>Sign In & Sign Up</h3>
			<div class="w3_login_module">
				<div class="module form-module">
				  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
					<div class="tooltip">Click Me</div>
				  </div>
				  <div class="form">
					<h2>Login to your account</h2>
					<form action="#" method="post">
					  <input type="text" id="Username" name="Username" placeholder="Username" required=" ">
					  <input type="password" id="Password" name="Password" placeholder="Password" required=" ">
					  <input type="button" value="Login" onclick="login()">
					</form>
				  </div>
                                    <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h6 class="text-center" id="invalid" style="color: red"></h6>
                </div>
            </div>
        </div>
				  <div class="form">
					<h2>SignUp</h2>
					<form id="form2"  method="post" enctype="multipart/form-data">
					  <input type="text" id="Username1" name="Username" placeholder="Enter Username" required="" onkeyup="usernameGo(this)">
					  <input type="password" id="Password1" name="Password" placeholder="Enter Password" required="">
                                          <input type="password" id="confPassword" name="confPassword" placeholder="Enter Confirm Password" required="">
					  <input type="email" id="Email" name="Email" placeholder="Enter Email Address" required="">
					  <input type="text" id="Phone" name="Phone" placeholder="Enter Phone Number" required="">
                                          <label for="securityQuestion" name="Lb" > Select Security Question</label><br/>
                                <select id="securityQuestion" name="securityQuestion"    class="form-control">
                                        <option >What is the name of your first best friend?</option>
                                        <option >What is the name of your first pet?</option>
                                        <option >What is your maiden name?</option>
                                    </select><br/>
                                    
                                <input type="text" id="securityAnswer" name="securityAnswer" placeholder="Enter Your Security Answer" class="form-control"/><br/>
                                <label for="Photo" name="thisPhoto" >Photo</label>
                                 <input type="file" id="Photo" onchange="readandpreview(this,'Image')" name="Photo" /></br>
                                <img src="" id="Image" name="Image" height="60" width="60" /><br/><br/>
                                </form>
					  <input type="button" class="btn btn-success" value="SignUp"  onclick="signup()">
					<div id="msgsignup"></div>
				  </div>
				  <div class="cta"><a href="userForgotPassword.jsp">Forgot your password?</a></div>
				</div>
			</div>
			<script>
				$('.toggle').click(function(){
				  // Switches the Icon
				  $(this).children('i').toggleClass('fa-pencil');
				  // Switches the forms  
				  $('.form').animate({
					height: "toggle",
					'padding-top': 'toggle',
					'padding-bottom': 'toggle',
					opacity: "toggle"
				  }, "slow");
				});
			</script>
		</div>
<!-- //login -->
		</div>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->
<!-- newsletter-top-serv-btm -->
	<div class="newsletter-top-serv-btm">
		<div class="container">
			<div class="col-md-4 wthree_news_top_serv_btm_grid">
				<div class="wthree_news_top_serv_btm_grid_icon">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i>
				</div>
				<h3>Nam libero tempore</h3>
				<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus 
					saepe eveniet ut et voluptates repudiandae sint et.</p>
			</div>
			<div class="col-md-4 wthree_news_top_serv_btm_grid">
				<div class="wthree_news_top_serv_btm_grid_icon">
					<i class="fa fa-bar-chart" aria-hidden="true"></i>
				</div>
				<h3>officiis debitis aut rerum</h3>
				<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus 
					saepe eveniet ut et voluptates repudiandae sint et.</p>
			</div>
			<div class="col-md-4 wthree_news_top_serv_btm_grid">
				<div class="wthree_news_top_serv_btm_grid_icon">
					<i class="fa fa-truck" aria-hidden="true"></i>
				</div>
				<h3>eveniet ut et voluptates</h3>
				<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus 
					saepe eveniet ut et voluptates repudiandae sint et.</p>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //newsletter-top-serv-btm -->
<!-- newsletter -->
	<div class="newsletter">
		<div class="container">
			<div class="w3agile_newsletter_left">
				<h3>sign up for our newsletter</h3>
			</div>
			<div class="w3agile_newsletter_right">
				<form action="#" method="post">
					<input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="submit" value="subscribe now">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //newsletter -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3_footer_grid">
				<h3>information</h3>
				<ul class="w3_footer_grid_list">
					<li><a href="events.html">Events</a></li>
					<li><a href="about.html">About Us</a></li>
					<li><a href="products.html">Best Deals</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="short-codes.html">Short Codes</a></li>
				</ul>
			</div>
			<div class="col-md-3 w3_footer_grid">
				<h3>policy info</h3>
				<ul class="w3_footer_grid_list">
					<li><a href="faqs.html">FAQ</a></li>
					<li><a href="privacy.html">privacy policy</a></li>
					<li><a href="privacy.html">terms of use</a></li>
				</ul>
			</div>
			<div class="col-md-3 w3_footer_grid">
				<h3>what in stores</h3>
				<ul class="w3_footer_grid_list">
					<li><a href="pet.html">Pet Food</a></li>
					<li><a href="frozen.html">Frozen Snacks</a></li>
					<li><a href="kitchen.html">Kitchen</a></li>
					<li><a href="products.html">Branded Foods</a></li>
					<li><a href="household.html">Households</a></li>
				</ul>
			</div>
			<div class="col-md-3 w3_footer_grid">
				<h3>twitter posts</h3>
				<ul class="w3_footer_grid_list1">
					<li><label class="fa fa-twitter" aria-hidden="true"></label><i>01 day ago</i><span>Non numquam <a href="#">http://sd.ds/13jklf#</a>
						eius modi tempora incidunt ut labore et
						<a href="#">http://sd.ds/1389kjklf#</a>quo nulla.</span></li>
					<li><label class="fa fa-twitter" aria-hidden="true"></label><i>02 day ago</i><span>Con numquam <a href="#">http://fd.uf/56hfg#</a>
						eius modi tempora incidunt ut labore et
						<a href="#">http://fd.uf/56hfg#</a>quo nulla.</span></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
			<div class="agile_footer_grids">
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
					<div class="w3_footer_grid_bottom">
						<h4>100% secure payments</h4>
						<img src="images/card.png" alt=" " class="img-responsive" />
					</div>
				</div>
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
					<div class="w3_footer_grid_bottom">
						<h5>connect with us</h5>
						<ul class="agileits_social_icons">
							<li><a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="google"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
							<li><a href="#" class="instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#" class="dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="wthree_footer_copy">
				<p>© 2016 Grocery Store. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
		</div>
	</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.js"></script>
<script>
		paypal.minicart.render();

		paypal.minicart.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});

	</script>
</body>
</html>