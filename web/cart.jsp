<%-- 
    Document   : cart
    Created on : Apr 1, 2020, 3:58:48 PM
    Author     : phongnguyenhai
--%>

<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
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
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            Customer customer = (Customer) request.getSession().getAttribute("customer");
        %>
        <script>

        </script>

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
                        %>                                                 
                        <li class="nav-item">
                            <a class="nav-link" href="category?id=<%=c.getId()%>"><%=c.getName().toUpperCase()%></a>
                        </li>
                        <%}%>
                        </li>                             
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

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cart-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>   
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        float total = 0;
                                        if (carts != null) {
                                            for (Cart cart : carts) {
                                                total += cart.getSellPrice() * cart.getQuantity();

                                    %>                                   
                                    <tr>
                                <form method="post" action="cart">

                                    <td class="id">
                                        <input readonly type="hidden" class="form-control" value="<%=cart.getProduct().getId()%>" name="pid">
                                    </td>
                                    <td><img class="bd-placeholder-img" width="100" height="100" src="image/product/<%=cart.getProduct().getSrc()%>"></td>
                                    <td width="40%">
                                        <h5><%=cart.getProduct().getName()%></h5>
                                    </td>
                                    <td ><%=cart.getSellPrice()%></td>

                                    <td class="id">

                                        <input type="number" min="1" max="<%=cart.getProduct().getStock()%>" class="form-control" value="<%=cart.getQuantity()%>" name="quantity">

                                    </td>
                                    <td><%=cart.getQuantity() * cart.getSellPrice()%></td>
                                    <td><input type="submit" class="btn btn-blue" value="Cập nhật" name="update"></td>
                                    <td><input type="submit" class="btn btn-blue" value="Xoá" name="remove"></td>

                                </form>
                                </tr>
                                <%}
                                    }%>
                                <tr>
                                    <th></th>
                                    <th>TOTAL :</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th><%=total%></th>   
                                    <th><a class="btn btn-blue" href="order">Thanh toán</a></th>
                                    <th></th>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

        </main>
    </body>
</html>
