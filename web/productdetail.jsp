<%-- 
    Document   : productdetail
    Created on : Nov 28, 2019, 6:15:56 PM
    Author     : lenovo
--%>

<%@page import="vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
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
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <script>

        var xhr = new XMLHttpRequest();
        function addtocart(productid)
        {
            <%if(session.getAttribute("username")==null){%>
                    window.location.href="userSignup.jsp";
                    <%} else{%>
            xhr.open("POST", "./addtocart?productid=" + productid, true);
            xhr.onreadystatechange = function ()
            {
                if (xhr.status === 200 && xhr.readyState === 4)
                {
                    alert(xhr.responseText);
                    if (xhr.responseText.trim() === "success")
                    {
                        document.getElementById("label2").innerHTML = "<h4 style=\"color:green\">Added To Cart</h4>";
                          viewcart(); 
                    }

                }
            };
            xhr.send();

<%}%>
        }
       

        function review()
        {

            xhr.open("POST", "./checkuserlogin", true);
            xhr.onreadystatechange = function ()
            {
                if (xhr.status === 200 && xhr.readyState === 4)
                {

                    if (xhr.responseText.trim() === "fail")
                    {
                        <% session.setAttribute("review","login");%>
                        window.location.href="userSignup.jsp";
                    }
                    else
                    {
                      $("#myModalr").modal("show");
                    }

                }
            };
            xhr.send();
        }

        var n = 0;
        function fill(obj)
        {
            var img = obj.src;
            var id = obj.id;
            var val = parseInt(id.substring(id.indexOf("_") + 1));
            var i;
            if (n === 0)
            {
                i = 1;
            } else
            {
                i = n + 1;
            }
            for (; i <= 5; i++)
            {
                if (i <= val)
                {
                    document.getElementById("rating_" + i).src = "rating/filled_star.png";

                } else
                {
                    document.getElementById("rating_" + i).src = "rating/empty_star.png";
                }
            }

        }
        function selected(obj)
        {
            var id = obj.id;
            var val = parseInt(id.substring(id.indexOf("_") + 1));
            n = val;
        }
        function unfill(obj)
        {
            var i;
            if (n === 0)
            {
                i = 1;
            } else
            {
                i = n + 1;
            }
            for (; i <= 5; i++)
            {
                document.getElementById("rating_" + i).src = "rating/empty_star.png";
            }
        }

        function goreview()
        {
            if (n === 0)
            {
                document.getElementById("label1").style.display = "block";

            } else
            {
                var comment = document.getElementById("comment").value;
                var productid = document.getElementById("pid").value;


                var xhr = new XMLHttpRequest();
                xhr.open("POST", "./addreview?rating=" + n + "&comment=" + comment + "&pid=" + productid, true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.status === 200 && xhr.readyState === 4)
                    {
                        alert(xhr.responseText.trim());

                        if (xhr.responseText.trim() === "success")
                        {
                           document.getElementById("label1").style.display = "none";
                           document.getElementById("label2").innerHTML = "<h4 style=\"color:green\">Review Added</h4>";
                      
                           $("#myModalr").modal("hide");
                           

                        } 
                        else
                        {
                             $("#myModalr").modal("hide");
                            document.getElementById("label2").innerHTML = "<h4 style=\"color:red\"> Review already added</h4>";
                          


                        }
                    }
                };

                xhr.send();




            }
        }
    </script>

    <body>
        <%@include file="UserHeader.jsp" %>
      
            <div class="container" > 



                <%                   int productid = Integer.parseInt(request.getParameter("pid"));
                    ResultSet rs = DBLoader.executeQuery("select * from products where productid=" + productid);
                    if (rs.next()) {
                       String sid = rs.getString("shopkeeperid");
                        int offerprice = rs.getInt("offerprice");
                %>
                <div class="row">
                    <div class="col-sm-2">
                        <img src="<%=rs.getString("primaryphoto")%>" class="img-responsive img-rounded" style="width: 100%;height: 210px;
                             border: 2px white solid; box-shadow: 0.5px 0.5px 0.5em "/>
                    </div> 
                    <div class="col-sm-8">
                        <br>
                        <label style="font-weight:lighter;font-size:large;color: yellowgreen;"><%=rs.getString("productname")%></label><br>
                        <label style="font-weight:lighter;font-size:small;color:royalblue;"><%=rs.getString("brand")%></label><br>
<%
ResultSet rs1 = DBLoader.executeQuery("select * from shopkeeper where shopkeeperid='" + sid + "'");
if(rs1.next())
{
%>
      
     <%}%> 
      <br>                   

                        <label style="font-weight:lighter;font-size:medium;"><%=rs.getString("productdes")%></label><br>
                        <%
                            if (offerprice==0) {
                        %> 

                        <label style="font-weight:lighter;font-size:large;">Rs.<%=rs.getString("mrp")%></label>
                        <%
                        } else {
                        %>
                        <label style="font-weight:lighter;font-size:large;text-decoration: line-through;color: lightgray;">Rs.<%=rs.getString("mrp")%></label>
                        <label style="font-weight:lighter;font-size:large;color: tomato;">Rs.<%=offerprice%></label>
                        
                           

                        <%
                            }
                        %>
                        <br><br>
                        <input type="button" class="btn btn-success" value="ADD TO CART" 
                                style="border-radius: 10px;text-shadow: 2px 2px 5px black;"
                               onclick="addtocart(<%=productid%>)"/>
                        
                        
                        
                         <input type="button" class="btn btn-success" value="ADD REVIEW"
                        style="border-radius: 10px;text-shadow: 2px 2px 5px black;" onclick="review()"/>
                <input type="text"  value="<%=request.getParameter("pid")%>" hidden="" id="pid" name="pid"/>
                
                
                    </div>

                </div><hr>
                <%
                    }
                %>
                <div>
                  
                <div class="row">
                    <div class="col-sm-12">
                        
                        
                 
                    </div>
                </div>
                    <br>
                   <label id="label2"> </label>
            </div>

                <h2 style="margin-left: 40%;font-style: normal;">Previous Review</h2>  <br>
            <div class="row" style="width:80%; margin: auto; border: solid 1px yellowgreen;background:white"  >

        
        <%
            int flag = 0;
            ResultSet rs6 = DBLoader.executeQuery("select * from review where pid=" + productid);

            while (rs6.next()) {
                flag = 1;
        %>
        
        <div class="col-sm-12"  >

            <br><br>
            
            

            <%
                int star = rs6.getInt("ratingvalue");
                for (int i = 1; i <=star; i++)
                {
                    
               %>     
                        
              <img src="rating/filled_star.png" width="30px;" height="30px;">
           <%   
             }
    for(int j=star+1;j<=5;j++)
{
            %>

            <img src="rating/empty_star.png" width="30px;" height="30px;">
            
            
            
            
            
            
            <%
                }
            %>

            <br> 

            <%
                ResultSet rs7 = DBLoader.executeQuery("select * from user where username=\'" + rs6.getString("postedby") + "\'");
                rs7.next();
            %>
             <div class="row" style="">
                 <div class="col-sm-8">
                     <p> <%= rs6.getString("review_text")%> </p> <br>
                 </div>
                <div class="col-sm-2" style="text-align: right;" >
                    
                    <img src="<%= rs7.getString("photo")%>" class="img-responsive img-circle" style=" width: 50px;float:right; height: 50px; ">

                </div>
                <div class="col-sm-2"><p style="font-size: small;">By  <%= rs6.getString("postedby")%> </p><p style="font-size: small;"> <%= rs6.getString("datetimerating")%> </p> 
                </div>


            </div>

            <hr>

        </div>

        <%

            }

        %>

    </div>

    <%            if (flag == 0) {
    %>

    <label style="margin-left: 9%">No Review Yet !!!</label>

    <%
        }
    %>
                    
                    
                    
                </div> 

                
                

       
      
      
    <div >

            <div class="modal" id="myModalr" >
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header " style="background: yellowgreen;" >
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="color: white;"> Add Review</h4>
                        </div>
                        <div class="modal-body " >
                            <div>



                                <div id="all">

                                    <form action="" method="post" id="form1">
                                        <table>
                                            <tr> <label class="form-group"> Give Ratings..</label>
                                            <td>
                                                <img id="rating_1" src="rating/empty_star.png" onmouseover="fill(this);" onmouseout="unfill(this);" onclick="selected(this);" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img id="rating_2" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img id="rating_3" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img id="rating_4" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            <td>
                                                <img  id="rating_5" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                            </td>
                                            </tr>
                                        </table>
                                        <br>
                                        <label> Write Comment : </label> <input style="border-radius: 20px;" type="text" id="comment"  class="form-group"/>
                                        <input type="button" value="Submit" class="btn btn-primary"
                                               style="border-radius: 10px;text-shadow: 2px 2px 5px black" onclick="goreview()" />
                                        <label style="display: none;color: tomato;" id="label1">Please Select Any Rating</label>

                                    </form>
                                </div>
                             
                            </div>   
                        </div>
                            <!--</div>-->
                            <div class="modal-footer " style="background: yellowgreen;" >
                                <button type="button" class="btn btn-default" style="border-radius: 10px;" data-dismiss="modal" style="" >Close</button>
                            </div>
                        

                    </div>
                </div>
            </div>

        </div>        

  
    </body>
</html>
