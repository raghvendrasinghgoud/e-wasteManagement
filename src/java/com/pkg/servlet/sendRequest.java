
package com.pkg.servlet;

import com.pkg.dao.BuyingRequestsDAO;
import com.pkg.entities.BuyingRequests;
import com.pkg.entities.User;
import com.pkg.helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sendRequest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        //checking if session has key or not else redirected to login
    User u=(User)session.getAttribute("user");
    if(u==null || !u.getUsertype().equals("company")){
        response.sendRedirect("login.jsp");
    }
       
        String pid=request.getParameter("pid");
        String companyEmail=request.getParameter("companyemail");
        String ownerEmail=request.getParameter("owneremail");
        
        System.out.println("response is here "+pid+" "+companyEmail+" "+ownerEmail);
        System.out.println("response values are: "+request.toString());
        //creating object if buyingrequest
        BuyingRequests br=new BuyingRequests(pid,companyEmail,ownerEmail);
        BuyingRequestsDAO brd=new BuyingRequestsDAO(connectionProvider.getConnection());
        if(brd.saveBuyingRequest(pid, companyEmail, ownerEmail))
            response.sendRedirect("showproduct.jsp?id="+pid);
        else {
             response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            out.print("<h3>Data not iserted in buying request<h3>");
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
