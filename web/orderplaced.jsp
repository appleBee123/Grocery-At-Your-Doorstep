<%-- 
    Document   : orderplaced
    Created on : Nov 29, 2019, 5:10:49 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
    <style>
        .kk
        {
            display: none;
        }
    </style>
    <script>
        function order()
        {
             var atotal = document.getElementById("actualamt2").value;
             var discount = document.getElementById("discount3").value;
             var gtotal = document.getElementById("amttopay2").value;
             var address = document.getElementById("address2").value;
             var city = document.getElementById("city2").value;
            
            var xhr = new XMLHttpRequest();
            xhr.open("GET","./orderresponse?actualamt2="+atotal+"&discount3="+discount+"&amttopay2="+gtotal+"&address2="+address+"&city2="+city,true);
            xhr.onreadystatechange=function()
            {
                if(xhr.status===200 && xhr.readyState===4)
            {   
                
                 if(xhr.responseText.trim()==="Success")
                  {
                     
                     alert("Done");
                  
                  }
                 
                 
              }     
            };
            xhr.send();
        }
       
            
      
        
        
    </script>
     </head>
    <body onload="order()">
        <%@include file="UserHeader.jsp" %>
        
            <div class="top-brands">
                <h2 style="text-align: center;">Order Placed Successfully!!!</h2><br>
                <a href="myorderuser.jsp" style="margin-left:45%" class="btn bg-info" >View Your Orders</a>
            </div>
       <div class="kk" id="order2">
                    <input type="text" value="<%=request.getParameter("actualamt1")%>"  id="actualamt2" name="actualamt2"/>
                    <input type="text" value="<%=request.getParameter("discount2")%>"  id="discount3" name="discount3"/>
                    <input type="text" value="<%=request.getParameter("amttopay1")%>"  id="amttopay2" name="amttopay2"/>
                    <input type="text" value="<%=request.getParameter("address1")%>"  id="address2" name="address2"/>
                    <input type="text" value="<%=request.getParameter("city1")%>"  id="city2" name="city2"/>
          </div>
    </body>
</html>
