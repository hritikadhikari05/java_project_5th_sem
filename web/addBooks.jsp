<%@include file="navbar.jsp" %>
        <!--NavBar Ends-->

        <!--Body Starts-->
        <!--<div class="pt-6">-->
        <br><br><br>
        <div class="mx-auto" style="width: 400px;">
            <h2>Add books to books store</h2>
            <form action="AddBookServlet" method="post">
                <div class="form-group">
                    <label for="exampleInputPassword1">Book Title</label>
                    <input type="text" name="title" class="form-control" id="name" placeholder="Name">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Description</label>
                    <input type="text" name="description" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter description">
                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Author</label>
                    <input type="text" name="author" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter author">
                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Price</label>
                    <input type="number" name="price" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price">
                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                </div>
                

               
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <!--</div>-->

<%--<%@include file="footer.jsp" %>--%>
