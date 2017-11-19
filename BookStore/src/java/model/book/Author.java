/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.book;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Dell
 */
public class Author implements Serializable {

    private int id;
    private String fullname;
    private Date birthday;
    private String description;

    public Author(int id, String fullname, Date birthday, String description) {
        this.id = id;
        this.fullname = fullname;
        this.birthday = birthday;
        this.description = description;
    }

    public Author() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    

}
