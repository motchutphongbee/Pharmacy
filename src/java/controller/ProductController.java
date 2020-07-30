/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
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
import model.Product;

/**
 *
 * @author phongnguyenhai
 */
public class ProductController extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO pdao = new ProductDAO();
            Product p = pdao.getProductByID(id);
            HttpSession session = request.getSession();
            session.setAttribute("product", p);
            CategoryDAO cdao = new CategoryDAO();
            ArrayList<Category> categories = cdao.getCategories();
            request.setAttribute("product", p);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            Product p = (Product) session.getAttribute("product");

            //ArrayList<Cart> carts = new ArrayList<>();
            Cart cart = new Cart(p, quantity);
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            if (carts != null) {
                int n = 0;
                for (Cart cart1 : carts) {
                    if (cart1.getProduct().getId() == p.getId()) {
                        cart1.setQuantity(quantity + cart1.getQuantity());
                        n++;
                        break;
                    }
                }
                if (n == 0) {
                    carts.add(cart);
                }
            } else {
                carts = new ArrayList<>();
                carts.add(cart);
            }
            session.setAttribute("carts", carts);

            CartDAO cdao = new CartDAO();

            response.sendRedirect("cart");
        } catch (Exception ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
