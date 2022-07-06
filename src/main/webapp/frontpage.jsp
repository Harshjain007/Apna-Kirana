<%-- 
    Document   : frontpage
    Created on : Jul 28, 2021, 6:03:00 PM
    Author     : Dell
--%>

<%@page import="com.mycompany.apnakirana.dao.UserDao"%>
<%@page import="com.mycompany.apnakirana.entities.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="icon" href="img/Logo22.png" type="image/icon type">

    </head>
    <body>
        <%@include file="components/all_css_js.jsp" %>
        <%@include file="components/navbar_basic.jsp" %>
        
        <h1>Welcome <%=user1.getUserName() %> </h1>
        
        
        <%@include file="components/modals.jsp" %>
        
        
    </body>
</html>
