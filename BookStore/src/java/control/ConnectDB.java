/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author HIEU
 */
public class ConnectDB {
    
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;

    public ConnectDB() {
        conn = openConnect();
    }
    
    public Connection getConnection() {
        return this.conn;
    }
    
    
    protected void hasDriver() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (Exception e) {
            System.out.println("Invalid Driver!! Please check this driver...");
        }

    }
    protected Connection openConnect() {
        try {
            if (conn == null) {
                hasDriver();
                String url = "jdbc:sqlserver://localhost\\EVALUATION:1433; databasename=Bookstore; username=sa; password=12345678";
                conn = DriverManager.getConnection(url);
            }
        } catch (Exception e) {
            System.out.println("Error Connecton! Please check url or username and password of SQL Server!");
        }
        return conn;
    }

    protected Statement getStatement() {
        try {
            if (stmt == null) {
                stmt = openConnect().createStatement();
            }
        } catch (Exception e) {
            System.out.println("Please check statement");
        }
        return stmt;
    }

    public void closeConnect() {
        try {
            if (conn != null) {
                conn.close();
            }
            if (rs != null & !rs.isClosed()) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        } catch (Exception e) {
            System.out.println("Please check close connect, stmt, resutlset");
        }
    }
    
}
