
<%@page import="com.pkg.entities.Customer"%>
<%@page import="com.pkg.entities.Company"%>
<%
    String username="<a class='nav-link' href='login.jsp'>Login</a>";
    String signup="<li class='nav-item'>"+
             " <a class='nav-link' href='signup.jsp'>SignUp</a>"+
            "</li>";
    if(session.getAttribute("usertype")!=null){
        if(session.getAttribute("usertype").equals("company")){
        Company c=(Company)session.getAttribute("user");
            if(c!=null){
                
                signup="";
                
                username="<li class='nav-item dropdown'>"+
        "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
          "'"+c.getFirstName()+"'"+
        "</a>"+
        "<div class='dropdown-menu' id='dpm' aria-labelledby='navbarDropdown'>"+
          "<a class='dropdown-item' href='showProfile.jsp'>Your Profile</a>"+
          "<a class='dropdown-item' href='recievedproducts.jsp'>Recieved Products</a>"+
          "<a class='dropdown-item' href='remainingcollections.jsp'>Remaining Collections</a>"+
          "<div class='dropdown-divider'></div>"+
          "<a class='dropdown-item' href='logout'>Logout</a>"+
        "</div>"+
      "</li>";
            }
        }else{
            if(session.getAttribute("usertype").equals("customer")){
            Customer c=(Customer)session.getAttribute("user");
            if(c!=null){
                username="<li class='nav-item dropdown'>"+
        "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
          "'"+c.getFirstName()+"'"+
        "</a>"+
        "<div class='dropdown-menu' id='dpm' aria-labelledby='navbarDropdown'>"+
          "<a class='dropdown-item' href='showProfile.jsp'>Your Profile</a>"+
          "<a class='dropdown-item' href='yourposts.jsp'>Your Posts</a>"+
          "<div class='dropdown-divider'></div>"+
          "<a class='dropdown-item' href='logout'>Logout</a>"+
        "</div>"+
      "</li>";
             //code for display post on header
             signup="<li class='nav-item'>"+
             " <a class='nav-link' href='postproduct.jsp'>Post E-waste</a>"+
            "</li>";
            }
            }
        }
    }
%>
<header>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky" data-offset="500">
      <div class="container">
        
        <a href="#" class="navbar-brand"><img src="images/logo.svg" alt="logo" style="width: 20%; margin-right: 20px;">E-<span class="text-primary">Waste</span></a>

        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarContent">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home</a>
            </li>
              <%=username%>
              <%=signup%>
            <li class="nav-item">
              <a class="nav-link" href="aboutus.jsp">AboutUs</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
            <script>
                document.getElementById("navbarDropdown").onclick=()=>{
    let display = document.getElementById("dpm").style.display;
    console.log(display);
    if (display  !== "block") document.getElementById("dpm").style.display ="block";
    else document.getElementById("dpm").style.display ="none";

    
};
            </script>
    </div >
    
  </header>