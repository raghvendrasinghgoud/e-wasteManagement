<%@page import="com.pkg.dao.UserDAO"%>
<%@page import="com.pkg.dao.companyDAO"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page import="com.pkg.entities.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <meta name="copyright" content="MACode ID, https://macodeid.com/">

  <title>Edit profile</title>
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
            //checking if session has key or not else redirected to login
            User u=(User)session.getAttribute("user");
            if(u==null){
            response.sendRedirect("login.jsp");
            }
            
            System.out.println(u.getEmail()+" is the email after update");
            u=new UserDAO(connectionProvider.getConnection()).getUser(u.getEmail());
            String firstName=u.getFirstName();
     String lastName=u.getLastName();
     String email=u.getEmail();
     String phone=u.getPhone();
     String password=u.getPassword();
     String usertype=u.getUsertype();
     String address=u.getAddress();
     String pincode=u.getPincode();
     System.out.println(u.toString());
     String companyName="";
            if(u.getUsertype().equals("company")){
                companyDAO cd=new companyDAO(connectionProvider.getConnection());
                Company c=cd.getCompany(u.getEmail());
                companyName=c.getCompanyName();
                phone=c.getPhone();
            }
        %>
    <div style="padding: 7% 30% 7% 30%;">
      <h2>Edit Profile</h2>
      <form action="updateUser" onsubmit="return validFname()" method="get">
        <!-- first name input -->
        <div class="form-group" ><label class="text-muted" for="firstname"><%= firstName %></label>
            <input type="text" name="field" value="firstname" hidden>
          <input type="text" name="firstname" class="form-control" id="firstname" placeholder="Enter First Name" required>
          <span id="fnameerror" class="text-danger font-weight-bold"></span>
          <input type="submit" class="btn btn-primary" value="edit Name">
        </div>
      </form>
        <!-- last name input -->
        <form action="updateUser" onsubmit="return validLname()" method="get">
        <div class="form-group"><label class="text-muted" for="lastname"><%= lastName %></label>
            <input type="text" name="field" value="lastname" hidden>
          <input type="text" name="lastname" class="form-control" id="lastname" placeholder="Enter Last Name" required>
          <span id="lnameerror" class="text-danger font-weight-bold"></span>
          <input type="submit" class="btn btn-primary" value="edit Lastname">
        </div>
        </form>
        <!-- email input -->
        <form action="updateUser" onsubmit="return validEmail()" method="get">
        <div class="form-group"><label class="text-muted" for="email"><%= email %></label>
            <input type="text" name="field" value="email" hidden>
            <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp"
            placeholder="Enter email" required> 
            <span id="emailerror" class="text-danger font-weight-bold"></span>
            <input type="submit" class="btn btn-primary" value="change Email">
        </div>
        </form>
        <!-- phone input -->
        <form action="updateUser" onsubmit="return validPhone()" method="get">
        <div class="form-group"><label class="text-muted" for="phone"><%= phone %></label>
          <input type="text" name="field" value="phone" hidden>
            <input type="number" name="phone" class="form-control" id="phone" aria-describedby="emailHelp"
            placeholder="Enter Phone" required>
            <span id="phoneerror" class="text-danger font-weight-bold"></span>
            <input type="submit" class="btn btn-primary" value="edit Phone">
        </div>
        </form>
        <!-- password input -->
        <form action="updateUser" onsubmit="return validPass()" method="get">
        <div class="form-group"><label class="text-muted" for="exampleInputPassword1">*************</label>
            <input type="text" name="field" value="password" hidden>
            <input
            type="password"  name="password" class="form-control" id="password" placeholder="Password" required>
        </div>
        <!-- Confirm password input -->
        <div class="form-group"><label class="text-muted" for="confirmpassword">Confirm Password</label>
            <input type="password" name="confirmpassword" class="form-control" id="confirmpassword" placeholder="Confirm Password" required>
            <span id="passerror" class="text-danger font-weight-bold"></span>
          </div>
        <input type="submit" class="btn btn-primary" value="Change Password">
        </form>
        
        <!--          checking if user is company or customer -->
        <%
            if(u.getUsertype().equals("company")){
        %>
<!--        company name update-->
        <form action="updateUser" method="get">
        <div class="form-group" style="display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        flex-wrap: wrap;">

        </div>
        <!-- company name input -->
        <div class="form-group" id = "Comapny_name_input" ><label class="text-muted" for="companyname"><%=companyName %></label>
            <input type="text" name="field" value="companyname" hidden>
          <input type="text" name="companyname" class="form-control" id="companyname" placeholder="Enter Company Name" >
          <input type="submit" class="btn btn-primary" value="edit Company">
        </div>
        </form>
            <% } %>

        <!-- address fields -->
        <form action="updateUser" method="get">
        <div class="form-group"><label class="text-muted" for="address"><%= address %></label>
            <input type="text" name="field" value="address" hidden>
          <input type="text" name="address" class="form-control" id="address"
            placeholder="House no./Street/Area/City/State">
          <input type="submit" class="btn btn-primary" value="edit Address">
        </div>
        </form>
        <!-- pincode input -->
        <form action="updateUser" method="get">
        <div class="form-group"><label class="text-muted" for="pin"><%= pincode %></label>
            <input type="text" name="field" value="pincode" hidden>
          <input type="number" name="pincode" class="form-control" id="pin" placeholder="Enter Pincode" required>
          <span id="pinerror" class="text-danger font-weight-bold"></span>
        </div>
        <input type="submit" class="btn btn-primary" value="edit Pin">
      </form>
      
    </div>
    <%@include file="footer.jsp" %>

    <script src="../assets/js/jquery-3.5.1.min.js"></script>

    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <script src="../assets/js/google-maps.js"></script>

    <script src="../assets/vendor/wow/wow.min.js"></script>

    <script src="../assets/js/theme.js"></script>
    <!-- validation js file -->
    <script src="assets/js/updatevalid.js"></script>
</body>

</html>