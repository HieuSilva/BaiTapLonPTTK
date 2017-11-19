/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.employee;

import java.io.Serializable;
import java.util.Date;
import model.Address;

/**
 *
 * @author Dell
 */
public class Branch implements Serializable {

    private int id;
    private String name;
    private Address address;
    private BranchManager branchManager;

    public Branch() {
    }

    public Branch(int id, String name, Address address, BranchManager branchManager) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.branchManager = branchManager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public BranchManager getBranchManager() {
        return branchManager;
    }

    public void setBranchManager(BranchManager branchManager) {
        this.branchManager = branchManager;
    }
}
