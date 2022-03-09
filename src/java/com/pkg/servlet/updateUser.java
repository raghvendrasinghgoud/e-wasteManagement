
package com.pkg.servlet;

import com.pkg.dao.UserDAO;
import com.pkg.entities.User;
import com.pkg.helper.Mail;
import com.pkg.helper.connectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class updateUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //checking if session has key or not else redirected to login
            HttpSession session=request.getSession();
            User u=(User)session.getAttribute("user");
            if(u==null){
            response.sendRedirect("login.jsp");
            }
            
            UserDAO ud=new UserDAO(connectionProvider.getConnection());
            String fieldName=request.getParameter("field");
            String value=request.getParameter(fieldName);
            System.out.println(fieldName+" "+value);
            if(fieldName.equals("companyname")){
                //update in company table 
                if(ud.updateUserProfile("company", fieldName, value, u.getEmail())){
                    System.out.println("company name updated");
                     response.sendRedirect("editprofile.jsp");
                }else System.out.println("company name not updated");
            }else{
                //checking if field is email
                if(fieldName.equals("email")){
                    //verify email with otp then update email field
                    //sending otp
                    Mail m=new Mail();
                    String otp=m.getOtp();
                    m.sendOTP(value, otp);
                    session.setAttribute("otp", otp);
                    session.setAttribute("newemail", value);
                    session.setAttribute("error", "OTP sent successfully");
                    response.sendRedirect("submitOTPonchangeEmail.jsp");
                }else{
                //update in user table
                if(ud.updateUserProfile("user", fieldName, value, u.getEmail())){
                    System.out.println(fieldName+" updated");
                     response.sendRedirect("editprofile.jsp");
                }else System.out.println(fieldName+" not updated");
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
