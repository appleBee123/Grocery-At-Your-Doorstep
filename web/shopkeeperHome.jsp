<%-- 
    Document   : shopkeeperHome
    Created on : Oct 29, 2019, 2:14:44 PM
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            .modal
            {
                margin-top: 49px;
            }
        </style>
        <script>
                            <%String myid=session.getAttribute("id").toString();%>

           
        
          
         
          
            function addProductsGo()
            {
                window.location.href="addProducts.jsp";
            }
            function manageProductsGo()
            {
             window.location.href="manageProducts.jsp";
            }   
    
            
        </script>
    </head>
    <body>
        <%@include file="merchantheader.jsp" %>
                         

        <div class="container">
            <div class="jumbotron">
                 
                <h1>Welcome </h1>
            </div>
            
        </div>
    </body>
</html>
