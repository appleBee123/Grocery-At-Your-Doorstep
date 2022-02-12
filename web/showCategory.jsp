<%-- 
    Document   : showCategory
    Created on : Nov 27, 2019, 2:39:52 PM
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
        <script>
            var jsonar;
            function fetchProducts()
            {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        jsonar = mainjson["ans"];
                        if (jsonar.length == 0)
                        {
                            continue;
                        } else
                        {
                            var tab = "<div>";
                            
                            for (var i = 0; i < jsonar.length; i++)
                            {
                                var galleryobj = jsonar[i];
                                
                                tab += "<img src='" + galleryobj.primaryphoto +"' height='100' width='100'/>";
                                tab +=  galleryobj.productname;
                                tab +=  galleryobj.productdes;
                                tab +=  galleryobj.mrp;
                                tab +=  galleryobj.offerprice;
                            }
                            tab += "</div>";
                            
                            document.getElementById("div1").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchProducts2?category="+category, true);
                xmlhttp.send();
            }
            </script>
    </head>
    <body onload="fetchProducts()">
        <% String category= request.getParameter("category"); %>
        <% String description= request.getParameter("description"); %>
        <% String photo= request.getParameter("photo"); %>
        <%@include file="UserHeader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div>
                        <img src="photo" height="60" width="60">
                        <label><%=category%></label>
                        <label><%=description%></label>
                    </div>
                    <div>
                        <h2>Products of <%=category%></h2>
                        <div id="div1">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
