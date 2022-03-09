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
  
    <div style="padding: 7% 30% 7% 30%;">
      <h2>SignUp</h2>
      <form action="afterSignup" name="signup" onsubmit="return validation()" method="get">
        <!-- first name input -->
        <div class="form-group"><label class="text-muted" for="firstname">First Name</label>
          <input type="text" name="firstname" class="form-control" id="firstname" placeholder="Enter First Name" required>
          <span id="fnameerror" class="text-danger font-weight-bold"></span>
        </div>
        <!-- last name input -->
        <div class="form-group"><label class="text-muted" for="lastname">Last Name</label>
          <input type="text" name="lastname" class="form-control" id="lastname" placeholder="Enter Last Name" required>
          <span id="lnameerror" class="text-danger font-weight-bold"></span>
        </div>
        <!-- email input -->
        <div class="form-group"><label class="text-muted" for="email">Email address</label>
            <input type="email" name="email" onfocusout="emailExists()" class="form-control" id="email" aria-describedby="emailHelp"
            placeholder="Enter email" required> <small id="emailHelp" class="form-text text-muted">We don't share email with
            anyone</small>
            <span id="emailerror" class="text-danger font-weight-bold"></span>
        </div>
        <!-- phone input -->
        <div class="form-group"><label class="text-muted" for="phone">Phone</label>
          <input type="number" name="phone" onfocusout="phoneExists()" class="form-control" id="phone" aria-describedby="emailHelp"
            placeholder="Enter Phone" required>
            <span id="phoneerror" class="text-danger font-weight-bold"></span>
        </div>
        <!-- password input -->
        <div class="form-group"><label class="text-muted" for="exampleInputPassword1">Password</label><input
            type="password"  name="password" class="form-control" id="password" placeholder="Password" required>
        </div>
        <!-- Confirm password input -->
        <div class="form-group"><label class="text-muted" for="confirmpassword">Confirm Password</label><input
            type="password" name="confirmpassword" class="form-control" id="confirmpassword" placeholder="Confirm Password" required>
            <span id="passerror" class="text-danger font-weight-bold"></span>
          </div>
        <div class="form-group" style="display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        flex-wrap: wrap;">
          <!-- company or customer radio button -->
          <div>
            <input class="form-check-input position-static" id="customer" type="radio" name="usertype" 
            oninput="hide_company_name(event)"
              value="customer" aria-label="..." checked>
            <label class="text-muted" for="customer">Customer</label>
          </div>

          <div>
            <input class="form-check-input position-static" id="company" type="radio" name="usertype" 
            oninput="hide_company_name(event)"
              value="company" aria-label="...">
            <label class="text-muted" for="company">Company</label>
          </div>
        </div>
        <!-- company name input -->
        <div class="form-group" id = "Comapny_name_input" style="display: none;"><label class="text-muted" for="companyname">Company Name</label>
          <input type="text" name="companyname" class="form-control" id="companyname" placeholder="Enter Comapny Name" >
        </div>

        <!-- address fields -->
        <div class="form-group"><label class="text-muted" for="address">Address</label>
          <input type="text" name="address" class="form-control" id="address"
            placeholder="House no./Street/Area/City/State">
        </div>
        <!-- pincode input -->
        <div class="form-group"><label class="text-muted" for="pin">Pincode</label>
          <input type="number" value="450119" name="pin" class="form-control" id="pin" placeholder="Enter Pincode" required>
          <span id="pinerror" class="text-danger font-weight-bold"></span>
        </div>
        <!-- submit form -->
        <input type="submit" class="btn btn-primary" value="Login">
    
      </form>
      
    </div>
    <%@include file="footer.jsp" %>

    <script src="assets/js/jquery-3.5.1.min.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/google-maps.js"></script>

    <script src="assets/vendor/wow/wow.min.js"></script>

    <script src="assets/js/theme.js"></script>
    <!-- validation js file -->
    <script src="assets/js/script.js"></script>
</body>

</html>