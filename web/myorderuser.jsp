<%-- 
    Document   : myorderuser
    Created on : Nov 29, 2019, 5:46:31 PM
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
        
    </head>
    <body>
        <%@include file="UserHeader.jsp" %>
       <div class="container">

            <%                ResultSet rs = DBLoader.executeQuery("select * from ordertable where username=\'" + session.getAttribute("username") + "\'");
                while (rs.next()) {
                    int orderid = rs.getInt("order_id");
            %>
            <br>
            <div class="row" style="border-radius: 10px; border: 1px solid #000;box-shadow: 1px 1px 3px #000;" >
                <div class="col-sm-12">
                    <div class="row" style="background: #f1f1f1;border-radius: 10px 10px 0px 0px;;padding: 20px;" >
                        <div class="col-sm-6">
                            <div style="font-size: 20px;">Total: Rs.<%=rs.getString("paidamount")%></div><br>
                            <div><%=rs.getString("datetime")%></div>
                        </div>
                        <div class="col-sm-6" >
                            <div  style="text-align:right">Order Id: <%=rs.getString("order_id")%></div>
                            <%
                                ResultSet rs1 = DBLoader.executeQuery("select * from user where username=\'" + session.getAttribute("username") + "\'");
                                if (rs1.next()) {
                            %>
                            <div style="text-align: right;"><%=rs1.getString("phoneno")%></div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div style="border: 1px solid #eee;border-radius: 5px;margin: 10px;" >  
                        <h4 style="padding: 10px;">Contact Details</h4>
                        <label style="margin-left: 1.5%;"><%=rs.getString("address")%>,<%=rs.getString("city")%></label><br>

                    </div>


                    <div id="viewdetailsdiv" style="margin:10px 20px;border: 1px solid rgba(0,0,0,0.1); border-radius: 4px;">
                      <div id="viewdetailsshow<%=orderid%>" style="padding: 20px;background: #eee;" >
                            View Details 
                            </div>
                        <div id="viewdetailscontainer<%=orderid%>" class="viewdetailscontainerclass" style="padding: 20px;">


                            <table class="table table-bordered">
                                <th>Image</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                    <%
                                        ResultSet rs2 = DBLoader.executeQuery("select * from order_detail where order_id=" + orderid);
                                        while (rs2.next()) {
                                            int pid = rs2.getInt("prod_id");
                                            int offerprice = rs2.getInt("offerprice");
                                    %>
                                <tr>
                                    <%
                                        ResultSet rs3 = DBLoader.executeQuery("select * from products where productid=" + pid);
                                        if (rs3.next()) {
                                    %>
                                    <td><img src="<%=rs3.getString("primaryphoto")%>" style="width: 50px;height: 50px;"/></td> 
                                    <td><%=rs3.getString("productname")%></td> 
                                    <%
                                        }
                                    %>

                                    <%
                                        if (offerprice == 0) {
                                            int p = rs2.getInt("mrp");
                                            int qty = rs2.getInt("quantity");
                                            int total = p * qty;

                                    %>    
                                    <td><%=p%></td> 
                                    <td><%=qty%></td> 
                                    <td><%=total%></td>
                                    <%} else {
                                        int op = rs2.getInt("offerprice");
                                        int qty = rs2.getInt("quantity");
                                        int total = op * qty;
                                    %>  
                                    <td><%=op%></td> 
                                    <td><%=qty%></td> 
                                    <td><%=total%></td>
                                    <%}%>
                                </tr>
                                <%
                                    }
                                %>



                            </table>

                        </div>


                    </div> 
                </div>


            </div>

        <script>

            $("#viewdetailsshow<%=orderid%>").click(function () {
                $("#viewdetailscontainer<%=orderid%>").slideToggle();
            });

        </script>
                                
            <%
                }
            %>
        </div><br>





        <%--<%@include file="footer.jsp" %>--%> 

   

    </body>
</html>
