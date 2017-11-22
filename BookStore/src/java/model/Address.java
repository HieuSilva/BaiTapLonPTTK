/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Dell
 */
public class Address implements Serializable {

    private int id;
    private String houseNumber;
    private String street;
    private String province;
    private String city;
    private String country;

    public Address() {
    }

    public Address(int id, String houseNumber, String street, String province, String city, String country) {
        this.id = id;
        this.houseNumber = houseNumber;
        this.street = street;
        this.province = province;
        this.city = city;
        this.country = country;
    }

    public Address(String houseNumber, String street, String province, String city, String country) {
        this.houseNumber = houseNumber;
        this.street = street;
        this.province = province;
        this.city = city;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
}
