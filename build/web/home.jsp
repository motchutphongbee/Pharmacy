<%-- 
    Document   : home
    Created on : Mar 26, 2020, 10:10:50 PM
    Author     : phongnguyenhai
--%>

<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <%
            ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
            Customer customer = (Customer) request.getSession().getAttribute("customer");
        %>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #003762;">
                <a class="navbar-brand" href="home">PHONGBEEPHARMACY</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="home">TRANG CHỦ <span class="sr-only">(current)</span></a>
                        </li>
                        <%for (Category c : categories) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="category?id=<%=c.getId()%>"><%=c.getName().toUpperCase()%></a>
                        </li>                             
                        <%}%>

                        <a class="btn btn-secondary" style="background-color: #003762;" data-toggle="button" aria-pressed="false" href="cart">GIỎ HÀNG </a>                           
                        
                        <li class="nav-item">
                            <%
                                if (customer != null) {
                            %>
                            <a class="btn btn-secondary" style="background-color: #003762;" data-toggle="button" aria-pressed="false" href="account">TÀI KHOẢN </a>
                            <%} else {%>
                            <a class="btn btn-secondary" style="background-color: #003762;" data-toggle="button" aria-pressed="false" href="login">ĐĂNG NHẬP </a>                           
                            <%}%>
                        </li>  

                    </ul>  
                </div>
            </nav>
        </header>

        <main role="main">
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="image/carousal1.jpg" class="bd-placeholder-img" width="100%" height="100%">
                    </div>               
                    <div class="carousel-item">
                        <img src="image/carousal3.jpg" class="bd-placeholder-img" width="100%" height="100%">
                    </div>
                </div>
            </div>
            <hr class="featurette-divider">

            <div class="container marketing">
                <div class="col">
                    <%
                        for (Category c : categories) {

                    %>
                    <div class="row-lg-4">
                        <div class="d-flex justify-content-center mb-2">
                            <img class="bd-placeholder-img rounded-circle" width="250" height="250" src="image/<%=c.getSrc()%>"  focusable="false" role="img" ><title>Placeholder</title></img>                                                                                  
                        </div>
                        <div class="d-flex justify-content-center mb-1">
                            <h2><%=c.getName()%></h2>
                        </div>
                        <div class="d-flex justify-content-center mb-2">
                            <p><%=c.getSlogan()%></p>
                        </div>
                        <div class="d-flex justify-content-center" mb-20>
                            <p><a class="btn btn-secondary" href="category?id=<%=c.getId()%>" role="button">Xem sản phẩm »</a></p>
                        </div>
                    </div>
                    <%}%>                          
                </div><!-- /.row -->
            </div>
        </main>
    </body>
</html>
