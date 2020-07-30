<%-- 
    Document   : order
    Created on : Apr 1, 2020, 9:26:27 PM
    Author     : phongnguyenhai
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="model.Payment"%>
<%@page import="model.Discount"%>
<%@page import="model.Customer"%>
<%@page import="model.Cart"%>
<%@page import="model.Category"%>
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
            ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            Customer customer = (Customer) request.getSession().getAttribute("customer");
            Discount d = (Discount) request.getAttribute("discount");
            ArrayList<Payment> payments = (ArrayList<Payment>) request.getAttribute("payments");

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

                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>   

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
                                        <td><img class="bd-placeholder-img" width="100" height="100" src="image/product/<%=cart.getProduct().getSrc()%>"></td>
                                        <td width="40%">
                                            <h5><%=cart.getProduct().getName()%></h5>
                                        </td>
                                        <td ><%=cart.getSellPrice()%></td>

                                        <td>

                                            <%=cart.getQuantity()%>

                                        </td>
                                        <td><%=cart.getQuantity() * cart.getSellPrice()%></td>


                                    </tr>
                                    <%}
                                        }%>


                                </tbody>

                            </table>
                        </div>
                        <div class="row">

                            <div class="col">
                                <div class="proceed-checkout">
                                    <ul>
                                        <li class="subtotal">Subtotal <span><%=total%></span></li>
                                        <li class="subtotal">Discount <span><%=d.getDiscount()%>%</span></li>
                                        <li class="subtotal">Ship Fee <span><%=d.getShip_fee()%></span></li>
                                        <li class="cart-total">Total <span><%=(d.getShip_fee() + total * (1 - ((float) d.getDiscount() / 100)))%></span></li>
                                    </ul>
                                    <a href="cart" class="proceed-btn">Sửa đơn hàng</a>
                                </div>
                            </div>
                        </div>
                        <hr class="featurette-divider">
                        <form action="order" method="post">
                            <div class="form-group">
                                <label for="address">Địa chỉ nhận hàng</label>
                                <input type="text" class="form-control" name="address" placeholder="Địa chỉ nhận hàng" required=>
                            </div>  
                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label for="payment">Phương thức thanh toán</label>
                                    <select class="form-control" name="payment" placeholder="Phương thức thanh toán" required>
                                        <% for (Payment p : payments) {
                                        %>
                                        <option value="<%=p.getId()%>"><%=p.getMethod()%></option>                                       
                                        <%}%>

                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="finaltotal">Giá trị đơn hàng</label>
                                    <input type="number" class="form-control" name="finaltotal" value="<%=(d.getShip_fee() + total * (1 - ((float) d.getDiscount() / 100)))%>" readonly>

                                </div>
                                <button name="complete" type="submit" class="btn btn-blue">Hoàn tất thanh toán</button>
                            </div>



                        </form>      
                    </div>

                </div>


            </div>

        </main>
    </body>
</html>
