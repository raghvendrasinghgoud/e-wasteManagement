
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
  <style>
      .new{
          font-family: Arial, sans-serif;
          padding: 3%;
          margin: 2%;
          box-sizing: border-box;
          justify-content: evenly;
      }
      .new h2{
          font-size: 30px;
      }
      .new p{
          font-size: 20px;
      }
  </style>
</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top">
  </div>
  <%@include file="header.jsp" %>
  <%
      User u=(User)session.getAttribute("user");
      if(u!=null){
          if(u.getUsertype().equals("company"))
               response.sendRedirect("companyhome.jsp");
      }
  %>
  <div class="card card-image">
      <img src="assets/img/ewastebanner.jpg" alt="banner">
  </div>>
  <div class="new">
      <h2 >Electronic waste, e-waste, e-scrap, Waste Electrical and Electronic Equipment (WEEE)</h2>
      <p>Electronics industry is the world?s fastest growing manufacturing industry. Rapid growth, combined 
         with rapid product obsolescence and discarded electronics has escalated the growth of electronic 
         waste and is about to reach disastrous proportions in coming years.
         
        Electronic waste or e-waste is collection of old, unwanted and abandoned electrical gadgets and appliances
        like computers, monitors, televisions, audio equipment, printers and other home electronic devices which
        comprises of a multitude of components, containing toxic substances that can have an adverse impact on human
        health and the environment if not disposed properly.</p>      
  </div>
  <div class="new">
      <h2 >What is E-Waste?</h2>
      <p>E-waste refers to electronic products nearing the end of their ?useful life?, for example, computers, televisions, VCRs, stereos, copiers, and fax machines. Many of these products can be reused, refurbished, or recycled.</p>      
  </div>
  <div class="new">
      <h2>What we do with E-Waste?</h2>
      <p>Reduce, reuse, and recycle. Reduce your generation of e-waste through smart procurement and good maintenance.
          Reuse still-functioning electronic equipment by donating or selling it to someone. Recycle those components that cannot be 
          repaired. Most electronic devices contain a variety of materials, including metals that can be recycled.</p>
  </div>
  <%@include file="footer.jsp" %>

<script src="../assets/js/jquery-3.5.1.min.js"></script>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script src="../assets/js/google-maps.js"></script>

<script src="../assets/vendor/wow/wow.min.js"></script>

<script src="../assets/js/theme.js"></script>
  
</body>
</html>