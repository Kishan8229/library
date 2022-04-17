<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
label {
    padding-right: 10px;}
button { 
       background-color: orange; 
       width: 30%;
        color: sky blue; 
        padding: 10px; 
        margin: 5px 0px; 
        border: none; 
        cursor: pointer; 
         } 
input { 
        width: 30%; 
        margin: 20px 20px;
        padding: 12px 20px; 
        display: inline-block; 
        border: 1px solid sky blue; 
        box-sizing: border-box; 
        display: table-cell;
    }
</style>
</head>
<body>

<h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <form action="signupAction.jsp" method="post">
    <hr>
     

   

   

   
    
      <label for="fname"><b>First name</b></label>
  <input type="text" name="fname" placeholder="First name" id="fname" required>
  <br>
   <label for="mname"><b>Middle name</b></label>
  <input type="text" id="lname" name="mname" placeholder="Middle name">
  <br>
  <label for="lname"><b>Last name</b></label>
  <input type="text" id="lname" name="lname" placeholder="Last name" required>
  <br>
   <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>
    <br>
    <label for="mobilenumber"><b>Mobile number</b></label>
  <input type="number" id="mobilenumber" name="mobilenumber" placeholder="Enter your mobile no" required><br>
  <label for="gender"><b> Select you gender</b></label>
<select name="gender">
	<option value="none" selected>Gender</option>
	<option value="male">Male</option>
	<option value="female">Female</option>
	<option value="other">other</option>
</select>
<br>
<br>
 <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
    <br>

      <button type="submit" class="registerbtn">Register</button>
   
 </form>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>successfully Registered</h1><%} %>
<%
if("invalid".equals(msg))
{
%>
<h1>something went wrong! Try again</h1><%} %>
</body>
</html>