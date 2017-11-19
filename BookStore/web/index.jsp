<%-- 
    Document   : index
    Created on : Nov 19, 2017, 11:03:33 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookstore</title>
        <link rel="stylesheet" href="theme/bootstrap/css/w3css.css">
        <link rel="stylesheet" href="theme/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="theme/index_css.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="fluid-container">
            <div class="jumbotron">
                <h1 style="margin-left: 50px">Book store</h1>
            </div>
        </div>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.php">Home</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Danh mục sách <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.php?theloai=van hoc">Sách văn học</a></li>
                                <li><a href="index.php?theloai=thieu nhi">Sách thiếu nhi</a></li>
                                <li><a href="index.php?theloai=khoa hoc">Sách khoa học</a></li>
                                <li><a href="index.php?theloai=su hoc">Sách sử học</a></li>
                            </ul>
                        </li>
                        <p class="navbar-text">Tìm kiếm đầu sách</p>

                    </ul>
                    <form class="navbar-form navbar-left" role="search" action="index.php" method="GET">
                        <div class="form-group">
                            <input type="text" name="tensach" class="form-control" placeholder="Nhập tên đầu sách">
                        </div>
                        <button type="submit" class="btn btn-default">Tìm</button>
                    </form>
                    <ul class="nav navbar-nav">
                        <li><a href="#">About us</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="register_form.php" target="blank"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
                        <button class="btn btn-success navbar-btn" onclick="document.getElementById('id01').style.display = 'block'"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</button>

                        <div id="id01" class="w3-modal">
                            <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                                <div class="w3-center"><br>
                                    <span onclick="document.getElementById('id01').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
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
                                    <button onclick="document.getElementById('id01').style.display = 'none'" type="button" class="w3-button w3-red">Cancel</button>
                                </div>

                            </div>
                        </div>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>
        </nav>
    </body>
</html>
