/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.employee;

import java.io.Serializable;
import java.util.Date;
import model.Account;
import model.Address;
import model.User;

/**
 *
 * @author Dell
 */
public class Employee extends User implements Serializable {

    private Branch branch;

    public Employee() {
    }

    public Employee(Branch branch, String fullname, Date birthday, Account account, String phone, String email) {
        super(fullname, birthday, account, phone, email);
        this.branch = branch;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

}
