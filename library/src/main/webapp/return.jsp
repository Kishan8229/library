<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="addNewProduct-style.css">
<title>Return book</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">book return Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%

if("notexist".equals(msg))
{
%>
<h3 class="alert">Invalid user!</h3>
<%} %>
<%
if("invalidid".equals(msg))
{
%>
<h3 class="alert">Invalid user!</h3>
<%} %>
<%
if("max".equals(msg))
{
%>
<h3 class="alert">User has borrowed maximum book</h3>
<%} %>
<%
int snum=1;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(sn) from returnbook");
while(rs.next())
{
	snum=rs.getInt(1);
   snum=snum+1;	
}
}
catch(Exception e)
{
	
}
%>


 <h2><a class="back" href="mybook.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>


<form action="returnAction.jsp" method="post">
<h3 style="color: yellow;">Serial no:<%out.println(snum);%></h3>
<input type="hidden" name="snum" value="<%out.println(snum);%>">
<div class="center">
 <h3>User Email</h3>
 <input class="input-style" type="text" name="email" required>
 <hr>
 </div>

<div class="left-div">
<h3>User name</h3>>
  <input class="input-style" type="text" name="fullname"required>
 
<hr>
</div>
<div class="right-div">
 <h3>Book id</h3>
 <input class="input-style" type="number" name="book_id" required>
 <hr>
</div>
<div class="left-div">
<h3>Issue Date</h3>
  <input class="input-style" type="date" name="issuedate" required>
 
<hr>
</div>

<div class="right-div">
<h3>Book Return Date</h3>
  <input class="input-style" type="date" name="returndate" required>
 
<hr>
</div>
<div class="left-div">
<h3>User Return Date</h3>
  <input class="input-style" type="date" name="userreturndate" required>
 
<hr>
</div>
<div class="right-div">
 <h3>Fine</h3>
 <input class="input-style" type="number" name="fine" required>
 <hr>
</div>
<button class="button">Return<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>