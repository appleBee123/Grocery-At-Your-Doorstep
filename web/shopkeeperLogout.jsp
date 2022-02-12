<%-- 
    Document   : shopkeeperLogout
    Created on : Dec 11, 2019, 9:56:32 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
   
session.removeAttribute("name");
response.sendRedirect("index.jsp");
%>
