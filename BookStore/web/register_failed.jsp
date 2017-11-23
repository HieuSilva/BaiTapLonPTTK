<%-- 
    Document   : register_failed
    Created on : Nov 22, 2017, 7:49:38 PM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Failed</title>
        <link rel="stylesheet" href="theme/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="theme/checkout_success_css.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="fluid-container">
            <div class="jumbotron">
                <a href="index.jsp" style="color:white; text-decoration: none">
                    <div class="row">
                        <img src="edu/bookstore_logo.jpg"  class="col-md-1">
                        <h1 class="col-md-10">F4 Worker Store</h1>
                    </div>
                </a>
            </div>
        </div>
        <div class="container content">
            <h1 class="text-danger">Oops! Something's gone wrong!</h1>
            <img class="img-responsive" src="edu/oops.png" alt="Success" width="10%" height="10%" style="margin: auto; margin-bottom: 40px">
            <a class="btn btn-danger" href="register_form.jsp"><span> </span>  Go back</a>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
