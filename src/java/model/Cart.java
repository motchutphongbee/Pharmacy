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
public class Cart {
    private Product product;
    private int quantity;
    private float sellPrice;

    public float getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(float sellPrice) {
        this.sellPrice = sellPrice;
    }

    public Cart(Product product, int quantity) {
        super();
        this.product = product;
        this.quantity = quantity;
        this.sellPrice = product.getPrice()* (1-((float)product.getDiscount()/100));
    }

    public Cart() {
        super();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
}
