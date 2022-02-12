<%-- 
    Document   : UserLogout
    Created on : Dec 3, 2019, 5:13:30 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
   
session.removeAttribute("username");
response.sendRedirect("index.jsp");
%>
