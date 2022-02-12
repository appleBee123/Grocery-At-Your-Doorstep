<%-- 
    Document   : categoryProduct
    Created on : Nov 30, 2019, 12:58:01 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
            .caret{
                display: none !important;
            }
        </style>
        <script>
            function openproddetail(pid){
                window.location.href="productdetail.jsp?pid="+pid;
            }
            function go11()
            {
                <%String category=request.getParameter("catname");%>
                var jsonar; 
          
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        jsonar = mainjson["ans"];
//                        alert(jsonar.length);
                        if (jsonar.length == 0)
                        {
                            var tab="No Product Found";
                            document.getElementById("mydiv1").innerHTML = tab;
                        } else
                        {
                            var tab="";
                            
                           
                            for (var i = 0; i < jsonar.length; i++)
                            {
                                var productobj = jsonar[i];
                                var pid=productobj.productid;
                                tab += "<div class='col-md-6' style=\"border: 2px outset #ccff99;\" onclick=\"openproddetail("+pid+")\">";
                                
                            
                                tab += "<img  src='"+productobj.primaryphoto+"' height='200' width='200'/>"; 
                                tab += "<p><strong>"+productobj.productname + "</strong></p>";
                                tab += "<p>"+productobj.productdes + "</p>";
                                tab += "<p style='border: 1px solid #749f48; border-radius: 5px; padding: 1px; display: inline;' >"+productobj.brand + "</p>";
                                tab += "<p>MRP: Rs "+productobj.mrp + "</p>";
                                tab += "<p>Offer Price: <strong>Rs&nbsp;"+productobj.offerprice + "</strong></p>";
                                tab += "</div>";
//                                tab += "</div>";
                                
                            }
                           
                            document.getElementById("mydiv1").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchProducts3?category="+'<%=category%>', true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body onload="go11()">
        <%
                if (session.getAttribute("username") == null ) {%>
                    <%@include  file="publicheader.jsp"%>
                            
            <%}

     else {%>
    <%@include  file="UserHeader.jsp"%>
    <%}
    %>
        <div class="container">
            <div class="row">
                <div class="col-md-12" >
                    <div class="row" id="mydiv1">
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>
