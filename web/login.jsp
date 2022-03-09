<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <meta name="copyright" content="MACode ID, https://macodeid.com/">

  <title>Login</title>
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
  <%
      String err="";
      if(session.getAttribute("error")!=null){
          err=(String)session.getAttribute("error");
      }
      System.out.println(session.getAttribute("error")+" is error msg");
  %>
  <!-- login form start -->
  <div style="padding: 7% 30% 7% 30%;">
    <h2>Login</h2>
    <form action="userLogin" method="post">
        <span Style="float: right;" class="text-danger font-weight-bold"><%=err%></span>
      <div class="form-group"><label for="userid" class="text-muted" >Email address</label><input
              type="email" name="email" class="form-control"  aria-describedby="emailHelp"
          placeholder="Enter email" required> </div>
      <div class="form-group"><label class="text-muted" for="password">Password</label><input
              type="password" class="form-control" id="password" name="password" placeholder="Enter Password"></div>
      <div class="form-group" style="display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      flex-wrap: wrap;">
        <div>
        <input class="form-check-input position-static"
               type="radio" id="customer" name="usertype" value="customer" aria-label="..." required checked>
        <label class="text-muted" for="customer">Customer</label>
      </div>
        <!-- </div>
        <div class="form-group"></div> -->
        <div>
        <input class="form-check-input position-static" name="usertype" type="radio" id="company"
        value="company" aria-label="...">
        <label class="text-muted" for="company">Company</label>
      </div>
      </div> <button type="submit" class="btn btn-primary">Login</button>
    </form>

  </div>
  <!-- login form end -->
  <%@include file="footer.jsp" %>

  <script src="../assets/js/jquery-3.5.1.min.js"></script>

  <script src="../assets/js/bootstrap.bundle.min.js"></script>

  <script src="../assets/js/google-maps.js"></script>

  <script src="../assets/vendor/wow/wow.min.js"></script>

  <script src="../assets/js/theme.js"></script>

</body>

</html>