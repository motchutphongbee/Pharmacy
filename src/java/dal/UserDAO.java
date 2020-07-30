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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author phongnguyenhai
 */
public class UserDAO {
    public Customer getCustomerByPhoneAndPassword(String inputemail,
            String inputpassword) throws Exception {
        String password = "";
        String firstname="",lastname="",phone="";
        int id = 0;
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "select * from customers where email = '" + inputemail + "'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                password = rs.getString("password");
                firstname = rs.getString("firstname");
                lastname = rs.getString("lastname");
                phone = rs.getString("phone");
            }
            rs.close();
            conn.close();
        } catch (Exception e) {
        }       
        if (password.equals(inputpassword) && password != "") {
            Customer c = new Customer(id, firstname, lastname, phone, inputemail, password);
            return c;
        } else {
            return null;
        }
    }
    
    public void insertCustomer(Customer c) throws Exception {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "insert into Customers(lastname,password,phone,email,firstname) values (?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);                 
            pst.setString(1, c.getLastName());
            pst.setString(2, c.getPassword());
            pst.setString(3, c.getPhone());
            pst.setString(4, c.getEmail());
            pst.setString(5, c.getFirstName());
            pst.executeUpdate();                 
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateCustomer(Customer c) throws Exception {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "update [Customers]\n"
                    + "   set [firstname] = ?\n"
                    + "    ,[lastname] = ?\n"
                    + "   ,[phone] = ?\n"
                    + "      ,[email] = ?\n"
                   
                    + " where [id] = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, c.getFirstName());
            statement.setString(2, c.getLastName());
            statement.setString(3, c.getPhone());
            statement.setString(4, c.getEmail());           
            statement.setInt(5, c.getId());
            statement.executeUpdate();
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
