
package com.pkg.servlet;

import com.pkg.entities.Company;
import com.pkg.entities.Customer;
import com.pkg.helper.Mail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class afterSignup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName=request.getParameter("firstname");
        String lastName=request.getParameter("lastname");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String password=request.getParameter("password");
        String usertype=request.getParameter("usertype");
        String address=request.getParameter("address");
        String pincode=request.getParameter("pin");
        String companyName="";
        String msg="OTP sent Successfully";
        //creating mail object
        Mail mail=new Mail();
        //generating otp
      String genOTP=mail.getOtp();
        //sending mail to verify email
      mail.sendOTP(email, genOTP);
      
   HttpSession session=request.getSession();
      session.setAttribute("email", email);
      session.setAttribute("otp", genOTP);
      session.setAttribute("error",msg);
   
        if(usertype.equals("company")){
            companyName=request.getParameter("companyname");
            Company c=new Company(companyName,firstName,lastName,email,phone,password,usertype,
            address,pincode);           
            session.setAttribute("user", c);
            session.setAttribute("utype", "company");
        }else{
            if(usertype.equals("customer")){
            Customer c=new Customer(firstName,lastName,email,phone,password,usertype,
            address,pincode);
            session.setAttribute("user", c);
            session.setAttribute("utype", "customer");
            }
        }
        response.sendRedirect("submitOTP.jsp");
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
