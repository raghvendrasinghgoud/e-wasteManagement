
package com.pkg.servlet;

import com.pkg.dao.companyDAO;
import com.pkg.dao.customerDAO;
import com.pkg.entities.Company;
import com.pkg.entities.Customer;
import com.pkg.helper.connectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class userLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String usertype=request.getParameter("usertype");
        if(usertype.equals("company")){
            companyDAO cd=new companyDAO(connectionProvider.getConnection());
            Company c=cd.companyLogin(email, password, usertype);
            if(c!=null){
                HttpSession session=request.getSession();
                session.setAttribute("user", c);
                session.setAttribute("usertype", c.getUsertype());
                session.setAttribute("email", c.getEmail());
                response.sendRedirect("index.jsp");
            }else{
                HttpSession session=request.getSession();
                session.setAttribute("error", "Invalid Credentials");
                response.sendRedirect("login.jsp");
            }
        }else{
            if(usertype.equals("customer")){
                customerDAO cd=new customerDAO(connectionProvider.getConnection());
                Customer c=cd.customerLogin(email, password, usertype);
                if(c!=null){
                HttpSession session=request.getSession();
                session.setAttribute("user", c);
                session.setAttribute("usertype", usertype);
                session.setAttribute("email", c.getEmail());
                response.sendRedirect("index.jsp");
            }else{
                HttpSession session=request.getSession();
                session.setAttribute("error", "Invalid Credentials");
                response.sendRedirect("login.jsp");
            }
            }
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
