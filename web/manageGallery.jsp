<%-- 
    Document   : manageGallery
    Created on : Nov 12, 2019, 9:47:36 PM
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
            <% int pid1= Integer.parseInt(request.getParameter("pid")); 
      %>
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
            function addPhoto(pid)
            {
                
                var caption = document.getElementById("caption").value;
                var img=document.getElementById("photo").files.length;
                
                
                 if(img==0)
                {
                    alert("Please select a photo");
                }
                else if(caption=="")
                {
                    alert("Please enter a caption");
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
                    var xhr1 = new XMLHttpRequest;
                    xhr1.onreadystatechange = function ()
                    {
                        if (xhr1.readyState === 4 && xhr1.status == 200)
                        {
                            //get response from server
                            
                            var res1 = xhr1.responseText.trim();
                            //alert(res1);
                            if (res1 === "success")
                            {
                                document.getElementById("caption").value = "";
                                document.getElementById("photo").value = "";
                                document.getElementById("image1").src = "";
                                alert("Photo Added");
                                fetchGallery();
                                
                            } else
                            {
                                
                                                             alert("Failed to Add Photo");
   
                                
                               
                               
                                
                            }
                        }
                    };
                    xhr1.open("POST", "./manageGalleryResponse?pid="+pid+"&caption="+caption, true);
                    xhr1.send(formdata);
                }
//                fetchGallery();
            }
                
            }
            var jsonar;
            function fetchGallery()
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
//                            continue;
                        } else
                        {
                            var tab = "";
                            
                            for (var i = 0; i < jsonar.length; i++)
                            {
                                var galleryobj = jsonar[i];
                                tab += "<div class=\"col-md-3\" style='margin: 20px; border: 1px solid black;'><img style='position: absolute; right: 2%; top: 2%; z-index: 4' src='images/cancel-close-button-png.png' height='50' width='50' onclick=\"deleteimg("+galleryobj.productgalleryid+")\"/>";
                                tab += "<div>"+"<img src='" + galleryobj.photo +"' height='150' width='200'/></div>";
                                tab += "<div>" + galleryobj.caption + "</div>";
                                  tab += "</div>";

                                
                               
                            }
                            
                            document.getElementById("div1").innerHTML = tab;
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchGallery?pid="+<%=pid1%>, true);
                xmlhttp.send();
            }
            
            function deleteimg(pid){
                
                var ans=confirm("Are you sure to delete ?");
                if(ans){
                 var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        
                        if (res=="success")
                        {
                            fetchGallery();
//                            continue;
                        } else
                        {
                          alert("Failed");
                            }
                            
                        }
                    
                };
                xmlhttp.open("GET", "./deletegalleryimg?pgid="+pid, true);
                xmlhttp.send();
            }
            }
        </script>
    </head>
    <body onload="fetchGallery(),fetch()">
        
       
      
       
    
    <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Add Pictures</h2>
         <form id="form1"  method="POST" enctype="multipart/form-data">
            <table class="table table-bordered" border="1">
                
                <tr>
                <td><label for="caption"> Caption</label></td>
                    <td><textarea id="caption" name="caption" class="form-control" ></textarea></td>
                        
                </tr>
                <tr>
                <td><label for="photo">Photo</label></td>
                    <td><input type="file" id="photo" onchange="readandpreview(this,'image1')" name="photo" /><br/>
                        <img src="" id="image1" name="image1" height="60" width="60" />
                    </td>
                </tr>
                
                
                
                
               
                <tr>
                    <td></td>
                    <td><input type="button" onclick="addPhoto(<%=pid1%>)"
                               id="mybtn" name="mybtn" value="ADD" /></td>
                </tr>
            </table>
             <div id="error"></div>
                      </form>
                </div>
            </div>
       
       <hr>
      
                    <h2 class="text-center">Already Added Gallery</h2>
                    <div id="div1" class="row">
                        
                        
                    </div>
                
    </div>
       </body>
</html>
