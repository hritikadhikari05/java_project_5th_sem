<%@include file="navbar.jsp" %>
<!--NavBar Ends-->

<!--Body Starts-->
<sql:setDataSource var="db" 
                   driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/student"
                   user="root"  password=""/>
<sql:query var="allbooks" dataSource="${db}">
    SELECT * from books
</sql:query>
<div class="container mt-5">
    <h4>List of books</h4>




    <table class="table">
        <thead>
            <tr>
                <!--<th scope="col">#</th>-->
                <th scope="col">Title</th>
                <th scope="col">Price</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach varStatus="status" items="${allbooks.rows}" var="row"> 

                <tr>
                    <!--<th scope="row">1</th>-->
                    <td>${row.title}</td>
                    <td>${row.price}</td>
                    <td><a href="editBooks.jsp?id=${row.id}" >Edit</a></td>
                    <td>
                        <form method="POST" action="deletebookprocess.jsp?id=${row.id}">
                            <button type="sumbit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>

                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>