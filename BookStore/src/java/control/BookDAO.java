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
import model.book.Category;
import model.book.Publisher;
import model.book.Size;

/**
 *
 * @author HIEU
 */
public class BookDAO {
    
    private ConnectDB connectDB;
    private Connection con;
    //private ResultSet rs;
    
    public BookDAO() {
        connectDB = new ConnectDB();
        con = connectDB.getConnection();
    }
    
    public ArrayList<Book> getAllBook() {
        ArrayList<Book> list = null;
        String sql = "SELECT * FROM tbl_book";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = ps.executeQuery();
            if(rs.last()) {
                System.out.println("Total row " + rs.getRow());
                list = new ArrayList<Book>();
                rs.beforeFirst();
                System.out.println("Row beforefirst " + rs.getRow());
                while (rs.next()) {
                    System.out.println("Row: " + rs.getRow());
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    
                    System.out.println("ID Author" + rs.getInt("id_author"));
                    System.out.println("ID Category" + rs.getInt("id_category"));
                    System.out.println("ID Publisher" + rs.getInt("id_publisher"));
                    System.out.println("ID Size" + rs.getInt("id_size"));
                    
                    int id_author = rs.getInt("id_author");
                    int id_category = rs.getInt("id_category");
                    int id_publisher = rs.getInt("id_publisher");
                    int id_size = rs.getInt("id_size");
                    
                    Author author = getAuthorById(id_author);
                    Publisher publisher = getPublisherById(id_publisher);
                    Category category = getCategoryById(id_category);
                    Size size = getSizeById(id_size);
                    
                    Book b = new Book();
                    b.setId(id);
                    b.setTitle(title);
                    b.setCategory(category);
                    b.setAuthor(author);
                    b.setPublisher(publisher);
                    b.setSize(size);
                    b.setPrice(price);
                    b.setImage(image);
                    
                    list.add(b);
                    
                    System.out.println(b.getId() + " " + b.getTitle() + " " + b.getCategory().getName() + " " + 
                            b.getPublisher().getName() + " " + b.getAuthor().getFullname());
                }
                System.out.println("List book: " + list.size());
                //return list;
            }
        } catch (Exception e) {
            System.out.println("Please check getAllBook index.jsp in BookAO");
            e.printStackTrace();
            return null;
        }
        return list;
    }
    
    public Author getAuthorById(int id) {
        String sql = "SELECT * FROM tbl_author WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id_author = rs.getInt("id");
                String name = rs.getString("fullname");
                Date birthday = rs.getDate("birthday");
                String description = rs.getString("description");
                Author a = new Author(id_author, name, birthday, description);
                return a;
            }
        } catch (Exception e) {
            System.out.println("Loi");
            e.printStackTrace();
        }
        return null;
    }
    
    public Publisher getPublisherById(int id) {
        String sql = "SELECT * FROM tbl_publisher WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
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
            e.printStackTrace();
        }
        return null;
    }
    
    public Size getSizeById(int id) {
        String sql = "SELECT * FROM tbl_size WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id_size = rs.getInt("id");
                float width = rs.getFloat("width");
                float height = rs.getFloat("height");
                float length = rs.getFloat("length");
                float mass = rs.getFloat("mass");
                return new Size(id_size, width, height, length, mass);
            }
        } catch (Exception e) {
            System.out.println("Loi");
            e.printStackTrace();
        }
        return null;
    }
    
    public Category[] getListCategory() {
        Category [] listCategory = null;
        String sql = "SELECT * FROM tbl_category";
        try {
            PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = ps.executeQuery();
            if(rs.last()) {
                listCategory = new Category[rs.getRow()];
                rs.beforeFirst();
                int i = 0;
                while (rs.next()) {
                    listCategory[i++] = new Category(rs.getInt("id"), rs.getString("name"));
                }
                return listCategory;
            }
        } catch (Exception e) {
            System.out.println("Loi");
            e.printStackTrace();
        }
        return listCategory;
    }
    
    public Category getCategoryById(int id) {
        Category [] listCategory = getListCategory();
        for(Category c : listCategory) {
            if(c.getId() == id)
                return c;
        }
        return null;
    }
    
    public Book getBookById(int id) {
        ArrayList<Book> allBook = getAllBook();
        for(Book b : allBook) {
            if(b.getId() == id) {
                return b;
            }
        }
        return null;
    }
}
