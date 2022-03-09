/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pkg.servlet;

import com.pkg.dao.UserDAO;
import com.pkg.dao.productDAO;
import com.pkg.entities.admin;
import com.pkg.helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class DeleteServlet4 extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        //checking if session has key or not else redirected to login
        HttpSession session=request.getSession();
            admin a=(admin)session.getAttribute("currentAdmin");
            if(a==null){
            response.sendRedirect("adminlogin.jsp");
            }
        
       String id = request.getParameter("id");
       out.println(id);
        
       
         boolean status;
         
         productDAO dao=new productDAO(connectionProvider.getConnection());
                status=dao.deleteProduct(id);
                if(status){
                    response.sendRedirect("adminproduct.jsp");
                }else{
                    out.println("error");
                }
        
    }

}
