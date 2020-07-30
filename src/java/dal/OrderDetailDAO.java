/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author phongnguyenhai
 */
public class OrderDetailDAO {

    public void insertOrderDetail(int id, Cart cart) throws Exception {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "insert into Order_Details(order_id,product_id,quantity,sell_price) values (?,?,?,?)";
            
            
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setInt(1, id);
                pst.setInt(2, cart.getProduct().getId());
                pst.setInt(3, cart.getQuantity());
                pst.setFloat(4, cart.getSellPrice());
                pst.executeUpdate();
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
