<%-- 
    Document   : register_form
    Created on : Nov 19, 2017, 11:22:38 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="theme/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="theme/register_form_css.css">
        <script src="theme/bootstrap/js/jquery-3.2.1.js" type="text/javascript"></script>
        <script src="theme/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <form class="form-horizontal" role="form" id="reg-form" action="register_execute.php" method="POST">
                <h2>Đăng ký tài khoản mới</h2>
                <div class="form-group">
                    <label for="fullname" class="col-sm-3 control-label">Họ tên *</label>
                    <div class="col-sm-9">
                        <input type="text" name="fullname" id="fullname" placeholder="Họ tên" class="form-control" autofocus required="true">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email *</label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control" required="true">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">Username *</label>
                    <div class="col-sm-9">
                        <input type="text" name="username" id="username" placeholder="" class="form-control" required="true">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Mật khẩu *</label>
                    <div class="col-sm-9">
                        <input type="password" name="password" id="password" class="form-control" required="true">
                        <span class="help-block">Mật khẩu phải chứa ít nhất 8 ký tự, gồm cả số và chữ</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Nhập lại mật khẩu *</label>
                    <div class="col-sm-9">
                        <input type="password" id="repassword" class="form-control" required="true">
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-sm-3 control-label">Ngày sinh</label>
                    <div class="col-sm-9">
                        <input type="date" name="birthday" id="birthday" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <label class="control-label col-sm-3">Giới tính</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-sm-3">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="femaleRadio" value="female">Nữ
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="maleRadio" value="male">Nam
                                    </label>
                                </div>
                                <div class="col-sm-6">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="unknownRadio" value="unknown">Không xác định
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">Địa chỉ</label>
                    <div class="col-sm-9">
                        <input type="text" name="address" id="address" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">* Thông tin bắt buộc</span>
                    </div>
                    <div class="col-sm-9 col-sm-offset-3">
                        <h5><span id="error-message" style="color:red"></span></h5>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-5 col-sm-offset-2">
                            <button type="submit" class="btn btn-success btn-block">Đăng ký</button>
                        </div>
                        <div class="col-sm-5">
                            <button type="reset" class="btn btn-success btn-block">Reset</button>
                        </div>
                    </div>
                </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->

<!--        <div class="row">
            <div class="books col-md-9">
                <h2>Danh sách đầu sách</h2>
                <ul class="book-list">
                    
                    <li class="book col-sm-6">';
                    echo '<form name="add_to_cart" method="post" action="cart_update.php"> ';

                    echo '<div class="row">';
                    echo '<div class="book-thumb col-sm-4"><img src="images/'.$obj->image_link.'"></div>';
                    echo '<div class="col-sm-8">';
                    echo '<h3 class="book-name">'.$obj->name.'</h3>';
                    echo '<div class="book-description">Nhà xuất bản: '.$obj->publisher.'</div>';
                    echo '<div class="book-description">Tác giả: '.$obj->author.'</div>';
                    echo '<div class="book-price">Giá: '.$obj->price.' '.$currency. '</div>';

                    echo '<div class="row">';
                    echo '<div class="form-group col-sm-4">';
                    echo '<input type="number" style="padding:5px 0px" name="book-quantity" placeholder="Số lượng" required min="1" max="10"/></div>';
                    echo '<button class="add_to_cart btn btn-success col-sm-6"><span class="glyphicon glyphicon-shopping-cart">  </span> Cho vào giỏ</button>';
                    echo '</div>';
                    echo '</div>';



                    echo '</div>';

                    echo '<input type="hidden" name="book-id" value="'.$obj->id.'" />';
                    echo '<input type="hidden" name="type" value="add" />';
                    echo '<input type="hidden" name="return_url" value="'.$current_url.'" />';
                    echo '</form>';
                    echo '</li>';
                    }

                    }
                    ?>

                </ul>
            </div>-->
    </body>
</html>
