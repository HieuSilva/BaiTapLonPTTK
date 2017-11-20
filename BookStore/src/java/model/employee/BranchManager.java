/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.employee;

import model.employee.Branch;
import model.employee.Employee;
import java.io.Serializable;
import java.util.Date;
import model.Account;
import model.Address;

/**
 *
 * @author Dell
 */
public class BranchManager extends Employee implements Serializable {

    private int id;

    public BranchManager() {
    }

    public BranchManager(int id, Branch branch, String fullname, Date birthday, Account account, String phone, String email) {
        super(branch, fullname, birthday, account, phone, email);
        this.id = id;
    }

}
