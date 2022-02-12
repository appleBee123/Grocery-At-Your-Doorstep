<%-- 
    Document   : payment
    Created on : Nov 29, 2019, 5:12:23 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .kk{
            display: none;
        }
    </style>
    <body>

        <%@include file="UserHeader.jsp" %>
         <div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">Home</a><span>|</span></li>
				<li style="color: white;font-size: large;">Online Payment</li>
			</ul>
		</div>
	</div>
         <br>
        

        <form action="orderplaced.jsp" method="post">
<div class="kk" id="order2">
                    <input type="text" value="<%=request.getParameter("actualamt1")%>"  id="actualamt1" name="actualamt1"/>
                    <input type="text" value="<%=request.getParameter("discount2")%>"  id="discount2" name="discount2"/>
                    <input type="text" value="<%=request.getParameter("amttopay1")%>"  id="amttopay1" name="amttopay1"/>
                    <input type="text" value="<%=request.getParameter("address1")%>"  id="address1" name="address1"/>
                    <input type="text" value="<%=request.getParameter("city1")%>"  id="city1" name="city1"/>
                    
          </div>
            <!-- receive ur normal text data on next page , like we do regularly -->

            <input type="text"  name="t1" readonly="" value="<%=request.getParameter("amttopay1")%>" />


            <!-- Note that the amount is in paise = 500 INR -->
            <!-- This script will show payment screen and block form submit until, payment is successful -->
            <script
                src="https://checkout.razorpay.com/v1/checkout.js"
                data-key="rzp_test_96HeaVmgRvbrfT"
                data-amount='<%=Integer.parseInt(request.getParameter("amttopay1").toString())*100%>'
                data-buttontext="Pay with Razorpay"
                data-name="Project Name"
                data-description="Purchase Description"
                data-image="images/foodbasket.png"
                data-prefill.name="Project Name"
                data-prefill.email=""
                data-theme.color="yellowgreen"
            >
            </script>

        
            
        </form>
    </body>
</html>
