<%-- 
    Document   : categories
    Created on : Nov 22, 2019, 11:49:51 AM
    Author     : lenovo
--%>


<body onload="fetchCategories()">
        <%@include file="UserHeader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4" id="divtable">
                  <script type="text/javascript">
                      var jsonar;
            function fetchCategories()
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
                                var categoryobj = jsonar[i];
                                
                                tab += "<div>"+"<img src='" + categoryobj.photo +"' height='100' width='100'/>"+ "</div>";
                                tab += "<div>" + categoryobj.catname + "</div>";
                                tab += "<div>" + categoryobj.description + "</div>";
                                
                                
                               
                            }
                            tab += "</div>";
                            
                            document.getElementById("divtable").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchCategories", true);
                xmlhttp.send();
            }
                      </script>
                </div>
    </body>
</html>
