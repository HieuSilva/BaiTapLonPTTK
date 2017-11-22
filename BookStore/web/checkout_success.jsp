<%-- 
    Document   : checkout_success
    Created on : Nov 21, 2017, 10:14:31 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="theme/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="theme/checkout_success_css.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="fluid-container">
            <div class="jumbotron">
                <a href="index.jsp" style="color:white; text-decoration: none"><h1 style="margin-left: 50px">Book store</h1></a>
            </div>
        </div>
        <div class="container content">
            <h1>Order success!</h1>
            <img class="img-responsive" src="edu/like_icon.png" alt="Success" width="10%" height="10%" style="margin: auto">
            <h1 style="margin-bottom: 20px">Thank you!</h1>
            <a class="btn btn-success" href="index.jsp"><span class="glyphicon glyphicon-shopping-cart"> </span>  Continue shopping</a>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
