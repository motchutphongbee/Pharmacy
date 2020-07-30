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

/**
 *
 * @author phongnguyenhai
 */
public class CategoryDAO {
    public ArrayList<Category> getCategories() throws Exception
    {
        ArrayList<Category> categories = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        try {
            String sql = "SELECT * FROM Category";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setSlogan(rs.getString("slogan"));
                c.setSrc(rs.getString("src"));
                categories.add(c);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.close();
        return categories;
    }
    
    public Category getCategoriesByID(int id) throws Exception
    {
        Category c = new Category();
        Connection conn = new DBContext().getConnection();
        try {
            String sql = "SELECT * FROM Category where id ="+id;
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {               
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.close();
        return c;
    }
}
