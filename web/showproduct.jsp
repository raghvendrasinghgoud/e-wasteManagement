<%-- 
    Document   : showproduct.jsp
    Created on : Nov 7, 2021, 11:52:22 PM
    Author     : ragha
--%>

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
            String pid=request.getParameter("id");
            productDAO product=new productDAO(connectionProvider.getConnection());
            Product p=product.getproduct(pid);
        %>
        <div class="page-content page-container" id="page-content">
    <div class="padding">
        <div >
            <div >
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white">
                                <div class="m-b-25"> <img src="Products_Image/<%= p.getImage() %>" class="img-radius" alt="User-Profile-Image"> </div>
                                <h6 class="f-w-600"><%= p.getName() %></h6>
                                <p>Brand:<%= p.getBrand() %></p> <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Product Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Price</p>
                                        <h6 class="text-muted f-w-400">&#8377 <%= p.getPrice() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Weight</p>
                                        <h6 class="text-muted f-w-400"><%= p.getWeight() %>g</h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Description</h6>
                                <h6 class="text-muted f-w-400"><%= p.getDescription() %></h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Status</p>
                                        <h6 class="text-muted f-w-400"><%= p.getSoldStatus() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Product Owner</p>
                                        <%
                                            customerDAO cd=new customerDAO(connectionProvider.getConnection());
                                            Customer cus=cd.getCustomer(p.getOwnerEmail());
                                        %>
                                        <h6 class="text-muted f-w-400"><%= cus.getFirstName()+" "+cus.getLastName() %></h6>
                                        <% 
                                            if(u.getUsertype().equals("company")){
                                                BuyingRequests br=new BuyingRequestsDAO(connectionProvider.getConnection()).ifRequestedproduct(pid, u.getEmail());
                                                if(br!=null){
                                        %>
                                        <form action="cancelRequest?pid=<%= pid %>&companyemail=<%= u.getEmail() %>" method="post"><input style="background-color: green;" type="submit" class="btn btn-primary" value="Requested"></form>
                                        <% }else{
                                            if(!p.getSoldStatus().equals("sold")){
                                        %>
                                        <form action="sendRequest?pid=<%= pid %>&companyemail=<%= u.getEmail() %>&owneremail=<%= p.getOwnerEmail() %>" method="post"><input type="submit" class="btn btn-primary" value="Buy Now"></form>
                                        <%
                                            }
                                            }/*end of else*/ } //end of usertype condition %>
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
        
<!--        Buying Requests Table Starts-->

 <%
          if(p.getOwnerEmail().equals(u.getEmail())){
      %>
<div style="margin: 2%;padding: 4%;">
    <h2 style="text-align: center">Company Requests</h2>
    
        <table class="table ">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Company Name</th>
      <th scope="col">View Profile</th>
      <th scope="col">Approve</th>
    </tr>
  </thead>
  <tbody>
     <%
         BuyingRequestsDAO bd=new BuyingRequestsDAO(connectionProvider.getConnection());
         ArrayList<BuyingRequests> br=bd.getRequests(pid);
         for(BuyingRequests b:br){
             
             //getting company details
            companyDAO comd=new companyDAO(connectionProvider.getConnection());
                Company com=comd.getCompany(b.getCompanyEmail());
            
     %>
    <tr>
      <td><%= com.getCompanyName() %></td>
      <td><a href="showcompany.jsp?email=<%=com.getEmail() %>"><input type="submit" class="btn btn-primary" value="View Company"></a></td>
      <td><a href="approveRequest?pid=<%=b.getPid() %>&email=<%=com.getEmail() %>"><input type="submit" class="btn btn-primary" value="Approve"></a></tr>
    <% } //end of foreach loop %>
  </tbody>
</table>


</div>
<% } //ending if statement %>
<!--        Buying Requests Table ends-->
 <%@include file="footer.jsp" %>
        <script src="../assets/js/jquery-3.5.1.min.js"></script>

        <script src="../assets/js/bootstrap.bundle.min.js"></script>

        <script src="../assets/js/google-maps.js"></script>

        <script src="../assets/vendor/wow/wow.min.js"></script>

        <script src="../assets/js/theme.js"></script>
    </body>
</html>
