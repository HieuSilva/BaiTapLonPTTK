/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import model.book.Book;

/**
 *
 * @author HIEU
 */
public class BookOrder {
    private Book book;
    private int quantity;
    private float price;
    
    public BookOrder() {
        
    }

    public BookOrder(Book book, int quantity, float price) {
        this.book = book;
        this.quantity = quantity;
        this.price = price;
    }
    
    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
