<%-- 
    Document   : editbooksprocess
    Created on : Nov 6, 2022, 7:46:45 AM
    Author     : Hritik
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        


        <sql:setDataSource var="db" 
                           driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost:3306/student"
                           user="root"  password=""/>
        <sql:update var="books" dataSource="${db}">

           DELETE from books WHERE id ="${param.id}"
        </sql:update>
        <h1>Hello World!</h1>
        <%--<c:out value="${title}" />--%>
        <c:redirect url="allbooks.jsp"></c:redirect>
    </body>
</html>
