<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="addNewProduct-style.css">
<title>issue book</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">book issued Successfully!</h3>
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
   int sn=1;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(sn) from issuebook");
while(rs.next())
{
	sn=rs.getInt(1);
    sn=sn+1;	
}
}
catch(Exception e)
{
	
}
%>
<form action="issuebookAction.jsp">
<h3 style="color: yellow;">Serial no:<%out.println(sn);%></h3>
<input type="hidden" name="sn" value="<%out.println(sn);%>">

<div class="left-div">
 <h3>Enter email</h3>
 <input class="input-style" type="text" name="email" placeholder="Enter email" required>
 <hr>
</div>
<div class="right-div">
 <h3>Enter name</h3>
 <input class="input-style" type="text" name="fullname" placeholder="Enter name" required>
 <hr>
</div>
<div class="left-div">
<h3>book-id</h3>
 <input class="input-style" type="number" name="book_id" placeholder="Enter id" required>
<hr>
</div>

<div class="right-div">
<h3>Enter issue date</h3>
 <input class="input-style" type="date" name="issuedate" placeholder="Enter issuedate" required>
<hr>
</div>

<div class="left-div">
<h3>Enter return date</h3>
 <input class="input-style" type="date" name="returndate" placeholder="Enter returndate" required>
<hr>
</div>

<div class="right-div">
 <h3>Return Status</h3>
 <input class="input-style" type="text" name="returnststus" value="no" required>
 <hr>
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
 <i class='far fa-arrow-alt-circle-right'></i>
 </form>

</body>
<br><br><br>
</body>
</html>