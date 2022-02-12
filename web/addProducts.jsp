<%-- 
    Document   : addProducts
    Created on : Nov 4, 2019, 12:41:06 PM
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
            function readandpreview(fileobj,imageid)
            {
                var firstfile = fileobj.files[0];
                var reader = new FileReader();
                reader.onload = (function(f)
                {
                  return function read(e)
                  {
                      document.getElementById(imageid).src = e.target.result;
                  }
                })(firstfile);
                reader.readAsDataURL(firstfile);
            }
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
                            alert("No category found");
                        } else
                        {
                            var tab = "";
                           
                            for (var i = 0; i < jsonar.length; i++)
                            {
                                var categoryobj = jsonar[i];
                                tab += "<option>" + categoryobj.catname + "</option>";
                                
                            }
                            
                            document.getElementById("category").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchCategories", true);
                xmlhttp.send();
            }
            function addCategory()
            {
                var productname = document.getElementById("productname").value;
                var description = document.getElementById("description").value;
                var img=document.getElementById("photo").files.length;
                var mrp = document.getElementById("mrp").value;
                var offerprice = document.getElementById("offerprice").value;
                var category = document.getElementById("category").value;
                var brand = document.getElementById("brand").value;
                if(productname=="" || description=="" || mrp=="" || offerprice=="" || category=="" || brand=="" )
                {
                    alert("All Fields Are Mandatory");
                }
                else if(img==0)
                {
                    alert("Please select a photo");
                }
                else if(isNaN(mrp))
                {
                    alert("MRP can contain only digits");
                }
                else if(isNaN(offerprice))
                {
                    alert("Offer Price can contain only digits");
                }
                else
                {
                    var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("form1").elements;
                var flag = 0;
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }
                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length > 0)
                        {
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    }
                   
                    else
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {
                    var xhr = new XMLHttpRequest;
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText;
                            if (res === "fail")
                            {
                                document.getElementById("error").innerHTML = "<div class=\"alert alert-danger\"> Error</div>";
                            } else
                            {

                                document.getElementById("productname").value = "";
                                document.getElementById("description").value = "";
                                
                                document.getElementById("photo").value = "";
                                document.getElementById("photo").value = "";
                               
                                document.getElementById("image1").src="";
                                 document.getElementById("mrp").value = "";
                                document.getElementById("offerprice").value = "";
                                 document.getElementById("brand").value = "";
                               
                                alert("Product Added!");
                                document.getElementById("error").innerHTML = "<div class=\"alert alert-success\">Product Added Successfully</div><br>\n";
                           
            }
                        }
                    };
                    xhr.open("POST", "./addProductsResponse", true);
                    xhr.send(formdata);
                }
                }
            }
            </script>
    </head>
    <body onload="fetchCategories(),fetch()">
        <%@include file="merchantheader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Add Products</h2>
         <form id="form1"  method="POST" enctype="multipart/form-data">
            <table class="table table-bordered" border="1">
                <tr>
                    <td><label for="productname"> Product Name</label></td>
                    <td><input type="text" id="productname" name="productname" class="form-control" /></td>
                </tr>
                <tr>
                <td><label for="description"> Description</label></td>
                    <td><textarea id="description" name="description" class="form-control" ></textarea></td>
                        
                </tr>
                <tr>
                <td><label for="photo">Photo</label></td>
                    <td><input type="file" id="photo" onchange="readandpreview(this,'image1')" name="photo" /><br/>
                        <img src="" id="image1" name="image1" height="60" width="60" />
                    </td>
                </tr>
                <tr>
                    <td><label for="mrp">MRP </label> </td>
                    <td>
                    <input type="text" id="mrp" name="mrp" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td><label for="offerprice">Offer Price </label> </td>
                    <td>
                    <input type="text" id="offerprice" name="offerprice" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td><label for="category">Category </label> </td>
                    <td><select id="category" name="category"    class="form-control"></select></td>
                    
                    
                </tr>
                <tr>
                    <td><label for="brand">Brand</label> </td>
                    <td>
                    <input type="text" id="brand" name="brand" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" onclick="addCategory()"
                               id="mybtn" name="mybtn" value="ADD" class="btn btn-success" /></td>
                </tr>
            </table>
             <div id="error"></div>
                      </form>
                </div>
            </div>
        </div>
    </body>
</html>
