
<%@page import="com.pkg.dao.customerDAO"%>
<%@page import="com.pkg.dao.companyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pkg.entities.BuyingRequests"%>
<%@page import="com.pkg.dao.BuyingRequestsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.pkg.entities.Product"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page import="com.pkg.entities.User"%>
<%@page import="com.pkg.dao.productDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>your posts</title>
        <title>Post Product</title>
    <link rel="icon" href="images/logo.svg" type="image/icon type">
  <link rel="stylesheet" href="assets/css/maicons.css">

  <link rel="stylesheet" href="assets/css/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/css/theme.css">
  
    <!--  products css-->
  <link rel="stylesheet" href="assets/css/product.css">
  <link rel="stylesheet" href="assets/css/viewproduct.css">
  
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            //checking if session has key or not else redirected to login
            User u=(User)session.getAttribute("user");
            if(u==null){
            response.sendRedirect("login.jsp");
            }
            String email=request.getParameter("email");
            customerDAO cd=new customerDAO(connectionProvider.getConnection());
            Customer c=cd.getCustomer(email);
        %>
        <div class="page-content page-container" id="page-content">
    <div class="padding">
        <div >
            <div >
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white">
                                
                                <h2 class="f-w-1000"><%= c.getFirstName()+" "+c.getLastName() %></h2>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Customer Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">E-mail</p>
                                        <h6 class="text-muted f-w-400"><%= c.getEmail() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Phone</p>
                                        <h6 class="text-muted f-w-400"><%= c.getPhone() %></h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Address</h6>
                                <h6 class="text-muted f-w-400"><%= c.getAddress() %></h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Pincode</p>
                                        <h6 class="text-muted f-w-400"><%= c.getPincode() %></h6>
                                    </div>
                                </div>
                                <ul class="social-link list-unstyled m-t-40 m-b-10">
                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <%@include file="footer.jsp" %>
        <script src="../assets/js/jquery-3.5.1.min.js"></script>

        <script src="../assets/js/bootstrap.bundle.min.js"></script>

        <script src="../assets/js/google-maps.js"></script>

        <script src="../assets/vendor/wow/wow.min.js"></script>

        <script src="../assets/js/theme.js"></script>
    </body>
</html>
