<%-- 
    Document   : contactus
    Created on : Dec 12, 2019, 7:54:16 AM
    Author     : lenovo
--%>

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
    <body>
         <%
                if (session.getAttribute("username") == null || session.getAttribute("name")==null) {%>
                    <%@include  file="publicheader.jsp"%>
                            
            <%}

     else {%>
    <%@include  file="UserHeader.jsp"%>
    <%}
    %>
        
         <div class="container">
             <h1>Contact Us</h1>
        <div class="w3ls_logo_products_left1">
                    <ul class="phone_email">
                        <li><i class="fa fa-phone" aria-hidden="true"></i>6239512009</li>
                        <li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">store@grocery.com</a></li>
                    </ul>
                </div>
         </div>
    </body>
</html>
