
package com.pkg.servlet;

import com.pkg.dao.productDAO;
import com.pkg.dao.recievedProductsDAO;
import com.pkg.dao.remainingCollectionsDAO;
import com.pkg.entities.User;
import com.pkg.helper.connectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class collected extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            //checking if session has key or not else redirected to login
            HttpSession session=request.getSession();
            User u=(User)session.getAttribute("user");
            if(u==null || !u.getUsertype().equals("company")){
            response.sendRedirect("login.jsp");
            }
        
        
        
            String pid=request.getParameter("pid");  //taking product id
            String email=request.getParameter("email"); //taking productowner email
            
            System.out.println("recieved para are "+pid+" "+email);
            //saving product to recieved products
            recievedProductsDAO rd=new recievedProductsDAO(connectionProvider.getConnection());
            if(rd.saverecievedProducts(pid, u.getEmail(), email)){
                //deleting request from remaining collections
                remainingCollectionsDAO bd=new remainingCollectionsDAO(connectionProvider.getConnection());
                if(bd.deleteProduct(pid, u.getEmail())) System.out.println("product deleted from remaining collections");
            }
            
            
            //redirecting to yourposts page
            response.sendRedirect("recievedproducts.jsp");
            
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
