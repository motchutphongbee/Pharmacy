/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author phongnguyenhai
 */
public class Discount {
    private int discount;
    private float ship_fee;

    public Discount() {
    }

    public Discount(int discount, float ship_fee) {
        this.discount = discount;
        this.ship_fee = ship_fee;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public float getShip_fee() {
        return ship_fee;
    }

    public void setShip_fee(float ship_fee) {
        this.ship_fee = ship_fee;
    }
    
    
}
