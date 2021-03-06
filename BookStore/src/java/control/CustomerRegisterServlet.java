/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.customer.Customer;

/**
 *
 * @author HIEU
 */
@WebServlet(name = "CustomerRegisterServlet", urlPatterns = {"/CustomerRegisterServlet"})
public class CustomerRegisterServlet extends HttpServlet {

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
        
        Account a= new Account();
        String fullname= request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        a.setPassword(password); a.setUsername(username);
        Customer c = new Customer();
        c.setAccount(a);
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        SimpleDateFormat sdf= new SimpleDateFormat("mm/dd/yyyy");
        try {
            java.util.Date birthday = sdf.parse(request.getParameter("birthday"));
            java.sql.Date dbirthday = new java.sql.Date(birthday.getTime());
            c.setBirthday(dbirthday);
        } catch (Exception e) {
            e.printStackTrace();
        }
            c.setFullname(fullname);
            c.setEmail(email);
            c.setPhone(phone);
       
        CustomerDAO cdao = new CustomerDAO();
        if(cdao.addCustomer(c)){
            response.sendRedirect("register_success.jsp");
        }
        else response.sendRedirect("register_failed.jsp");
        
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
