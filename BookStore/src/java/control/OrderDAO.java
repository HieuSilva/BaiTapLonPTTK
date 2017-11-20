/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import model.order.BookOrder;
import model.order.OnlineOrder;

/**
 *
 * @author HIEU
 */
public class OrderDAO {

    private ConnectDB connectDB;
    private Connection con;

    public OrderDAO() {
        connectDB = new ConnectDB();
        con = connectDB.getConnection();
    }
    
    public boolean addOnlineOrder(OnlineOrder order) {
        String sql = "INSERT INTO tbl_online_order(create_date, id_customer, id_shipping_address, state) "
                + "VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            java.util.Date utilDate = new Date();
            java.sql.Date createDate = new java.sql.Date(utilDate.getTime());
            int idCustomer = order.getCustomer().getAccount().getId();
            int idAddress = order.getShippingAddress().getId();
            String state = order.getState();
            
            ps.setDate(1, createDate);
            ps.setInt(2, idCustomer);
            ps.setInt(3, idAddress);
            ps.setString(4, state);
            ps.executeUpdate();
            
            for(BookOrder bo : order.getItemList()) {
                String query = "INSERT INTO tbl_book_order(id_book, id_online_order, price, quantity) "
                                + "VALUES(?,?,?,?); ";
                PreparedStatement st = con.prepareStatement(sql);
                st.setInt(1, bo.getBook().getId());
                st.setInt(2, getMaxOrderId());
                st.setFloat(3, bo.getPrice());
                st.setInt(4, bo.getQuantity());
                st.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public int getMaxOrderId() {
        String sql = "SELECT MAX(id) as id FROM tbl_online_order";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.last()) {
                rs.beforeFirst();
                while(rs.next())
                    return rs.getInt("id");
            }
        }catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
}
