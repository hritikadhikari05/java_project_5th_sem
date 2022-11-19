<%-- 
    Document   : navbar
    Created on : Nov 4, 2022, 4:08:35 PM
    Author     : Hritik
--%>

<%@page import="Signup.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/sql_rt" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>


        <!--</table>-->

        <!--NavBar Area-->
        <nav class="navbar navbar-dark navbar-expand-lg bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Books Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="homepage.jsp">Homepage</a>
                        </li>


                        <c:if test="${user.getRole()== null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Signup</a>
                            </li>
                        </c:if>
                        

                        <c:if test="${user.getRole() == 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="addBooks.jsp">Add books</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="addCategory.jsp">Add Category</a>
                            </li>
                        </c:if>
                            
                            <c:if test="${user.getRole() == 'admin' || user.getRole() == 'user'}">
                                <%--<c:set value="${user.setRole("")}"/>--%>
                                                                <<form action="LogoutServlet" method="POST">

                                <li class="nav-item">
                                <!--<a class="nav-link" href="login.jsp" >Logout</a>-->
                                <button type="sumbit" >Logout</button>
                            </li>
                                                            </form>

                            
                        </c:if>

                    </ul>
                </div>
            </div>
        </nav>