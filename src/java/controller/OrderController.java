/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Category;
import model.Customer;
import model.Discount;
import model.Order;
import model.OrderDetail;
import model.Payment;

/**
 *
 * @author phongnguyenhai
 */
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new ArrayList<>();
        }
        if (customer != null) {
            try {
                CartDAO cdao = new CartDAO();
                float total = 0;
                ArrayList<Cart> existedCart = cdao.getCart(customer);
                for (Cart cart : carts) {
                    int count = 0;
                    total += cart.getQuantity() * cart.getSellPrice();

                    for (Cart cart1 : existedCart) {
                        if (cart.getProduct().getId() == cart1.getProduct().getId()) {
                            count++;
                            cdao.updateCart(cart, customer);
                        }
                    }
                    if (count == 0) {
                        cdao.insertCart(cart, customer);
                    }
                }
                OrderDAO odao = new OrderDAO();
                Discount d = odao.getDiscountByTotal(total);
                CategoryDAO catdao = new CategoryDAO();
                ArrayList<Category> categories = catdao.getCategories();
                PaymentDAO pdao = new PaymentDAO();
                ArrayList<Payment> payments = pdao.getPayment();
                request.setAttribute("payments", payments);
                request.setAttribute("discount", d);
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("order.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("login");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Customer customer =(Customer) request.getSession().getAttribute("customer");
            Date orderDate = Date.valueOf(LocalDate.now());
            int payment_id = Integer.parseInt(request.getParameter("payment"));
            PaymentDAO pdao = new PaymentDAO();
            Payment p = pdao.getPaymentById(payment_id);
            String address = request.getParameter("address");
            float totalAmount = Float.parseFloat(request.getParameter("finaltotal"));
            OrderDAO odao = new OrderDAO();
            ArrayList<Cart> carts = (ArrayList<Cart>)request.getSession().getAttribute("carts");
            Order o = new Order();
            o.setAddress(address);
            o.setCustomer(customer);
            o.setOrderDate(orderDate);
            o.setPayment(p);
            o.setTotalAmount(totalAmount);
            //OrderDetail od = new OrderDetail(o,carts);
            OrderDetailDAO oddao = new OrderDetailDAO();
            odao.insertOrder(o);
            for (Cart cart : carts) {
                oddao.insertOrderDetail(odao.getOrderId(o),cart);
            }
            CartDAO cdao = new CartDAO();
            cdao.deleteAllCart(customer);
            request.getSession().setAttribute("carts", null);
            response.sendRedirect("orderlist");
            
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
                
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
