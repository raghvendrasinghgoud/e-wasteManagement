
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

public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        
//        String firstName=request.getParameter("firstname");
//        String lastName=request.getParameter("lastname");
//        String email=request.getParameter("email");
//        String phone=request.getParameter("phone");
//        String password=request.getParameter("password");
//        String usertype=request.getParameter("usertype");
//        String address=request.getParameter("address");
//        String pincode=request.getParameter("pin");
//        String companyName="";
        HttpSession session=request.getSession();
        String usertype=session.getAttribute("utype").toString();
        System.out.println(usertype+" is usertype object data");
        if(usertype.equals("company")){
            Company c=(Company)session.getAttribute("user");
            companyDAO cd=new companyDAO(connectionProvider.getConnection());
            cd.saveCompany(c);
            System.out.println("company Registered");
                session.setAttribute("user", c);
                session.setAttribute("usertype", c.getUsertype());
                session.setAttribute("email", c.getEmail());
        }else{
            if(usertype.equals("customer")){
                Customer c=(Customer)session.getAttribute("user");
                customerDAO cd=new customerDAO(connectionProvider.getConnection());
                cd.saveCustomer(c);
                System.out.println("customer Registered");
                session.setAttribute("user", c);
                session.setAttribute("usertype", c.getUsertype());
                session.setAttribute("email", c.getEmail());
            }
        }
        
                
        response.sendRedirect("index.jsp");
        
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
