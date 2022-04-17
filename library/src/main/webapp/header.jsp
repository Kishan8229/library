<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString(); %>
           <h2>Library</h2>
            <h2><a href=""><%out.println(email); %><i class='fas fa-user-alt'></i></a></h2>
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="mybook.jsp">My Book  <i class='fab fa-elementor'></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
           
          </div>
           <br>
           <!--table-->
