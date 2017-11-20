/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author HIEU
 */
public class OnlineOrder {
    private int id;
    private Date createDate;
    private ArrayList<BookOrder> itemList;
}
