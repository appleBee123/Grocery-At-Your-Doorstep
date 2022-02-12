<%-- 
    Document   : AdminLogout
    Created on : Dec 3, 2019, 5:08:32 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
   
session.removeAttribute("admin");
response.sendRedirect("adminLogin.jsp");
%>