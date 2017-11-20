<%@page import="model.customer.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" %>
<%@page import="model.book.*" %>
<%@page import="control.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            BookDAO bd = new BookDAO();
            Category[] categoryList = bd.getListCategory();
            System.out.println(categoryList);
            ArrayList<Book> bookList = (ArrayList<Book>) (session.getAttribute("bookList"));
            if (bookList == null) {
                bookList = bd.getAllBook();
            }
        %>
        <nav class="navbar navbar-default nav-top" role="navigation">
            <div class="container-fluid">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <ul class="nav navbar-nav navbar-right">
                    <% Customer customer = (Customer) session.getAttribute("customer");
                        if (customer == null) {
                    %>
                    <li>
                        <a href="register_form.jsp" target="blank">
                            <span class="glyphicon glyphicon-user"></span> Sign up
                        </a>
                    </li>

                    <li>
                        <a href="#" onclick="document.getElementById('modal-login').style.display = 'block'">
                            <span class="glyphicon glyphicon-log-in"></span> Log in
                        </a>
                    </li>

                    <div id="modal-login" class="w3-modal">
                        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
                            <div class="w3-center"><br>
                                <span onclick="document.getElementById('modal-login').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
                                <h2>Đăng nhập</h2>
                            </div>

                            <form class="w3-container" action="CustomerLoginServlet">
                                <div class="w3-section">
                                    <label><b>Username</b></label>
                                    <input class="w3-input w3-border w3-margin-bottom" type="text" name="username" required>
                                    <label><b>Password</b></label>
                                    <input class="w3-input w3-border" type="password" name="password" required>
                                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Log in</button>
                                </div>
                            </form>

                            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                                <button onclick="document.getElementById('modal-login').style.display = 'none'" type="button" class="w3-button w3-red">Cancel</button>
                            </div>
                        </div>
                    </div>
                    <% } else { %>
                        <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome <%= customer.getFullname() %> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">View profile</a></li>
                            <li><a href="CustomerLogoutServlet">Log out</a></li>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>

    <div class="fluid-container">
        <div class="jumbotron">
            <h1 style="margin-left: 50px">Book store</h1>
        </div>
    </div>
    <nav class="navbar navbar-default" role="navigation" >
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Home</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav" >
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <%if (categoryList != null) {
                                    for (Category c : categoryList) {%>
                            <li><a href="index.php?category_id=<%= c.getId()%>"><%= c.getName()%></a></li>
                                <%}
                                    }%>
                        </ul>
                    </li>
                    <p class="navbar-text">Search books</p>

                </ul>
                <form class="navbar-form navbar-left" role="search" action="index.jsp" method="GET">
                    <div class="form-group">
                        <input type="text" name="book_name" class="form-control" placeholder="Enter book's name">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
                <ul class="nav navbar-nav">
                    <li><a href="#">About us</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <button class="btn btn-success navbar-btn" onclick="document.getElementById('modal-cart').style.display = 'block'">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span class="badge" id="cart-item-count">0</span>
                    </button>

                    <div id="modal-cart" class="w3-modal">
                        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                            <div class="w3-center"><br>
                                <span onclick="document.getElementById('modal-cart').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
                                <h2>Đăng nhập</h2>
                            </div>

                            <form class="w3-container" action="">
                                <div class="w3-section">
                                    <label><b>Username</b></label>
                                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="" name="username" required>
                                    <label><b>Password</b></label>
                                    <input class="w3-input w3-border" type="password" placeholder="" name="password" required>
                                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Đăng nhập</button>
                                </div>
                            </form>

                            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                                <button onclick="document.getElementById('modal-cart').style.display = 'none'" type="button" class="w3-button w3-red">Cancel</button>
                            </div>

                        </div>
                    </div>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>
</body>
</html>