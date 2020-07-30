<%-- 
    Document   : orderlist
    Created on : Apr 2, 2020, 11:51:28 AM
    Author     : phongnguyenhai
--%>

<%@page import="model.Order"%>
<%@page import="model.Customer"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");

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
                                        <th>#</th>
                                        <th>Order Date</th>
                                        <th>Ship Address</th>
                                        <th>Total Amount</th>
                                        <th>Payment Method</th>



                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <%

                                        if (orders != null) {
                                            for (int i = 0; i < orders.size(); i++) {
                                    %>                                   
                                    <tr>                           
                                        <td><%=i+1%></td>
                                        <td>
                                            <c:set var="od" value="<%=orders.get(i).getOrderDate()%>" />
                                            <fmt:parseDate value="${od}" pattern="yyyy-MM-dd" var="date"></fmt:parseDate>
                                            <fmt:formatDate value="${date}" pattern="E dd/MM/yyyy" />
                                        </td>
                                        <td ><%=orders.get(i).getAddress()%></td>
                                        <td><%=orders.get(i).getTotalAmount()%></td>
                                        <td><%=orders.get(i).getPayment().getMethod()%></td>


                                    </tr>
                                    <%}
                                        }%>


                                </tbody>

                            </table>
                        </div>

                    </div>

                </div>


            </div>

        </main>
    </body>
</html>
