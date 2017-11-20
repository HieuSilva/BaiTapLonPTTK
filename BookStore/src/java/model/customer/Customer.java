/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.customer;

import java.io.Serializable;
import java.util.Date;
import model.Account;
import model.Address;
import model.User;

/**
 *
 * @author Dell
 */
public class Customer extends User implements Serializable {

    private int id;

    public Customer() {
    }

    public Customer(String fullname, Date birthday, Account account, String phone, String email) {
        super(fullname, birthday, account, phone, email);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
