/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CartDAO;
import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author phongnguyenhai
 */
public class CartController extends HttpServlet {

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
        try {
            CategoryDAO cdao = new CategoryDAO();
            ArrayList<Category> categories = cdao.getCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
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
        int pid = Integer.parseInt(request.getParameter("pid"));
        HttpSession session = request.getSession();
        ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
        Customer customer = (Customer) session.getAttribute("customer");
        CartDAO cdao = new CartDAO();
        if (request.getParameter("remove") != null) {
            if (carts.size() == 1) {
                if (customer != null) {
                    try {
                        cdao.deleteCart(carts.get(0), customer);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
                carts.remove(0);
                session.setAttribute("carts", null);
            } else {               
                for (Cart cart : carts) {
                    if (cart.getProduct().getId() == pid) {
                        if (customer != null) {
                            try {
                                cdao.deleteCart(cart, customer);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                        carts.remove(cart);

                    }
                }
                session.setAttribute("carts", carts);
            }
            response.sendRedirect("cart");
        } else if (request.getParameter("update") != null) {
            for (Cart cart : carts) {
                if (cart.getProduct().getId() == pid) {
                    cart.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                    break;
                }
            }
            session.setAttribute("carts", carts);
            response.sendRedirect("cart");
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
