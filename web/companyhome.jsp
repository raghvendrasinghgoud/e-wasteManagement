<%@page import="java.util.ArrayList"%>
<%@page import="com.pkg.entities.Product"%>
<%@page import="com.pkg.entities.Product"%>
<%@page import="com.pkg.dao.productDAO"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page import="com.pkg.entities.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <meta name="copyright" content="MACode ID, https://macodeid.com/">

  <title>e-waste</title>
  <link rel="icon" href="images/logo.svg" type="image/icon type">
  <link rel="stylesheet" href="assets/css/maicons.css">

  <link rel="stylesheet" href="assets/css/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/css/theme.css">
  
  <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<!--  products css-->
  <link rel="stylesheet" href="assets/css/product.css">
</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top">
  </div>
  <%@include file="header.jsp" %>
  <%
      
    //checking if session has key or not else redirected to login
            User u=(User)session.getAttribute("user");
            if(u==null){
            response.sendRedirect("login.jsp");
            }
            
            productDAO product=new productDAO(connectionProvider.getConnection());
            ArrayList<Product> pro;
            
            
                pro=product.getProducts();
            
            
            
                    
  
  %>
  <form action="searchproduct.jsp" onsubmit="true" method="get">
  <div class="col-md-4 offset-md-4 mt-5 border border-success pt-3">
  <div class="input-group mb-3">
    <input type="text" name="query" class="form-control" placeholder="Search ......" aria-label="Recipient's username">
    <input type="submit" class="btn btn-primary" value="Search">
    </div>
  </div>
  </form>
<!--  products posts shown below-->
<div class="container mydiv">
    <div class="row">
        <%
            
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

<!-- footer started -->
  <%@include file="footer.jsp" %>
<!--bootstrap javascript-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--bottstrap javascript ends-->
<script src="../assets/js/jquery-3.5.1.min.js"></script>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script src="../assets/js/google-maps.js"></script>

<script src="../assets/vendor/wow/wow.min.js"></script>

<script src="../assets/js/theme.js"></script>
  
</body>
</html>