/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author phongnguyenhai
 */
public class OrderDetail {
    private Order order;
    private ArrayList<Cart> carts;

    public OrderDetail() {
    }

    public OrderDetail(Order order, ArrayList<Cart> carts) {
        this.order = order;
        this.carts = carts;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ArrayList<Cart> getCarts() {
        return carts;
    }

    public void setCarts(ArrayList<Cart> carts) {
        this.carts = carts;
    }
    
    
}
