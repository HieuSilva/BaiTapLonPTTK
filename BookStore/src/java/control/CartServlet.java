/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.book.Book;
import model.order.BookOrder;

/**
 *
 * @author HIEU
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            BookDAO bd = new BookDAO();
            HttpSession session = request.getSession();
            ArrayList<BookOrder> cartList = (ArrayList<BookOrder>) session.getAttribute("cartList");
            if (cartList == null) {
                cartList = new ArrayList<BookOrder>();
            }
            
            String return_url = request.getParameter("return-url");
            String type = request.getParameter("type");


            if (type.equals("add")) {
                int id_book = Integer.parseInt(request.getParameter("book-id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Book b = bd.getBookById(id_book);
                
                BookOrder bo = new BookOrder(b, quantity, b.getPrice());

                boolean exist = false;
                int index = -1;
                for (BookOrder bookOrder : cartList) {
                    if (bo.getBook().getId() == bookOrder.getBook().getId()) {
                        index = cartList.indexOf(bookOrder);
                        exist = true;
                        break;
                    }
                }
                if (exist) {
                    cartList.set(index, bo);
                } else {
                    cartList.add(bo);
                }
            }
            else if(type.equals("remove")) {
                int itemIndex = Integer.parseInt(request.getParameter("item-index"));
                cartList.remove(itemIndex);
                session.setAttribute("cartList", cartList);
            }
            else if(type.equals("update")) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int itemIndex = Integer.parseInt(request.getParameter("item-index"));
                cartList.get(itemIndex).setQuantity(quantity);
                session.setAttribute("cartList", cartList);
            }
            session.setAttribute("cartList", cartList);
            response.sendRedirect(return_url);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
