<%-- 
    Document   : category
    Created on : Mar 27, 2020, 10:34:10 PM
    Author     : phongnguyenhai
--%>

<%@page import="model.Customer"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
            ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
            Customer customer = (Customer) request.getSession().getAttribute("customer");
            Category cat = categories.get(Integer.parseInt(request.getParameter("id")) - 1);
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
                        <li class="nav-item">
                            <a class="nav-link" href="home">TRANG CHỦ </a>
                        </li>
                        <%for (Category c : categories) {
                                if (c.getId() == cat.getId()) {
                        %>   
                        <li class="nav-item active">                           
                            <a class="nav-link" href="category?id=<%=c.getId()%>"><%=c.getName().toUpperCase()%><span class="sr-only">(current)</span></a>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <a class="nav-link" href="category?id=<%=c.getId()%>"><%=c.getName().toUpperCase()%></a>
                        </li>
                        <%}%>
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
            <hr class="featurette-divider">
            <hr class="featurette-divider">
            <hr class="featurette-divider">

            <div class="container marketing">
                <% if (cat.getId() % 2 == 1) {%>
                <div class="row featurette">
                    <div class="col-md-7 order-md-2">
                        <h2 class="featurette-heading"><%=cat.getName()%></h2>
                        <p class="lead"><%=cat.getSlogan()%></p>
                    </div>
                    <div class="col-md-5 order-md-1">
                        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="image/<%=cat.getSrc()%>" width="500" height="500"   focusable="false" role="img"><title>Placeholder</title></img>
                    </div>
                </div>
                <%} else {%>
                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading"><%=cat.getName()%></h2>
                        <p class="lead"><%=cat.getSlogan()%></p>
                    </div>
                    <div class="col-md-5">
                        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="image/<%=cat.getSrc()%>" width="500" height="500" focusable="false" role="img"><title>Placeholder</title></img>
                    </div>
                </div>
                <%}%>
                <hr class="featurette-divider">
                <div class="row">
                    <%for (Product p : products) {

                    %>
                    <div class="col-lg-4">
                        <div class="card" style="width: 22rem;">
                            <div class="card-img-top">
                                <div class="d-flex justify-content-center mb-2">
                                    <img class="bd-placeholder-img" width="200" height="200" src="image/product/<%=p.getSrc()%>"  focusable="false" role="img" ></img>                           
                                </div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title"><%=p.getName()%></h4>
                                <%
                                    if (p.getDiscount() > 0) {
                                %>

                                <div class="discounted">
                                    <h5> <%=(p.getPrice() * (1 - ((float) p.getDiscount() / 100)))%> VND </h5>
                                    <p><%=p.getPrice()%> VND</p>
                                </div>
                                <%} else {%>
                                <div class="non-discount">
                                    <h5><%=p.getPrice()%> VND</h5>
                                    <p><br></p>
                                </div>
                                <%}%>
                                <a href="product?id=<%=p.getId()%>" class="btn btn-secondary">Xem sản phẩm</a>
                            </div>
                        </div>
                    </div>                   
                    <%}%>
                    

                </div>
            </div>

        </main>
    </body>
</html>
