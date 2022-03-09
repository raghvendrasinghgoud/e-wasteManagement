<%-- 
    Document   : sendotp
    Created on : Nov 3, 2021, 3:35:58 PM
    Author     : ragha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.pkg.helper.Mail" %>

<%! 
//      declarations
      
      Mail mail=new Mail();
      String genOTP=mail.getOtp();
      void sendmail(String email){
      mail.sendOTP(email, genOTP);
  }
  %>
    
  <%
      //processing
      String email=request.getParameter("email");
      request.setAttribute("otp", genOTP);
      mail.sendOTP(email, genOTP);
      
      RequestDispatcher rd=request.getRequestDispatcher("submitOTP.jsp");
      rd.forward(request, response);
      
  %>