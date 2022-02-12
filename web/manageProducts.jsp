<%-- 
    Document   : manageProducts
    Created on : Nov 4, 2019, 2:34:01 PM
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
            var jsonarproducts;
            var pid;//products array global
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
            function fetchProducts()
            {
                
                <% int shopkeeperid=Integer.parseInt((session.getAttribute("id")).toString());%>
//                alert(id);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        jsonarproducts = mainjson["ans"];
                        if (jsonarproducts.length == 0)
                        {
                            alert("No product found");
                        } else
                        {
                            var tab = "<table border=1 class='table table-bordered'>";
                            tab += "<thead class='bg-dark text-white'><tr><td>Product</td><td>Description</td><td>Photo</td><td>MRP</td><td>Offer Price</td><td>Category</td> <td>Brand</td> <td></td><td></td><td></td></tr></thead>";
                            tab += "<tbody class='bg-light text-dark'>";
                            for (var i = 0; i < jsonarproducts.length; i++)
                            {
                                var productobj = jsonarproducts[i];
                                tab += "<tr><td>" + productobj.productname + "</td>";
                                tab += "<td>" + productobj.productdes + "</td>";
                                tab += "<td>"+"<img src='" + productobj.primaryphoto +"' height='100' width='100'/>"+ "</td>";
                                tab += "<td>" + productobj.mrp + "</td>";
                                tab += "<td>" + productobj.offerprice + "</td>";
                                tab += "<td>" + productobj.category + "</td>";
                                tab += "<td>" + productobj.brand + "</td>";
                                tab += "<td><input type='button' onclick='showeditmodal(" + i + ")'  value='Edit' class='btn btn-primary'/></td>";
                                tab += "<td><input type='button' onclick='deletecategory(" + i + ")' value='Delete' class='btn btn-danger'/></td>";
                                tab += "<td><input type='button' onclick='managegallery(" + i + ")' value='Manage Gallery' class='btn btn-success '/></td></tr>";
                            }
                            tab += "</tbody>";
                            tab += "</table>";
                            document.getElementById("divtable").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchProducts", true);
                xmlhttp.send();
                fetchCategories();
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
                            
                            document.getElementById("editcategory").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchCategories", true);
                xmlhttp.send();
            }
            function showeditmodal(index)
            {
//                alert(index);
                var obj = jsonarproducts[index];
                var product = obj.productname;
                var description = obj.productdes;
                var photo = obj.primaryphoto;
                var mrp = obj.mrp;
                pid=obj.productid;
                var offerprice = obj.offerprice;
                var brand = obj.brand;
//                alert(pid);
                
                //set category info into bootstrap modal fields
                document.getElementById("editproduct").value = product;
                document.getElementById("editdescription").value = description;
                document.getElementById("image2").src = photo;
                document.getElementById("editmrp").value = mrp;
                document.getElementById("editofferprice").value = offerprice;
                document.getElementById("editbrand").value = brand;
                
                
                
                //display modal
                $("#editproductmodal").modal('show');
            }
            function updateproduct()
            {
                
                var product = document.getElementById("editproduct").value;
                var description = document.getElementById("editdescription").value;
                var mrp = document.getElementById("editmrp").value;
                var offerprice = document.getElementById("editofferprice").value;
                var category = document.getElementById("editcategory").value;
                var brand = document.getElementById("editbrand").value;
               
                
//                var photo = document.getElementById("editphoto").value;
                if (document.getElementById("editphoto").files.length>0)
                {
                
                        var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("form2").elements;
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
                    var xhr1 = new XMLHttpRequest;
                    xhr1.onreadystatechange = function ()
                    {
                        if (xhr1.readyState === 4 && xhr1.status == 200)
                        {
                            //get response from server
                            
                            var res1 = xhr1.responseText.trim();
                            alert(res1);
                            if (res1 === "fail")
                            {
                                alert("Update Failed");
                            } else
                            {
                                
                                document.getElementById("editphoto").value = "";
                                document.getElementById("image2").src = "";

                                
                                
                                
                               
                               
                                
                            }
                        }
                    };
                    xhr1.open("POST", "./productEditWithPhoto?pid="+pid, true);
                    xhr1.send(formdata);
                }
            }  
                
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var res = xmlhttp.responseText.trim();
//                            alert(res);
                            if (res != "success")
                            {
                                alert("Update failed");
                            } else
                            {
//                                alert(" Updated Successfully!!");
                                document.getElementById("editproduct").value = "";
                                document.getElementById("editdescription").value = "";
                                document.getElementById("editmrp").value = "";
                                document.getElementById("editofferprice").value = "";
                                document.getElementById("editbrand").value = "";
//                                $("#editcategorymodal").modal("hide");
//                                fetchProducts();
                                 alert("Updated Successfully");
                                
                                $("#editproductmodal").modal("hide");
                                fetchProducts();
                            }
                        }
                    };
                    xmlhttp.open("GET", "./productEditWithoutPhoto?category=" + category + "&description=" + description+"&product="+product+"&mrp="+mrp+"&offerprice="+offerprice+"&brand="+brand+"&pid="+pid, true);
                    xmlhttp.send();
                }
                function deletecategory(index)
            {
                var obj = jsonarproducts[index];
                var product = obj.productname;
                var pid=obj.productid;
                //alert(category);
                var result = confirm("Are you sure to delete?");
                if (result)
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res != "success")
                            {
                                alert("Delete product failed");
                            } else
                            {
                                alert("Product Deleted Successfully!!");
                                fetchProducts();
                            }
                        }
                    };
                    //alert(pid);
                    xmlhttp.open("GET", "./deleteProduct?pid=" + pid, true);
                    xmlhttp.send();
                }
            }
            function managegallery(index)
            {
                var obj = jsonarproducts[index];
                
                var pid=obj.productid;
                var sid=obj.shopkeeperid;
                window.location.href="manageGallery.jsp?pid="+pid;
                
                
            }
        
            
            
        </script>
    </head>
    <body onload="fetchProducts(),fetch()" >
        <%@include file="merchantheader.jsp" %>
         <div class="container">
            <div class="row">
                <div class="col-md-12">
        <div class="row" style="border: 2px solid black;">

                <div  id="divtable" class="table-responsive">

                </div>
            </div>
                </div>
            </div>
         </div>
        
        <!--Edit Category Modal-->
        <div class="modal fade" id="editproductmodal" role="dialog">
            
            <div class="modal-dialog">
                <!--Modal Content-->
                <div class="modal-content">
                    <!--Modal Header-->
                    <div class="modal-header">
                        <h4 class="modal-title">Update Product</h4>
                        <button type="button" class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body">
                        <form id="form2"  method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="editproduct">Product</label>
                                <input type="text" id="editproduct" name="editproduct" class="form-control"> 
                            </div> 
                            <div class="form-group">
                                <label for="editdescription">Description</label>
                                <input type="text" id="editdescription" name="editdescription" class="form-control"> 
                            </div>
                            <div class="form-group">
                                <label for="editphoto">Photo</label>
                                <input type="file" id="editphoto" onchange="readandpreview(this,'image2')" name="editphoto" /><br/>
                        <img src="" id="image2" name="image2" height="60" width="60" />
                            </div> 
                            <div class="form-group">
                                <label for="editmrp">MRP</label>
                                <input type="text" id="editmrp" name="editmrp" class="form-control"> 
                            </div>
                            <div class="form-group">
                                <label for="editofferprice">Offer Price</label>
                                <input type="text" id="editofferprice" name="editofferprice" class="form-control"> 
                            </div>
                            <div class="form-group">
                                <label for="editcategory">Category</label>
                                
                                <td><select id="editcategory" name="editcategory"    class="form-control"></select></td>
                            </div>   
                               <div class="form-group">
                                <label for="editbrand">Brand</label>
                                <input type="text" id="editbrand" name="editbrand" class="form-control"> 
                            </div>
                              
                            <button type="button" id="mybtn1"  name="mybtn1" onclick="updateproduct()" class="btn btn-primary">Edit Product</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-danger" 
                                data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
