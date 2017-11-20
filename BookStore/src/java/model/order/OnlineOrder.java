/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import java.sql.Date;
import java.util.ArrayList;
import model.Address;
import model.customer.Customer;
import model.employee.Shipper;

/**
 *
 * @author HIEU
 */
public class OnlineOrder {
    private int id;
    private Date createDate;
    private ArrayList<BookOrder> itemList;
    private String state;
    private Customer customer;
    private Address shippingAddress;
    private Shipper shipper;
    
    public OnlineOrder() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public ArrayList<BookOrder> getItemList() {
        return itemList;
    }

    public void setItemList(ArrayList<BookOrder> itemList) {
        this.itemList = itemList;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Address getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(Address shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Shipper getShipper() {
        return shipper;
    }

    public void setShipper(Shipper shipper) {
        this.shipper = shipper;
    }
    
    
}
