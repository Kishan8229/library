<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>forgotpassword</title>
</head>
<body>
<form action="forgotpasswordAction.jsp"method="post">
<label>Email : </label> 
            <input type="text" placeholder="Enter Email" name="email" required>
            <br>
            <label for="mobilenumber">Mobile number</label>
            <input type="number" id="mobilenumber" name="mobilenumber" placeholder="Enter your mobile no" required><br>
            <label>Password : </label> 
            <input type="password" placeholder="Enter New Password" name="newpsw" required><br>
            <input type="submit" value="save">
</form>
<h2><a href="login.jsp">Login</a></h2>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h1>password changed successfully</h1>
<%} %>
<% 
if("invalid".equals(msg))
{
%>
<h1>Something went wrong! try again</h1>
<%} %>
</body>
</html>