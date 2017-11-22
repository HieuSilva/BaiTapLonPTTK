<%-- 
    Document   : order_detail
    Created on : Nov 20, 2017, 4:32:17 PM
    Author     : HIEU
--%>
<%@page import="model.order.BookOrder"%>
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
                <a href="index.jsp" style="color:white; text-decoration: none"><h1 style="margin-left: 50px">Book store</h1></a>
            </div>
        </div>
        <div class="container">
            <h2 style="text-align: center; margin: 20px">My cart</h2>
            <%
                if(cartItemCount > 0) {
            %>
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th colspan="2">Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(BookOrder bo: cartList) {
                                total += bo.getPrice() * bo.getQuantity();
                            %>
                            <tr>
                                <td class="col-sm-7 col-md-5">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="#"> <img class="media-object" src="edu/<%= bo.getBook().getImage()%>" style="width: 72px; height: 96px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><%= bo.getBook().getTitle()%></h4>
                                            <h5 class="media-heading">By <a href="#"><%= bo.getBook().getPublisher().getName()%></a></h5>
<!--                                            <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>-->
                                        </div>
                                    </div></td>
                                <form action="CartServlet" method="POST">
                                <td class="col-sm-1 col-md-1" style="text-align: center">
<!--                                    <form action="CartServlet" method="POST" style="display: inline">-->
                                    <input type="number" name="quantity" class="form-control" value="<%= bo.getQuantity()%>">
                                    <input type="hidden" name="item-index" value="<%= cartList.indexOf(bo) %>" />
                                    <input type="hidden" name="return-url" value="order_detail.jsp" />
                                    <input type="hidden" name="type" value="update" />
<!--                                    <button class="btn btn-info" type="submit"><span class="glyphicon glyphicon-refresh"></span></button>-->
<!--                                    </form>-->
                                </td>
                                <td class="col-md-1 col-sm-1">
                                    <button class="btn btn-info" type="submit"><span class="glyphicon glyphicon-refresh"></span></button>
                                </td>
                                </form>
                                <td class="col-sm-1 col-md-1 text-center"><strong><%= bo.getPrice() %></strong></td>
                                <td class="col-sm-1 col-md-1 text-center"><strong><%= bo.getPrice() * bo.getQuantity() %></strong></td>
                                <td class="col-sm-1 col-md-1">
                                    <form style="display: inline" action="CartServlet" method="POST">
                                        <input type="hidden" name="item-index" value="<%= cartList.indexOf(bo) %>" />
                                        <input type="hidden" name="type" value="remove" />
                                        <input type="hidden" name="return-url" value="order_detail.jsp" />
                                        <button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-remove"></span></button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Subtotal</h5></td>
                                <td class="text-right"><h5><strong><%= total %></strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h5>Estimated shipping</h5></td>
                                <td class="text-right"><h5><strong>50000</strong></h5></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td><h3>Total</h3></td>
                                <td class="text-right"><h3><strong><%= total + 50000%></strong></h3></td>
                            </tr>
                            <tr>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>   </td>
                                <td>
                                    <a class="btn btn-default" href="index.jsp">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                                    </a</td>
                                <td>
                                    <a class="btn btn-success" href="checkout.jsp">
                                        Checkout <span class="glyphicon glyphicon-play"></span>
                                    </a
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <% }else { %>
            <div class="container-fluid" style="text-align: center">
                <h2>Your cart is empty</h2>
                <a style="margin-top: 50px" class="btn btn-success" href="index.jsp"><span class="glyphicon glyphicon-arrow-left"></span>  Continue shopping</a>
            </div>
            <%}%>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
