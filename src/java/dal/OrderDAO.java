/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Customer;
import model.Discount;
import model.Order;
import model.Payment;

/**
 *
 * @author phongnguyenhai
 */
public class OrderDAO {

    public void insertOrder(Order o) throws Exception {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "insert into Orders(customer_id,order_date,payment_id,ship_address,total_amount) values (?,?,?,?,?)";

            PreparedStatement pst = conn.prepareStatement(sql);

            pst.setInt(1, o.getCustomer().getId());
            pst.setDate(2, o.getOrderDate());
            pst.setInt(3, o.getPayment().getId());
            pst.setString(4, o.getAddress());
            pst.setFloat(5, o.getTotalAmount());
            pst.executeUpdate();

            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Discount getDiscountByTotal(float total) throws Exception {
        Discount d = new Discount();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from order_discount where max_spent >= " + total + " and min_spent <= " + total;
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int discount = rs.getInt("discount");
            float ship_fee = rs.getFloat("ship_fee");
            d.setDiscount(discount);
            d.setShip_fee(ship_fee);
            return d;
        }

        return d;
    }

    public int getOrderId(Order o) throws Exception {
        Connection conn = new DBContext().getConnection();
        int oid = 0;
        String sql = "select id from orders where customer_id = ? and total_amount = ? and order_date = ? and ship_address = ? and payment_id = ?";
        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setInt(1, o.getCustomer().getId());
        pst.setFloat(2, o.getTotalAmount());
        pst.setDate(3, o.getOrderDate());
        pst.setString(4, o.getAddress());
        pst.setInt(5, o.getPayment().getId());
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            oid = rs.getInt("id");
        }
        rs.close();
        conn.close();
        return oid;
    }

    public ArrayList<Order> getOrderByCustomer(Customer c) throws Exception {
        ArrayList<Order> orders = new ArrayList<>();
        PaymentDAO pdao = new PaymentDAO();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from orders where customer_id = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, c.getId());
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            Payment p = pdao.getPaymentById(rs.getInt("payment_id"));
            Date orderDate = rs.getDate("order_date");
            float total = rs.getFloat("total_amount");
            String address = rs.getString("ship_address");
            Order o = new Order(id, c, orderDate, p, address, total);
            orders.add(o);
        }
        rs.close();
        conn.close();
        return orders;
    }
}
