<%-- 
    Document   : manageCategories
    Created on : Oct 23, 2019, 1:34:37 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
           
            .modal-content{
                margin-top: 50px !important;
            }
      
            .caret{
                display: none !important;
            }
        </style>
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
            function addCategory()
            {
                var categoryName = document.getElementById("categoryname").value;
                var description = document.getElementById("description").value;
                var img=document.getElementById("photo").files.length;
//                alert(img);
                if(categoryName=="" || description=="" || img==0 )
                {
                    alert("All Fields Are Mandatory");
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
                            var res = xhr.responseText.trim();
                            
                            if (res == "fail")
                            {
                                document.getElementById("error").innerHTML = "<div class=\"alert alert-danger\"> Already Exist</div>";
                            } else
                            {

                                document.getElementById("categoryname").value = "";
                                document.getElementById("description").value = "";
                                
                                document.getElementById("photo").value = "";
                                document.getElementById("image1").src="";
                                alert("Category Added!");
                                document.getElementById("error").innerHTML = "<div class=\"alert alert-success\">Category Added Successfully</div><br>\n";
            fetchcategory();                
            }
                        }
                    };
                    xhr.open("POST", "./addCategoriesResponse", true);
                    xhr.send(formdata);
                }
                }
                
            }
            
             var jsonar; //category array global
            function fetchcategory()
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
                            var tab = "<table border=1 class='table table-bordered'>";
                            tab += "<thead class='bg-dark text-white-50'><tr><td><strong>Category<strong></td><td><strong>Description<strong></td><td><strong>Photo</td><td></td><td></td></tr></thead>";
                            tab += "<tbody class='bg-light text-success'>";
                            for (var i = 0; i < jsonar.length; i++)
                            {
                                var categoryobj = jsonar[i];
                                tab += "<tr><td>" + categoryobj.catname + "</td>";
                                tab += "<td>" + categoryobj.description + "</td>";
                                tab += "<td>"+"<img src='" + categoryobj.photo +"' height='100' width='100'/>"+ "</td>";
                                tab += "<td><input type='button' style='border-radius: 0.5' onclick='showeditmodal(" + i + ")'  value='Edit' class='btn btn-primary'/></td>";
                                tab += "<td><input type='button' style='border-radius: 0.5' onclick='deletecategory(" + i + ")' value='Delete' class='btn btn-danger'/></td></tr>";
                            }
                            tab += "</tbody>";
                            tab += "</table>";
                            document.getElementById("divtable").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchAllCategories", true);
                xmlhttp.send();
            }
            function showeditmodal(index)
            {
                
                var obj = jsonar[index];
                var category = obj.catname;
                var description = obj.description;
                var photo = obj.photo;
                
                //set category info into bootstrap modal fields
                document.getElementById("editcategory").value = category;
                document.getElementById("editdescription").value = description;
                document.getElementById("image2").src = photo;
                
                //display modal
                $("#editcategorymodal").modal('show');
            }
            function updatecategory()
            {
                var category = document.getElementById("editcategory").value;
                var description = document.getElementById("editdescription").value;
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
                            //alert(res1);
                            if (res1 === "fail")
                            {
                                alert("Failed !")
                                document.getElementById("error1").innerHTML = "Update Failed";
                            } else
                            {

                                //document.getElementById("editcategory").value = "";
                                document.getElementById("editdescription").value = "";
                                document.getElementById("editphoto").value = "";
                                document.getElementById("image2").src = "";
                                alert("Update Successful");
                                document.getElementById("error1").innerHTML = "Update Successful";
                                $("#editcategorymodal").modal("hide");
                                fetchcategory();
                               
                                
                            }
                        }
                    };
                    xhr1.open("POST", "./editWithPhoto", true);
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
                                alert("Update category failed");
                            } else
                            {
                                alert("Category Updated Successfully!!");
                               //document.getElementById("editcategory").value = "";
                                document.getElementById("editdescription").value = "";
                                document.getElementById("editphoto").value="";
                                document.getElementById("image2").src = "";
                                $("#editcategorymodal").modal("hide");
                                fetchcategory();
                            }
                        }
                    };
                    xmlhttp.open("GET", "./editWithoutPhoto?category=" + category + "&description=" + description, true);
                    xmlhttp.send();
                }
            
            function deletecategory(index)
            {
                var obj = jsonar[index];
                var category = obj.catname;
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
                                alert("delete category failed");
                            } else
                            {
                                alert("Category Deleted Successfully!!");
                                fetchcategory();
                            }
                        }
                    };
                    xmlhttp.open("GET", "./deleteCategory?category=" + category, true);
                    xmlhttp.send();
                }
            }
        </script>
    </head>
    <body onload="fetchcategory()">
        <%@include file="adminHeader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Add Category</h2>
         <form id="form1"  method="POST" enctype="multipart/form-data">
            <table class="table table-bordered" border="1">
                <tr>
                    <td><label for="categoryname"> Category Name</label></td>
                    <td><input type="text" id="categoryname" name="categoryname" class="form-control"/></td>
                </tr>
                <tr>
                <td><label for="description"> Description</label></td>
                    <td><textarea id="description" name="description" class="form-control"></textarea></td>
                        
                </tr>
                <tr>
                <td><label for="photo">Photo</label></td>
                    <td><input type="file" id="photo" onchange="readandpreview(this,'image1')" name="photo" /><br/>
                        <img src="" id="image1" name="image1" height="60" width="60" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" onclick="addCategory()"
                               id="mybtn" name="mybtn" value="ADD" class="btn btn-success"/></td>
                </tr>
            </table>
             <div id="error"></div>
                      </form>

             <hr/>
            <div class="row" style="border: 2px solid black;" id="divtable">

<!--                <div class="col-md-12" id="divtable">

                </div>-->
            </div>
        </div>


        <!--Edit Category Modal-->
        <div class="modal fade" id="editcategorymodal" role="dialog">
            
            <div class="modal-dialog">
                <!--Modal Content-->
                <div class="modal-content">
                    <!--Modal Header-->
                    <div class="modal-header">
                        <h4 class="modal-title">Update Category</h4>
                        <button type="button" class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body">
                        <form id="form2"  method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="editcategory">Category</label>
                                <input type="text" readonly id="editcategory" name="editcategory" class="form-control"> 
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
                            <button type="button" id="mybtn1"  name="mybtn1" onclick="updatecategory()" class="btn btn-primary">Edit Category</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-danger" 
                                data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="error1"></div>
            </div>
        </div>
    </body>
</html>

   


