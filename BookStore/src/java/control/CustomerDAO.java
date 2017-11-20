/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
import model.User;
import model.customer.Customer;

/**
 *
 * @author HIEU
 */
public class CustomerDAO {
    private ConnectDB connectDB;
    private Connection con;
    //private ResultSet rs;
    
    public CustomerDAO() {
        connectDB = new ConnectDB();
        con = connectDB.getConnection();
    }
    
    public Customer checkLogin(String username, String password) {
        String sql = "SELECT * FROM tbl_customer WHERE username = ? AND password = ?" ;
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                Date birthday = rs.getDate("birthday");
                
                Account acc = new Account(id, username, password);
                Customer customer = new Customer(fullname, birthday, acc, phone, email);
                return customer;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }
}
