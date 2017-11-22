<%-- 
    Document   : BookDetail
    Created on : Nov 22, 2017, 12:08:13 AM
    Author     : ASUS
--%>

<%@page import="control.BookDAO"%>
<%@page import="model.book.Book"%>
<%@page import="model.book.Category"%>
<%@page import="model.book.Author"%>
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
        <link rel="stylesheet" href="theme/Book_detail.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            int index = Integer.parseInt(request.getParameter("idBook"));
            Book b = (new BookDAO()).getBookById(index);
        %>
        <div class="container content">
            <div class="row">
                <div class="col-md-5">
                    <img src="edu/<%=b.getImage()%>">                   
                </div>
                
                <div class="col-md-7" >
                    <div class="title" style="font-size: 30px; font-weight: bolder;">
                        <p><%=b.getTitle()%></p>
                    </div>    
                    <div class="price">
                        <p>Giá: <%=b.getPrice()%></p>
                    </div>
                    <div class="category"><p>Thể loại: <%=b.getCategory().getName()%></p></div>
                    <div class="author"><p>Tác giả: <%=b.getAuthor().getFullname()%></p></div>
                    <div class="NXB"><p>NXB: <%=b.getPublisher().getName()%></p></div>
                    <div class="size"><p>Kích cỡ: <%=b.getSize().getWidth()%> X <%=b.getSize().getHeight()%> X <%=b.getSize().getLength()%></div>
                    <div class="mass"><p>Trọng lượng: <%=b.getSize().getMass()%> Kg</p></div>
                    <div class="pre_cart">
                        <div class="count">Số lượng: <input type="text" name="quantity" value="1" /></div>
                        <div class="row" style="text-algin:center" >
                            <button class="add_to_cart btn btn-success" style=" float: center"><span class="glyphicon glyphicon-shopping-cart">  </span> Add to cart</button>
                        </div>
                    </div>
                
                <form name="add_to_cart" method="post" action="CartServlet">
                    <input type="hidden" name="book-id" value="<%= b.getId()%>" />   
                    <input type="hidden" name="type" value="add" />  
                    <input type="hidden" name="return-url" value="BookDetail.jsp?idBook=<%= b.getId()%>" />
                </form>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
