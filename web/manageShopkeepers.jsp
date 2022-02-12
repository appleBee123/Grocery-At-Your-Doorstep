<%-- 
    Document   : manageShopkeepers
    Created on : Oct 25, 2019, 3:03:19 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        
        <script>
            function fetchShopkeepers()
            {
               
                
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim(); //jsonstring response
                        console.log(res);
                        var mainjson = JSON.parse(res);  //convert jsonstring to json
                        var jsonar = mainjson["ans"]; //json array
                        var tab11 ="<table border=1 class='table table-bordered'>";
                        tab11+="<thead><tr><td>Shopkeeper Id</td><td>Shopkeeper Name</td><td>Shop Name</td><td>Phone Number</td><td>Email Id</td><td>Photo</td><td></td></tr></thead>";
                        tab11+="<tbody>";
                        var tab1 ="<table border=1 class='table table-bordered'>";
                        tab1 +="<thead><tr><td>Shopkeeper Id</td><td>Shopkeeper Name</td><td>Shop Name</td><td>Phone Number</td><td>Email Id</td><td>Photo</td><td></td></tr></thead>";
                        tab1 +="<tbody>";
                        if (jsonar.length == 0)
                        {
                            alert("Data not found");
                        } else
                        {
                            for(var i=0;i<jsonar.length;i++){
                                var obj = jsonar[i]; //get object at 0 index
                            
                            
                            if(obj.status=="active")
                            {
                              
                            tab11+="<tr><td>" + obj.shopkeeperid + "</td>";
                            tab11+="<td>" + obj.shopkeepername + "</td>";
                            tab11+="<td>" + obj.shopname + "</td>";
                            tab11+="<td>" + obj.phoneno + "</td>";
                            tab11+="<td>" + obj.email + "</td>";
                            
                            tab11+="<td><img src='" + obj.image + "' height=80 width=80/></td>";  
                            
                            tab11+="<td>" + "<button onclick=\"changeStatus('"+obj.shopkeeperid+"','"+obj.status+"')\">Block</button>" + "</td></tr>";
                            }
                            else
                            {
                                tab1 +="<tr><td>" + obj.shopkeeperid + "</td>";
                            tab1 +="<td>" + obj.shopkeepername + "</td>";
                            tab1 +="<td>" + obj.shopname + "</td>";
                            tab1 +="<td>" + obj.phoneno + "</td>";
                            tab1 +="<td>" + obj.email + "</td>";
                            
                            tab1 +="<td><img src='" + obj.image + "' height=80 width=80/></td>"; 
                            tab1 +="<td>" + "<button onclick=\"changeStatus('"+obj.shopkeeperid+"','"+obj.status+"')\" >Active</button>" + "</td></tr>";
                            }
                            
                            
                } 
                tab11+="</tbody>";
                        tab11+="</table>";
                        tab1 +="</tbody>";
                        tab1 +="</table>";
                            
                            
                            document.getElementById("mydiv").innerHTML = tab11;
                            document.getElementById("mydiv1").innerHTML = tab1;
                        }
                    }
                };
                xmlhttp.open("GET", "./getShopkeepers", true);
                xmlhttp.send();
                
              
            }
          
            function changeStatus(id,status)
            {
               
              
        var xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        var res=xmlhttp.responseText.trim();
                        if(res=="success")
                        {
                            alert("Shopkeeper status changed");
                            fetchShopkeepers();
                        }
                        else
                            (
                                alert("Status Change Failed"));
                    }
                };
                xmlhttp.open("GET","./changeShopkeeperStatus?id="+id+"&status="+status,true);
                xmlhttp.send();
                
            }
               
            
        </script>
        <title>JSP Page</title>
    </head>
    <body class="container" onload="fetchShopkeepers()">
        <%@include file="adminHeader.jsp" %>
        <h1>Active Shopkeepers</h1>
        <div id="mydiv">
            
        </div>
        <h1>Pending Shopkeepers</h1>
        <div id="mydiv1">
            
        </div>
    </body>
</html>
