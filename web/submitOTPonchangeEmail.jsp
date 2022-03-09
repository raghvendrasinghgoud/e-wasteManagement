<%-- 
    Document   : submitOTP
    Created on : Nov 3, 2021, 1:02:22 PM
    Author     : ragha
--%>

<%@page import="com.pkg.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <meta name="copyright" content="MACode ID, https://macodeid.com/">

  <title>Sign up</title>
  <link rel="icon" href="images/logo.svg" type="image/icon type">
  <link rel="stylesheet" href="assets/css/maicons.css">

  <link rel="stylesheet" href="assets/css/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/css/theme.css">
  
  

</head>

<body>
  <!-- Back to top button -->
  <div class="back-to-top"></div>

  <%@include file="header.jsp" %>
  <%@page import="com.pkg.helper.Mail" %>
  <% 
       //checking if session has key or not else redirected to login
            User u=(User)session.getAttribute("user");
            if(u==null){
            response.sendRedirect("login.jsp");
            }
            
            
    String errmsg=(String)session.getAttribute("error");
  %>
    <div style="padding: 7% 30% 7% 30%;">
      <h2>One Time Password</h2>
      <form action="compOTPforEmail" method="post">
        <!-- OTP input -->
        <div class="form-group" ><label class="text-muted" for="otp">OTP</label>
          <input type="text" name="getotp" class="form-control" id="otp" placeholder="Enter OTP..." >
          <span id="otperror" class="text-danger font-weight-bold"><%=errmsg%></span>
        </div>
<!--        <a style="color:green;float: right;" href="resendOTP">Resent OTP</a>-->
        <input type="submit" class="btn btn-primary" value="Submit">
      </form>
        
    </div>
    <%@include file="footer.jsp" %>
    
    <script src="../assets/js/jquery-3.5.1.min.js"></script>

    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <script src="../assets/js/google-maps.js"></script>

    <script src="../assets/vendor/wow/wow.min.js"></script>

    <script src="../assets/js/theme.js"></script>
    
</body>
</html>