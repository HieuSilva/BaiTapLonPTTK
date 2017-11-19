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
import java.util.ArrayList;
import model.Address;
import model.book.Author;
import model.book.Book;
import model.book.Publisher;

/**
 *
 * @author HIEU
 */
public class BookDAO {
    
    private ConnectDB connectDB;
    private Connection con;
    private ResultSet rs;
    
    public BookDAO() {
        connectDB = new ConnectDB();
        con = connectDB.getConnection();
    }
    
    public ArrayList<Book> getAllBook() {
        ArrayList<Book> list = new ArrayList<Book>();
        String sql = "SELECT * FROM tbl_book";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                float price = rs.getFloat("price");
                String image = rs.getString("image");
                int id_author = rs.getInt("id_author");
                int id_category = rs.getInt("id_category");
                int id_publisher = rs.getInt("id_publisher");
                int id_size = rs.getInt("id_size");
                
                
            }
        } catch (Exception e) {
            System.out.println("Please check getAllProduct index.jsp in SanPhamDAO");
        }
        return list;
    }
    
    public Author getAuthorById(int id) {
        String sql = "SELECT * FROM tbl_author";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id_author = rs.getInt("id");
                String name = rs.getString("name");
                Date birthday = rs.getDate("birthday");
                String description = rs.getString("description");
                Author a = new Author(id_author, name, birthday, description);
                return a;
            }
        } catch (Exception e) {
            System.out.println("Loi");
        }
        return null;
    }
    
    public Publisher getPublisherById(int id) {
        String sql = "SELECT * FROM tbl_publiser";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id_publisher = rs.getInt("id");
                String name = rs.getString("name");
                int id_address = rs.getInt("id_address");
                String houseNumber = rs.getString("house_number");
                String street = rs.getString("street");
                String province = rs.getString("province");
                String city = rs.getString("city");
                String country = rs.getString("country");
                Address add = new Address(id_address, houseNumber, street, province, city, country);
                Publisher b = new Publisher(id_publisher, name, add);
                return b;
            }
        } catch (Exception e) {
            System.out.println("Loi");
        }
        return null;
    }
}
