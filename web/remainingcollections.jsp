<%-- 
    Document   : recievedproducts.jsp
    Created on : Nov 8, 2021, 11:32:30 PM
    Author     : ragha
--%>

<%@page import="com.pkg.entities.Product"%>
<%@page import="com.pkg.dao.productDAO"%>
<%@page import="com.pkg.dao.remainingCollectionsDAO"%>
<%@page import="com.pkg.dao.customerDAO"%>
<%@page import="com.pkg.dao.companyDAO"%>
<%@page import="com.pkg.entities.remainingCollections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pkg.helper.connectionProvider"%>
<%@page import="com.pkg.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remaining Collections</title>
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
            if(u==null || !u.getUsertype().equals("company")){
            response.sendRedirect("login.jsp");
            }
            
   
        %>
        <div style="margin: 2%;padding: 4%;">
    <h2 style="text-align: center">Remaining Collections</h2>
    
        <table class="table ">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">View Profile</th>
      <th scope="col">Collected</th>
    </tr>
  </thead>
  <tbody>
      <%
         remainingCollectionsDAO bd=new remainingCollectionsDAO(connectionProvider.getConnection());
         ArrayList<remainingCollections> br=bd.getRemainingCollection(u.getEmail());
         System.out.println(br.toString()+" is arraylist");
         for(remainingCollections b:br){
             
             //getting customer details
            customerDAO cd=new customerDAO(connectionProvider.getConnection());
                Customer c=cd.getCustomer(b.getOwnerEmail());
            productDAO pd=new productDAO(connectionProvider.getConnection());
                Product p=pd.getproduct(b.getPid());
            System.out.println(c.toString());
     %>
    <tr>
      <tr>
      <td><%= p.getName() %></td>
      <td><a href="showcustomer.jsp?email=<%=c.getEmail() %>"><input type="submit" class="btn btn-primary" value="View Customer"></a></td>
      <td><a href="collected?pid=<%=b.getPid() %>&email=<%=b.getOwnerEmail() %>"><input type="submit" class="btn btn-primary" value="Collected"></a></tr>
    <% } //end of foreach loop %>
  </tbody>
</table>


</div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
