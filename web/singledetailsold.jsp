<% User user = (User) session.getAttribute("user");%>

<%@include file="navbar.jsp" %>
<sql:setDataSource var="db" 
                   driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/student"
                   user="root"  password=""/>
<sql:query var="books" dataSource="${db}">
    SELECT * from books where id ="${param.id}"
</sql:query>
   
    

<%--<c:set var="id" value="${ request.getParameter('id')}"></c:set>--%>
<%--<c:out value="dskj" />--%>   



<c:forEach varStatus="status" items="${books.rows}" var="row"> 


    <%--<c:out value="${row.title}" />--%> 
    
    <div class="container mt-5">
        <h2>${row.title}</h2>
        <img class="d-block h-10 w-50" src="https://thumbs.dreamstime.com/b/open-book-hardback-books-wooden-table-education-background-back-to-school-copy-space-text-76106466.jpg" alt="First slide">
        
        <br><br><br><br>
        <!--<div class="container" >-->
                    <div class="d-flex flex-row " >

        <h6>Price: Rs. ${row.price}</h6>
        <button type="button" class="btn btn-primary btn-md">Buy Now</button>
        </div>
                <!--</div>-->
                <br><br>
                <h5>Descritpion</h5>
        <p>${row.description}</p>
        
    </div>




    <!--<tr>-->
    <!--</tr>-->
</c:forEach> 



    
    
    
    



<%--</c:forEach>--%> 

<!--<h1>Hello World!</h1>-->

</html>
