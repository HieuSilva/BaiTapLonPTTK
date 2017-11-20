<%-- 
    Document   : payment
    Created on : Nov 20, 2017, 10:13:10 PM
    Author     : HIEU
--%>
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="theme/bootstrap/css/w3css.css">
        <link rel="stylesheet" href="theme/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="theme/order_detail_css.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            ArrayList<BookOrder> cartList = (ArrayList<BookOrder>) session.getAttribute("cartList");
            int cartItemCount = 0;
            float total = 0f;
            if (cartList != null) {
                cartItemCount = cartList.size();
            }
        %>
        <div class="fluid-container">
            <div class="jumbotron">
                <h1 style="margin-left: 50px">Book store</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <% Customer customer = (Customer) session.getAttribute("customer");
                    if (customer == null) {
                %>
                <div class="w3-center"><br>
                    <h2>Please log in to check out</h2>
                </div>

                <form class="w3-container" action="CustomerLoginServlet">
                    <div class="w3-section">
                        <label><b>Username</b></label>
                        <input class="w3-input w3-border w3-margin-bottom" type="text" name="username" required>
                        <label><b>Password</b></label>
                        <input class="w3-input w3-border" type="password" name="password" required>
                        <input type="hidden" name="return-url" value="checkout.jsp">
                        <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Log in</button>
                    </div>
                </form>

                <% } else {%>
                <div class="container-fluid" >
                    <h3 style="text-align:center; margin-bottom:50px; color:#001a33; font-weight: bold">CUSTOMER INFORMATION</h3>
                    <form class="form-horizontal" role="form" id="reg-form" action="" method="POST">

                        <div class="form-group">
                            <label for="fullname" class="col-sm-3 control-label">Full name</label>
                            <div class="col-sm-9">
                                <input type="text" name="fullname" class="form-control" value="<%=customer.getFullname()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">Username</label>
                            <div class="col-sm-9">
                                <input type="text" name="username" class="form-control" value="<%= customer.getAccount().getUsername()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="birthday" class="col-sm-3 control-label">Birthday</label>
                            <div class="col-sm-9">
                                <input type="text" name="birthday" class="form-control" value="<%= customer.getBirthday()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" name="email" class="form-control" value="<%= customer.getEmail()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">Phone</label>
                            <div class="col-sm-9">
                                <input type="phone" name="phone" class="form-control" value="<%= customer.getPhone()%>">
                            </div>
                        </div>

                        <h3 style="text-align:center; margin:30px 20px">Fill in shipping address</h3>

                        <div class="form-group">
                            <label for="house-number" class="col-sm-3 control-label">House number</label>
                            <div class="col-sm-9">
                                <input type="text" name="house-number" class="form-control" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="street" class="col-sm-3 control-label">Street</label>
                            <div class="col-sm-9">
                                <input type="text" name="street" class="form-control" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="province" class="col-sm-3 control-label">Province</label>
                            <div class="col-sm-9">
                                <input type="text" name="province" class="form-control" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-3 control-label">City</label>
                            <div class="col-sm-9">
                                <input type="text" name="city" class="form-control" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="country" class="col-sm-3 control-label">Country</label>
                            <div class="col-sm-9">
                                <input type="text" name="country" class="form-control" required="true">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-5 col-sm-offset-2">
                                    <a class="btn btn-success btn-block" href="index.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Continue shopping</a>
                                </div>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-warning btn-block" ><span class="glyphicon glyphicon-arrow-right"></span> Go to pay</button>
                                </div>
                            </div>
                        </div>
                    </form> <!-- /form -->
                </div> <!-- ./container -->
                 <%}%>
            </div>
           


            <div class="col-md-7">
                <div class="container-fluid" >
                    <h3 style="text-align: center; margin: 20px; color:#001a33; font-weight: bold">ORDER DETAIL</h3>
                    <%
                        if (cartItemCount > 0) {
                    %>
                    <div class="row">
                        <div class="col-sm-12 col-md-10 col-md-offset-1">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (BookOrder bo : cartList) {
                                            total += bo.getPrice() * bo.getQuantity();
                                    %>
                                    <tr>
                                        <td class="col-sm-8 col-md-6">
                                            <div class="media">
                                                <a class="thumbnail pull-left" href="#"><img class="media-object" src="edu/<%= bo.getBook().getImage()%>" style="width: 72px; height: 96px;"> </a>
                                                <div class="media-body">
                                                    <h4 class="media-heading"><%= bo.getBook().getTitle()%></h4>
                                                    <h5 class="media-heading">By <a href="#"><%= bo.getBook().getPublisher().getName()%></a></h5>
                                                    <!--                                            <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>-->
                                                </div>
                                            </div></td>
                                        <td class="col-sm-1 col-md-1" style="text-align: center">
                                            <%= bo.getQuantity()%>
                                        </td>
                                        <td class="col-sm-1 col-md-1 text-center"><strong><%= bo.getPrice()%></strong></td>
                                        <td class="col-sm-1 col-md-1 text-center"><strong><%= bo.getPrice() * bo.getQuantity()%></strong></td>
                                    </tr>
                                    <% }%>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h5>Subtotal</h5></td>
                                        <td class="text-right"><h5><strong><%= total%></strong></h5></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h5>Estimated shipping</h5></td>
                                        <td class="text-right"><h5><strong>50000</strong></h5></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h3>Total</h3></td>
                                        <td class="text-right"><h3><strong><%= total + 50000%></strong></h3></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <% } else { %>
                    <h2 style="text-align: center">Your cart is empty</h2>
                    <%}%>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
