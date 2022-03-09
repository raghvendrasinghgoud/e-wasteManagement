<%-- 
    Document   : login
    Created on : 21 Oct, 2021, 10:28:19 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="images/logo.svg" type="image/icon type">
  <link rel="stylesheet" href="assets/css/maicons.css">

  <link rel="stylesheet" href="assets/css/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/css/theme.css">
    </head>
    <body>
         <div class="back-to-top"></div>

  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky" data-offset="500">
      <div class="container">

        <a href="#" class="navbar-brand"><img src="images/logo.svg" alt="logo"
            style="width: 20%; margin-right: 20px;">E-<span class="text-primary">Waste</span></a>

        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent"
          aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarContent">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="signup.jsp">SignUp</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="aboutus.jsp">AboutUs</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    </div>
  </header>

  <!-- login form start -->
  <div style="padding: 7% 30% 7% 30%;">
    <h2>Admin Login</h2>
    <form action="adminLoginServlet" method="post">
      <div class="form-group"><label class="text-muted" for="exampleInputEmail1">Email address</label><input
          type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
          placeholder="Enter email"> <small id="emailHelp" class="form-text text-muted">We don't share email with
          anyone</small></div>
      <div class="form-group"><label class="text-muted" for="exampleInputPassword1">Password</label><input
          type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password"></div>
      <div class="form-group" style="display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      flex-wrap: wrap;">  
        
      </div> <button type="submit" class="btn btn-primary">Login</button>
    </form>

  </div>
  <!-- login form end -->
  <footer class="page-footer bg-image" style="background-image: url(assets/img/world_pattern.svg);">
    <div class="container">
      <p class="text-center" id="copyright">Copyright &copy; 2021. This website is design and develop by Group 9</p>
    </div>
  </footer>

  <script src="assets/js/jquery-3.5.1.min.js"></script>

  <script src="assets/js/bootstrap.bundle.min.js"></script>

  <script src="assets/js/google-maps.js"></script>

  <script src="assets/vendor/wow/wow.min.js"></script>

  <script src="assets/js/theme.js"></script>
    </body>
</html>

