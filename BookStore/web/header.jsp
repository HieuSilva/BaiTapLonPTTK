<%@page import="model.order.BookOrder"%>
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
            ArrayList<Book> bookList = bd.getAllBook();
            
            if(request.getParameter("category_id") != null) {
                int categoryId = Integer.parseInt(request.getParameter("category_id"));
                bookList = bd.getBookByCategory(categoryId);
            }
            if(request.getParameter("book_name") != null) {
                String bookName = (String) request.getParameter("book_name");
                bookList = bd.getBookByName(bookName);
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
                        <a href="register_form.jsp" target="blank" style="color:white">
                            <span class="glyphicon glyphicon-user"></span> Sign up
                        </a>
                    </li>

                    <li>
                        <a href="#" onclick="document.getElementById('modal-login').style.display = 'block'" style="color:white">
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
                                    <input type="hidden" name="return-url" value="index.jsp">
                                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Log in</button>
                                </div>
                            </form>

                            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                                <button onclick="document.getElementById('modal-login').style.display = 'none'" type="button" class="w3-button w3-red">Cancel</button>
                            </div>
                        </div>
                    </div>
                    <% } else {%>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white">Welcome <%= customer.getFullname()%> <b class="caret"></b></a>
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
            <a href="index.jsp" style="color:white; text-decoration: none"><h1 style="margin-left: 50px">Book store</h1></a>
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
                            <li><a href="index.jsp?category_id=<%= c.getId()%>"><%= c.getName()%></a></li>
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
                        <span class="badge" id="cart-item-count">
                            <% ArrayList<BookOrder> cartList = (ArrayList<BookOrder>) session.getAttribute("cartList");
                                int cartItemCount = 0;
                                if (cartList != null) {
                                    cartItemCount = cartList.size();
                                }
                            %>
                            <%= cartItemCount%>
                        </span>
                    </button>

                    <div id="modal-cart" class="w3-modal">
                        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:80%">
                            <div class="w3-center"><br>
                                <span onclick="document.getElementById('modal-cart').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
                                <h2>Your cart</h2>
                            </div>
                            <%
                                if(cartItemCount > 0) {
                                    float total = 0f;
                            %>
                            <form class="w3-container" action="">
<!--                                <div class="w3-section">
                                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Đăng nhập</button>
                                </div>-->
                                
                                <div class="container-fluid">
                                    <table id="cart" class="table table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th style="width:50%">Product</th>
                                                <th style="width:10%">Price</th>
                                                <th style="width:8%">Quantity</th>
                                                <th style="width:22%" class="text-center">Subtotal</th>
                                                <th style="width:10%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for(BookOrder bo : cartList) {
                                                total += bo.getPrice() * bo.getQuantity();
                                            %>
                                            <tr>
                                                <td data-th="Product">
                                                    <div class="row">
                                                        <div class="col-sm-2 hidden-xs"><img src="edu/<%= bo.getBook().getImage()%>" alt="..." class="img-responsive"/></div>
                                                        <div class="col-sm-10">
                                                            <h4 class="nomargin"><%= bo.getBook().getTitle()%></h4>
                                                            
                                                        </div>
                                                    </div>
                                                </td>
                                                <td data-th="Price"><%= bo.getPrice()%></td>
                                                <td data-th="Quantity">
                                                    <input type="number" class="form-control text-center" value="<%= bo.getQuantity()%>">
                                                </td>
                                                <td data-th="Subtotal" class="text-center"><%= bo.getPrice() * bo.getQuantity()%></td>
                                                <td class="actions" data-th="">
                                                    <button class="btn btn-info btn-sm"><i class="glyphicon glyphicon-refresh"></i></button>
                                                    <button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i></button>								
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                        <tfoot>
                                            <tr class="visible-xs">
                                                <td class="text-center"><strong>Total</strong></td>
                                            </tr>
                                            <tr>
                                                <td><a href="#" class="btn btn-warning" onclick="document.getElementById('modal-cart').style.display = 'none'"><span class="glyphicon glyphicon-arrow-left"></span> Continue Shopping</a></td>
                                                <td colspan="2" class="hidden-xs"></td>
                                                <td class="hidden-xs text-center"><strong><%= total%></strong></td>
                                                <td><a href="checkout.jsp" class="btn btn-success btn-block">Checkout <span class="glyphicon glyphicon-arrow-right"></span></a></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </form>
                            <% } else {%>
                                <h2 style="text-align: center">Your cart is empty</h2>
                            <%}%>
                            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                                <a class="btn btn-danger" href="order_detail.jsp"><span class="glyphicon glyphicon-pencil"></span> Edit you cart</a>
                            </div>

                        </div>
                    </div>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>
</body>
</html>