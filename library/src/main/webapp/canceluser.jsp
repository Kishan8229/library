<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="userslist.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<% 
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">User deleted!</h3>
<%} %>
<% 

if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<%

String email=request.getParameter("email");
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select *from users where email='"+email+"'");

 while(rs.next())
 {

%>
<form action="canceluserAction.jsp" method="post">
<div class="left-div">
<h3>First Name</h3>
  <input class="input-style" type="text" name="fname" value="<%=rs.getString(1) %>" required>
 
<hr>
</div>
<div class="right-div">
<h3>Middle Name</h3>
  <input class="input-style" type="text" name="mname" value="<%=rs.getString(2) %>" required>
 
<hr>
</div>
<div class="left-div">
<h3>Last Name</h3>
  <input class="input-style" type="text" name="lname" value="<%=rs.getString(3) %>" required>
 
<hr>
</div>
<div class="right-div">
<h3>User Email</h3>
  <input class="input-style" type="text" name="email" value="<%=rs.getString(4) %>" required>
 <br>
<hr>
</div>


<button class="button">Cancel Registration<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
<br><br><br>
</body>
</html>