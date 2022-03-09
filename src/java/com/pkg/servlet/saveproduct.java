
package com.pkg.servlet;

import com.pkg.dao.productDAO;
import com.pkg.entities.Product;
import com.pkg.entities.User;
import com.pkg.helper.Helper;
import com.pkg.helper.connectionProvider;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;




@MultipartConfig
public class saveproduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
    HttpSession session=request.getSession(); 
    //checking if session has key or not else redirected to login
    User u=(User)session.getAttribute("user");
    if(u==null || u.getUsertype().equals("company")){
        response.sendRedirect("login.jsp");
    }
   
    Part image=request.getPart("image");
    String name=request.getParameter("pname");
    String brand=request.getParameter("brandname");
    String price=request.getParameter("pprice");
    String weight=request.getParameter("weight");
    String description=request.getParameter("description");
    String ownerEmail=u.getEmail();
    String phonel_4digit=u.getPhone().substring(6)+".";
    String soldstatus="unsold";
    String imagename=image.getSubmittedFileName();
    imagename=imagename.replace(".", phonel_4digit);
    imagename=imagename.replace(" ", "_");
    System.out.println(imagename+" is generated imagename of file ");
    Product p=new Product(imagename,name,brand,price,weight,description,soldstatus,ownerEmail);
    productDAO pd=new productDAO(connectionProvider.getConnection());
    if(pd.saveProduct(p)){ 
        String path=Helper.ImageFilePath+File.separator+imagename;
        System.out.println(path+" is generated path");
        Helper.saveImage(image.getInputStream(), path);
        System.out.println("Product inserted successfully");
        response.sendRedirect("yourposts.jsp");
    }
    else System.out.println("Product not inserted ");
    
    
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
