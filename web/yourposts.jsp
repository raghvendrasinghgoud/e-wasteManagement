<%-- 
    Document   : yourposts
    Created on : Nov 7, 2021, 5:07:46 PM
    Author     : ragha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.pkg.entities.Product"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page import="com.pkg.entities.User"%>
<%@page import="com.pkg.dao.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    </head>
    <body>
        <%@include file="header.jsp" %>
        <h2 style="text-align: center;font-weight: bolder">Your Posts</h2>
  <div class="container mydiv">
    <div class="row">
        <%
            //checking if session has key or not else redirected to login
            User u=(User)session.getAttribute("user");
            if(u==null || !u.getUsertype().equals("customer")){
            response.sendRedirect("login.jsp");
            }
            productDAO product=new productDAO(connectionProvider.getConnection());
            ArrayList<Product> pro=product.getCustomerProducts(u.getEmail());
            for(Product p:pro){
            
        %>
        <div class="col-md-4">
            <!-- bbb_deals -->
            <div class="bbb_deals">
                <div class="bbb_deals_title"><%= p.getName() %></div>
                <div class="bbb_deals_slider_container">
                    <div class=" bbb_deals_item">
                        <div class="bbb_deals_image"><img style="object-fit:contain;max-height: 240px;" src="Products_Image/<%= p.getImage() %>" alt="no image found"></div>
                        <div class="bbb_deals_content">
                            <div class="bbb_deals_info_line d-flex flex-row justify-content-start">
                                <div class="bbb_deals_item_name"><%= p.getBrand() %></div>
                                <div class="bbb_deals_item_price ml-auto">&#8377 <%= p.getPrice() %></div>
                            </div>
                            <div class="available">
                                <div class="available_line d-flex flex-row justify-content-start">
                                  
                                    <a href="showproduct.jsp?id=<%= p.getPid() %>"><input type="submit" class="btn btn-primary" value="View Product"></a>
                                    <%  if(!p.getSoldStatus().equals("sold")){   %>
                                    <a href="deleteProduct?id=<%= p.getPid() %>"><input type="submit" class="btn btn-danger" value="Delete Product"></a>
                                    <% } %>
                                </div>
                                <div class="available_bar"><span style="width:17%"></span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        
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
