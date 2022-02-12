<%-- 
    Document   : orderstep1
    Created on : Nov 29, 2019, 5:07:42 PM
    Author     : lenovo
--%>

<%@page import="vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <style>
        .dd
        {
            display: none;
        }
    </style>
    <script>
        
        function order()
        {
            var address =document.getElementById("address").value;
            var selected =document.getElementById("city").value;
            if(address==="")
            {
                alert("Address is Mandatory!!!!");
            }
            else if(selected==="")
            {
                alert("Please Select Valid City");
            }
             else 
            {
               var atotal = document.getElementById("actualamt").value;
               var discount = document.getElementById("discount1").value;
               var gtotal = document.getElementById("amttopay").value;
               var address =document.getElementById("address").value;
               var city =document.getElementById("city").value;
                window.location.href="orderstep2.jsp?actualamt="+atotal+"&discount1="+discount+"&amttopay="+gtotal+
                        "&address="+address+"&city="+city;
                
            }
        }
    </script>
    </head>
    <body>
       
        <%@include file="UserHeader.jsp" %>
        
        
        <div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">Home</a><span>|</span></li>
				<li style="color: white;font-size: large;">Customer Address</li>
			</ul>
		</div>
	</div>
        
        
             <div class="container">
           
       
            <div class="w3_login">
            <h3>Customer Address</h3>
        <div class="module form-module">
				  <div ><i ></i>
					<div class="tooltip">Click Me</div>
				  </div>
            <div class="form">
                    <div class="form-group">
                        <label>Enter Address</label>
                        <br>
                        <textarea 
                            id="address" name="address" class="form-control" style="border-radius: 10px;" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>City</label>
                         <br>
                        <select id="city" name="city" class="form-control" style="border-radius: 10px;">
                            <option value="">*** Select City ***</option>
                        <%
                            ResultSet rs=DBLoader.executeQuery("select DISTINCT(city) from shopkeeper");
                            while(rs.next())
                            {
                         %>
                                
                                <option><%=rs.getString("city")%></option>
                        <%       
                            }
                        %>
                    </select>
                            
                        
                    </div>
                    <div class="form-group">
                        <label></label>
                        <button type="button"class="btn btn-lg btn-primary" style="width: 100%;border-radius: 10px;" onclick="order()">Proceed</button>
                    </div>
                         
            </div>
        </div>
            </div>
            </div> 
        
                    <div class="dd" id="order">
                    <input type="text" value="<%=request.getParameter("atotal")%>"  id="actualamt" name="actualamt"/>
                    <input type="text" value="<%=request.getParameter("discount")%>"  id="discount1" name="discount1"/>
                    <input type="text" value="<%=request.getParameter("gtotal")%>"  id="amttopay" name="amttopay"/>
                    </div>
                    
                    
    </body>

</html>
