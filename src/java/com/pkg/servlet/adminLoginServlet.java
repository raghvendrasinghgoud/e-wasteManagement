/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pkg.servlet;

import com.pkg.dao.adminDao;
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
public class adminLoginServlet extends HttpServlet {

    

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        adminDao cd=new adminDao(connectionProvider.getConnection());
            admin a=cd.getAdminByEmailAndPassword(email, password);
            
            
             HttpSession s1 = request.getSession();
                   s1.setAttribute("currentAdmin",a);
			response.sendRedirect("admincustomer.jsp");
    }

    

}
