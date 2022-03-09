
package com.pkg.servlet;

import com.pkg.dao.BuyingRequestsDAO;
import com.pkg.dao.productDAO;
import com.pkg.entities.User;
import com.pkg.helper.Helper;
import com.pkg.helper.connectionProvider;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class deleteProduct extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        //checking if session has key or not else redirected to login
            User u=(User)session.getAttribute("user");
            if(u==null){
            response.sendRedirect("login.jsp");
            }
            String pid=request.getParameter("id");
            String imagename=new productDAO(connectionProvider.getConnection()).getproduct(pid).getImage();
        //deleting product from product table and from your post page
            if(new productDAO(connectionProvider.getConnection()).deleteProduct(pid)){
                //deleting product image
                String path="C:\\Users\\ragha\\Documents\\NetBeansProjects\\ewaste\\web\\Products_Image"+File.separator+imagename;
                if(Helper.delete(path)) System.out.println("image deleted successfully");
                //deleting products Buying Requests
               // new BuyingRequestsDAO(connectionProvider.getConnection()).deleteBuyingRequests(pid);
                        /* we comment this statement
                            bacause we apply oncascade delete in buying_requests  */
            }else System.out.println("post not deleted");
        response.sendRedirect("yourposts.jsp");
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
