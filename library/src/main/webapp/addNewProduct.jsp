<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
   int id=1;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(id) from book");
while(rs.next())
{
	id=rs.getInt(1);
    id=id+1;	
}
}
catch(Exception e)
{
	
}
%>
<form action="addNewProductAction.jsp">
<h3 style="color: yellow;">Book ID:<%out.println(id);%></h3>
<input type="hidden" name="id" value="<%out.println(id);%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter name" required>
 <hr>
</div>

<div class="right-div">
<h3>Enter Author</h3>
 <input class="input-style" type="text" name="author" placeholder="Enter Author" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required>
<hr>
</div>

<div class="right-div">
<h3>Available</h3>
   <input class="input-style" type="text" name="available" placeholder="yes/no" required>
<hr>
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
 <i class='far fa-arrow-alt-circle-right'></i>
 </form>

</body>
<br><br><br>
</body>
</html>