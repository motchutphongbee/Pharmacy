/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Customer;
import model.Product;

/**
 *
 * @author phongnguyenhai
 */
public class CartDAO {

    public ArrayList<Cart> getCart(Customer c) throws Exception {
        ProductDAO pdao = new ProductDAO();
        ArrayList<Cart> carts = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        try {
            String sql = "SELECT * FROM carts where customer_id=" + c.getId();
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("Product_ID");
                Product p = pdao.getProductByID(pid);
                int quantity = rs.getInt("quantity");
                Cart cart = new Cart(p, quantity);
                carts.add(cart);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.close();
        return carts;
    }

    public void insertCart(Cart cart, Customer c) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "insert into Carts(customer_id,product_id,quantity) values (?,?,?)";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, c.getId());
        pst.setInt(2, cart.getProduct().getId());
        pst.setInt(3, cart.getQuantity());
        pst.executeUpdate();

        conn.close();
    }

    public void updateCart(Cart cart, Customer c) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "update [Carts]\n"
                + "   set [quantity] = ?\n"
                + " where [customer_id] = ? and [product_id] = ?";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, cart.getQuantity());
        pst.setInt(2, c.getId());
        pst.setInt(3, cart.getProduct().getId());
        pst.executeUpdate();

        conn.close();
    }

    public void deleteCart(Cart cart, Customer c) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "delete from Carts where customer_id = ? and product_id = ?";

        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setInt(1, c.getId());
        pst.setInt(2, cart.getProduct().getId());
        pst.executeUpdate();

        conn.close();
    }
    public void deleteAllCart(Customer c) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "delete from Carts where customer_id = ?";

        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setInt(1, c.getId());
        
        pst.executeUpdate();

        conn.close();
    }

}
