<%-- 
    Document   : index
    Created on : Nov 19, 2017, 11:03:33 AM
    Author     : HIEU
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" %>
<%@page import="model.book.*" %>
<%@page import="control.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookstore</title>
        <link rel="stylesheet" href="theme/bootstrap/css/w3css.css">
        <link rel="stylesheet" href="theme/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="theme/index_css.css">
        <link rel="stylesheet" href="theme/cart_list_css.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>


        <div class="row">
            <div class="books col-md-12">
                <h2>Book list</h2>
                <ul class="book-list">
                    <%if (bookList != null) {
                            for (Book b : bookList) {%>
                    <li class="book col-md-2">
                        
                            <form name="add_to_cart" method="post" action="CartServlet">
                                <div class="row">
                                    <div class="book-thumb col-sm-12">
                                        <a href="BookDetail.jsp?idBook=<%= b.getId() %>">
                                            <img src="edu/<%=b.getImage()%>">
                                        </a>
                                    </div>
                                </div>
                                <div class="row">
                                    <h5 style="text-align: left; margin-left: 20px; height: 20px; font-weight: bold"><%=b.getTitle()%></h5>
                                </div>
                                <div class="row">
                                    <div class="book-price">Price: <%=b.getPrice()%></div>
                                </div>
                                
                                <div class="row" style="text-algin:center">
                                    <button class="add_to_cart btn btn-success"><span class="glyphicon glyphicon-shopping-cart">  </span> Add to cart</button>
                                </div>
                                <input type="hidden" name="book-id" value="<%= b.getId()%>" />
                                <input type="hidden" name="type" value="add" />
                                <input type="hidden" name="quantity" value="1" />
                                <input type="hidden" name="return-url" value="index.jsp" />
                            </form>
                        
                    </li>
                    <% }
                        }%>
                </ul>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
