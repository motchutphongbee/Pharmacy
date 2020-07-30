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
import model.Payment;

/**
 *
 * @author phongnguyenhai
 */
public class PaymentDAO {

    public ArrayList<Payment> getPayment() throws Exception {
        ArrayList<Payment> payments = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        try {
            String sql = "SELECT * FROM payment";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Payment p = new Payment();
                p.setId(rs.getInt("id"));
                p.setMethod(rs.getString("payment_method"));
                payments.add(p);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.close();
        return payments;
    }

    public Payment getPaymentById(int id) throws Exception {
        Payment p = new Payment();

        Connection conn = new DBContext().getConnection();
        String sql = "select * from payment where id = " + id;
        PreparedStatement statement = conn.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            
            p.setId(rs.getInt("id"));
            p.setMethod(rs.getString("payment_method"));
            
        }
        rs.close();
        conn.close();
        return p;
    }
}
