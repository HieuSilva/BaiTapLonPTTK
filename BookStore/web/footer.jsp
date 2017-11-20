<%-- 
    Document   : footer
    Created on : Nov 20, 2017, 11:51:40 AM
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="theme/footer_css.css">
    </head>
    <body>
        <%
            BookDAO dao = new BookDAO();
            Category[] list = dao.getListCategory();
        %>
        <div class="container-fluid">
            <section style="height:80px;"></section>
            <!----------- Footer ------------>
            <footer class="footer-bs">
                <div class="row">
                    <div class="col-md-3 footer-brand animated fadeInLeft">
                        <h2>Bookstore</h2>
                        <p>Suspendisse hendrerit tellus laoreet luctus pharetra. Aliquam porttitor vitae orci nec ultricies. Curabitur vehicula, libero eget faucibus faucibus, purus erat eleifend enim, porta pellentesque ex mi ut sem.</p>
                        <p>© 2014 BS3 UI Kit, All rights reserved</p>
                    </div>
                    <div class="col-md-4 footer-nav animated fadeInUp">
                        <h4>Categories —</h4>
                        <div class="col-md-6">
                            <ul class="pages">
                                <%if (list != null) {
                                        for (Category c : list) {%>
                                <li><a href="index.jsp?category_id=<%= c.getId()%>"><%= c.getName()%></a></li>
                                    <%}
                                    }%>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul class="list">
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Contacts</a></li>
                                <li><a href="#">Terms & Condition</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 footer-social animated fadeInDown">
                        <h4>Follow Us</h4>
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">RSS</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-ns animated fadeInRight">
                        <h4>Newsletter</h4>
                        <p>A rover wearing a fuzzy suit doesn’t alarm the real penguins</p>
                        <p>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-envelope"></span></button>
                            </span>
                        </div><!-- /input-group -->
                        </p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
