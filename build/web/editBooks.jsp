<%@include file="navbar.jsp" %>
<!--NavBar Ends-->
<sql:setDataSource var="db" 
                   driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/student"
                   user="root"  password=""/>
<sql:query var="books" dataSource="${db}">
    SELECT * from books where id ="${param.id}"
</sql:query>



<!--Body Starts-->
<!--<div class="pt-6">-->
<br><br><br>
<div class="mx-auto" style="width: 400px;">
    <h2>Edit book details</h2>
    <c:forEach varStatus="status" items="${books.rows}" var="row"> 
            <%--<c:out value="${row.id}"/>--%>


        <form action="editbooksprocess.jsp" method="post">
            <div class="form-group">
                <label for="exampleInputPassword1">Book Title</label>
                <input type="text" name="title" class="form-control" id="name" placeholder="Name" value="${row.title}">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Description</label>
                <input type="text" name="description" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter description" value="${row.description}">
                <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Author</label>
                <input type="text" name="author" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter author" value="${row.author}">
                <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Price</label>
                <input type="number" name="price" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price" value="${row.price}">
                <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
            </div>



            <div class="form-check">
                <input type="hidden" class="form-check-input" value="${row.id}" name="id" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Check me out</label>
            </div>
            <button type="submit" class="btn btn-primary">Edit books details</button>
        </form>
    </c:forEach>

</div>
<!--</div>-->

<%--<%@include file="footer.jsp" %>--%>
