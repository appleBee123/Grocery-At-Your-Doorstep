<%-- 
    Document   : orderstep2
    Created on : Nov 29, 2019, 5:09:29 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <style>
        .gg
        {
            display: none;
        }
    </style>
    <script>
        function pay()
        { <% session.setAttribute("order","save");%>
            var online = document.getElementById("online").checked;
            var cash = document.getElementById("cash").checked;
            if (cash === true)
            {
                var atotal = document.getElementById("actualamt1").value;
                var discount = document.getElementById("discount2").value;
                var gtotal = document.getElementById("amttopay1").value;
                var address = document.getElementById("address1").value;
                var city = document.getElementById("city1").value;
                window.location.href = "orderplaced.jsp?actualamt1=" + atotal + "&discount2=" + discount + "&amttopay1=" + gtotal +
                        "&address1=" + address + "&city1=" + city;
            } else if (online === true)
            {
                var atotal = document.getElementById("actualamt1").value;
                var discount = document.getElementById("discount2").value;
                var gtotal = document.getElementById("amttopay1").value;
                var address = document.getElementById("address1").value;
                var city = document.getElementById("city1").value;
                window.location.href = "payment.jsp?actualamt1=" + atotal + "&discount2=" + discount + "&amttopay1=" + gtotal +
                        "&address1=" + address + "&city1=" + city;
            } else
            {
                alert("Please select the Mode of Payment!");
            }

        }
    </script>
    <body>
        <%@include file="UserHeader.jsp" %>

        <div class="products-breadcrumb">
            <div class="container">
                <ul>
                    <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">Home</a><span>|</span></li>
                    <li style="color: white;font-size: large;">Payment</li>
                </ul>
            </div>
        </div>
        <div class="w3_login"><h3>Payment</h3></div>
        <div class="container">

            <br>

            <div style="border: 1px solid rgba(0,0,0,0.1);padding: 20px;background-clip: content-box;">    
                <div class="row" >
                    <div class="col-sm-2" style="font-size: x-large;"></div>
                    <div class="col-sm-2" style="font-size: x-large;"></div>
                    <div class="col-sm-4" style="font-size: x-large;text-align: center"><input type="radio"  id="cash" name="r1" value="cash on delivery"/>Cash On Delivery<br>
                        <input type="radio"  id="online" name="r1" value="pay online"/>Pay Online
                    </div> <div class="col-sm-2" style="font-size: x-large;"></div>
                    <div class="col-sm-2" style="font-size: x-large;"></div>

                </div><br>
                <button class="btn btn-lg btn-primary" style="width: 100%;" onclick="pay()">Make A Payment
                </button>
            </div>

            <div class="gg" id="order1">
                <input type="text" value="<%=request.getParameter("actualamt")%>"  id="actualamt1" name="actualamt1"/>
                <input type="text" value="<%=request.getParameter("discount1")%>"  id="discount2" name="discount2"/>
                <input type="text" value="<%=request.getParameter("amttopay")%>"  id="amttopay1" name="amttopay1"/>
                <input type="text" value="<%=request.getParameter("address")%>"  id="address1" name="address1"/>
                <input type="text" value="<%=request.getParameter("city")%>"  id="city1" name="city1"/>
            </div>

        </div>
    </body>
</html>
