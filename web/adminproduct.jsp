<%-- 
    Document   : adminproduct
    Created on : 15 Nov, 2021, 6:13:43 PM
    Author     : hp
--%>

<%@page import="com.pkg.entities.admin"%>
<%@page import="com.pkg.entities.Product"%>
<%@page import="com.pkg.dao.productDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pkg.entities.User"%>
<%@page import="com.pkg.dao.UserDAO"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
      
   
            //checking if session has key or not else redirected to login
        //HttpSession session=request.getSession();
            admin a=(admin)session.getAttribute("currentAdmin");
            if(a==null){
            response.sendRedirect("adminlogin.jsp");
            }
            
            productDAO pr=new productDAO(connectionProvider.getConnection());
            ArrayList<Product> pro;
            
            
                pro=pr.getProducts();
            
            int i=1;
            
                    
  
  %>
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
              <a class="nav-link " href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="admincustomer.jsp">Users</a>
            </li>
           
            <li class="nav-item">
              <a class="nav-link active" href="adminproduct.jsp">Products</a>
            </li>
          </ul>
        </div>
      </div>
        <ul class="navbar-nav mr-light">
				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile_modal"><span
						class="fa fa-user-circle"></span>Welcome Admin <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="logout"><span class="fa fa-user-plus"></span>Log
						out <span class="sr-only">(current)</span></a></li>

			</ul>
    </nav>
    </div>
  </header>
         
         
         <div class="cont">
  <div class="row">
    <div class="col-12">
        <h3 style="text-align: center">Products</h3>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">Name</th>
            <th scope="col">Brand</th>
            <th scope="col">Weight</th>
            
            <th scope="col">Description</th>
            <th scope="col">Sold status</th><!-- <th scope="col">Price</th> -->
            
            
          </tr>
        </thead>
        <tbody>
            
            <%
                for(Product p: pro)
	{
            %>
          <tr>
            <th scope="row"><%= i %></th>
            <td><%= p.getName() %></td>
            <td><%= p.getBrand() %></td>
            <td><%= p.getWeight()%></td>
            <td><%= p.getDescription()%></td>
            <td><%= p.getSoldStatus()%></td>
            <td>
                <button type="button" name="delete" value="Delete" onclick="deleteData(<%= p.getPid()%>);" class="btn btn-danger"><i class="far fa-trash-alt"></i>Delete</button>
            
             
            </td>
          </tr>
          <%  
             i++; 
              } 

          %>
          
        </tbody>
      </table>
    </div>
  </div>
</div>

      <script>
              function deleteData(id){
                  window.location.href="DeleteServlet4?id="+id;
              }
              
              
          </script>    
         
  
         
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

