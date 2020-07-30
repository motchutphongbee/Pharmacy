<%-- 
    Document   : register
    Created on : Mar 29, 2020, 3:04:48 PM
    Author     : phongnguyenhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>

        <div class="sidenav">
            <div class="login-main-text">
                <h2>PHONG BEE PHARMACY<br> Kính chào quý khách!</h2>
                <p>Vui lòng đăng ký tài khoản tại đây để mua hàng.</p>
            </div>
        </div>
        <div class="main">
            <div class="col">
                <div class="register-form">
                    <form action="register" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control" name="inputEmail" placeholder="Email" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword">Mật khẩu</label>
                                <input type="password" class="form-control" name="inputPassword" placeholder="Mật khẩu" required>
                            </div>
                        </div>
                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="inputFirstName">Tên</label>
                                <input type="text" class="form-control" name="inputFirstName" placeholder="Tên" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputLastName">Họ</label>
                                <input type="text" class="form-control" name="inputLastName" placeholder="Họ" required>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="phone">Điện thoại</label>
                            <input type="phone" class="form-control" name="phone" placeholder="Điện thoại" required="">
                        </div>                                        
                        <button type="submit" class="btn btn-blue">Đăng ký</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
