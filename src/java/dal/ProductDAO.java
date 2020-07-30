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
import model.Category;
import model.Product;

/**
 *
 * @author phongnguyenhai
 */
public class ProductDAO {
    public ArrayList<Product> getProductByCategory(Category c) throws Exception
    {
        ArrayList<Product> products = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        try {
            String sql = "SELECT * FROM Products where category_id="+c.getId();
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setCategory(c);
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getInt("discount"));
                p.setName(rs.getString("name"));
                p.setOrigin(rs.getString("origin"));
                p.setPrice(rs.getFloat("price"));
                p.setStock(rs.getInt("stockquantity"));
                p.setUnit(rs.getString("unit"));
                p.setSrc(rs.getString("src"));
                products.add(p);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.close();
        return products;
    }
    
    public Product getProductByID(int id) throws Exception
    {
        CategoryDAO cdao = new CategoryDAO();
        Product p = new Product();
        Connection conn = new DBContext().getConnection();
        try {
            String sql = "SELECT * FROM Products where id="+id;
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {              
                p.setId(rs.getInt("id"));
                p.setCategory(cdao.getCategoriesByID(rs.getInt("category_id")));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getInt("discount"));
                p.setName(rs.getString("name"));
                p.setOrigin(rs.getString("origin"));
                p.setPrice(rs.getFloat("price"));
                p.setStock(rs.getInt("stockquantity"));
                p.setUnit(rs.getString("unit"));
                p.setSrc(rs.getString("src"));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.close();
        return p;
    }
}
