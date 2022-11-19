<%-- 
    Document   : Homepage
    Created on : Nov 3, 2022, 4:09:05 AM
    Author     : Hritik
--%>

<%@page import="Signup.User"%>
<% User user = (User) session.getAttribute("user");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="navbar.jsp" %>

<body>

    <sql:setDataSource var="db" 
                       driver="com.mysql.jdbc.Driver" 
                       url="jdbc:mysql://localhost:3306/student"
                       user="root"  password=""/>
    <sql:query var="books" dataSource="${db}">
        SELECT * from books
    </sql:query>
    <div class="container mt-5">

        <div class="row">
            <c:forEach varStatus="status" items="${books.rows}" var="row"> 
                <%--<c:out value="${row.title}" />--%> 

                <div class="col-sm mt-5">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="https://thumbs.dreamstime.com/b/open-book-hardback-books-wooden-table-education-background-back-to-school-copy-space-text-76106466.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${row.title}</h5>
                            <h6 class="card-title">Rs. ${row.price}</h6>

    <!--<p class="card-text">${row.description}</p>-->
                            <!--<a href="#" class="btn btn-primary">Go somewhere</a>-->
                            <a href="singledetails.jsp?id=${row.id}" class="btn btn-primary">More</a>

                        </div>
                    </div>
                </div>


                <!--<tr>-->
                <!--</tr>-->
            </c:forEach> 
        </div>
    </div>



</body>
</html>
