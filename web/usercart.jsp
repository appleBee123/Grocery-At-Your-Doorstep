<%-- 
    Document   : usercart
    Created on : Nov 29, 2019, 3:17:40 PM
    Author     : lenovo
--%>

<%@page import="vmm2.product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .caret{
                display: none !important;
            }
        </style>
    </head>
      <script>
        var xhr = new XMLHttpRequest();
        function editqty(obj)
        {
            var qty = obj.value;
            var index = obj.alt;

            xhr.open("POST", "./editqtyresponse?qty=" + qty + "&index=" + index, true);
            xhr.onreadystatechange = function ()
            {
                if (xhr.status === 200 && xhr.readyState === 4)
                {

                    if (xhr.responseText.trim() === "success")
                    {
                        // ArrayList<product> al = ArrayList<product> session.getAttribute("cartlist");


                        var mrp = document.getElementById("mrp" + index).innerHTML;
                        var total = parseInt(mrp) * parseInt(qty);
                        document.getElementById("total" + index).innerHTML = total;
                        // var alsize = document.getElementById("alsize").innerHTML;


                        changetotal();
                    }

                }
            };
            xhr.send();
        }

        function changetotal()
        {
            var alsize = document.getElementById("alsize").innerHTML;
            var gtotal = 0;
            var atotal = 0;

            for (var i = 0; i < alsize; i++) {

                if (document.getElementById("total" + i) !== null)
                {
                    var total = document.getElementById("total" + i).innerHTML;
                    var total1 = parseInt(document.getElementById("offerprice" + i).innerHTML) * parseInt(document.getElementById("qty" + i).value);

                    gtotal = gtotal + parseInt(total);
                    atotal = atotal + total1;
                 
                }
            }
            document.getElementById("gtotal").innerHTML = gtotal;
            document.getElementById("atotal").innerHTML = atotal;
            document.getElementById("discount").innerHTML = atotal-gtotal;


        }
        function deletecart(obj1)
        {


            var result = confirm("Are you sure you want to delete?");
            if (result === true)
            {
                var index = obj1;
                
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "./deleteviewcart?index=" + index, true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.status === 200 && xhr.readyState === 4)
                    {
                        if (xhr.responseText.trim() === "success")
                        {
                            document.getElementById("singlerow" + index).innerHTML = "";
                            changetotal();
                        }
                    }
                };
                xhr.send();
            }
        }
        
        function orderstep1()
        {
            
            xhr.open("POST", "./checkuserlogin", true);
            xhr.onreadystatechange = function ()
            {
                if (xhr.status === 200 && xhr.readyState === 4)
                {

                    if (xhr.responseText.trim() === "fail")
                    {
                        alert("Please login first !");
                        window.location.href="userSignup.jsp";
                    }
                    else
                    {
                       var atotal = document.getElementById("atotal").innerHTML;
                       var discount = document.getElementById("discount").innerHTML;
                       var gtotal = document.getElementById("gtotal").innerHTML;
                       window.location.href="orderstep1.jsp?atotal="+atotal+"&discount="+discount+"&gtotal="+gtotal;
                    }

                }
            };
            xhr.send();
            
        }
        function goSignup()
        {
            window.location.href="userSignup.jsp";
        }

    </script>

    <body>
         <%
                if (session.getAttribute("username") == null) {%>
                   
                <script>   alert("Please Login or Signup First!");
//                    window.location.href="userSignup.jsp";
                </script>
                            
                         
                            
            <%}%>

    
    <%@include  file="UserHeader.jsp"%>
   
   
        
         
       
        
        <div class="container">
            
            
            
            <br>
            <table class="table table-bordered" >
                <tr>
                    <th style="background: black;color: white;text-align: center;">Product Name</th>
              <!--      <th>Description</th>-->
                    <th style="background: black;color: white;text-align: center;">Image</th>
                    <th style="background: black;color: white;text-align: center;">Quantity</th>
                    <th style="background: black;color: white;text-align: center;">Price(Rs)</th>
                    <th style="background: black;color: white;text-align: center;">Total(Rs)</th>
                    <th style="background: black;color: white;text-align: center;">Delete</th>
                </tr>
                <%                     if (session.getAttribute("cartlist") != null) {
                        ArrayList<product> al = (ArrayList<product>) session.getAttribute("cartlist");
                %>
                <%
                    int total = 0;
                    int actualtotal = 0;
                    for (int i = 0; i < al.size(); i++) {


                %>
                <tr id="singlerow<%=i%>">      

                    <td style="text-align: center;color:black;"> <%=al.get(i).productname%> </td>
               <!--     <td> <%--<%=al.get(i).description%>--%> </td>-->
                    <td style="text-align: center;"><img src="<%=al.get(i).primaryphoto%>" style="width: 100px;height: 100px;"/> </td>
                    <td style="text-align: center;color:black;"> <input type="number" min="1" id="qty<%=i%>" value="<%=al.get(i).qty%>" alt="<%=i%>" onchange="editqty(this)"/></td>
                        <%
                            if (al.get(i).offerprice == 0) {
                        %>   
                    <td  style="font-weight: bold;text-align: center;color:black;">

                        <span id="mrp<%=i%>"><%=al.get(i).mrp%></span>
                    </td>
                    <td style="text-align: center;color:black;" id="total<%=i%>"> <%=al.get(i).qty * al.get(i).mrp%> </td>
                    <td id="offerprice<%=i%>" hidden=""><%=al.get(i).mrp%></td>
                    <%    total = total + al.get(i).qty * al.get(i).mrp; %>

                    <%
                        actualtotal = actualtotal + al.get(i).qty * al.get(i).mrp;

                    } else {
                    %>
                    <td  style="font-weight: bold;text-align: center;color:black;">

                        <span style="text-decoration: line-through;color: powderblue">Rs.<%=al.get(i).mrp%></span> <span id="mrp<%=i%>"><%=al.get(i).offerprice%></span>
                    </td>
                    <td id="offerprice<%=i%>" hidden=""><%=al.get(i).mrp%></td>

                    <td style="text-align: center;color:black;" id="total<%=i%>"> <%=al.get(i).qty * al.get(i).offerprice%> </td>
                    <%    total = total + al.get(i).qty * al.get(i).offerprice;
                            actualtotal = actualtotal + al.get(i).qty * al.get(i).mrp;

                        }
                    %>


                    <td style="text-align: center">
                        
               <a href="#" class="btn btn-danger" onclick="deletecart(<%=i%>)"><span class="glyphicon glyphicon-trash"></span>&nbsp;Delete</a>
                        
                    </td>

                </tr>

                <%
                    }
                %>
                <tr>
                    <td ></td>
                <!--    <td></td>-->
                    <td></td>
                    <td></td>
                    <td style="font-weight: bold;text-align: center;color:black;">Market Price</td>
                    <td style="font-weight: bold;text-align: center;color:black;" id="atotal" name="atotal"><%=actualtotal%></td>
                    <td></td>

                </tr>
                <tr>
                    <td ></td>
                   <!--    <td></td>-->
                    <td></td>
                    <td></td>
                    <td style="font-weight: bold;text-align: center;color:black;">Discount</td>
                    <td style="font-weight: bold;text-align: center;color:black;" id="discount" name="discount"><%=actualtotal - total%></td>
                    <td></td>

                </tr>
                <tr>
                    <td></td>
                   <!--    <td></td>-->
                    <td></td>
                    <td></td>
                    <td style="font-weight: bold;color: royalblue;text-align: center;">Amount to Pay</td>
                    <td style="font-weight: bold;color: royalblue;text-align: center;" id="gtotal" name="gtotal"><%=total%></td>
                    <td></td>

                </tr>
                <label id="alsize" hidden=""><%=al.size()%></label>

                <%
                    }
                %>   



            </table>
            <%
                if (session.getAttribute("cartlist") != null) {
            %>
            <button style="float: right;width: 100px;border-radius: 10px;" onclick="orderstep1()" class="btn btn-lg btn-primary" 
               >NEXT
            </button>
            <%
                }
            %>
        </div>

    </body>
</html>
