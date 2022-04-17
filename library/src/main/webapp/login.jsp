<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style> 
Body {
  font-family: Calibri, Helvetica, sans-serif;
  background-color: blue;
}
button { 
       background-color: #4CAF50; 
       width: 10%;
        color: orange; 
        padding: 15px; 
        margin: 10px 0px; 
        border: none; 
        cursor: pointer; 
         } 
 form { 
        border: 3px solid #f1f1f1; 
    } 
 input[type=text], input[type=password] { 
        width: 30%; 
        margin: 8px 0;
        padding: 12px 20px; 
        display: inline-block; 
        border: 2px solid green; 
        box-sizing: border-box; 
    }
 button:hover { 
        opacity: 0.7; 
    } 
 
      
   
 .container { 
        padding: 25px; 
        background-color: lightblue;
    } 
</style> 
</head>
<body>    
    <h1 > Member Login </h1> 
    <div align="right">
    <form action="loginAction.jsp" method="post">
        <div class="container"> 
            <label>Email : </label> 
            <input type="text" placeholder="Enter Email" name="email" required>
            <br>
            <label>Password : </label> 
            <input type="password" placeholder="Enter Password" name="psw" required><br>
            <button type="submit">Login</button>  
            <a href="forgotpassword.jsp"> Forgot password? </a> 
                   </div> 
            <%
            String msg=request.getParameter("msg");
            if("notexist".equals(msg))
            {
            	%>
            	<h1>incorrect username or password</h1>
            <% }%>
            <%if("invalid".equals(msg))
            	{%>
            	<h1>something went wrong! try again</h1>
            <%} %>
            
    </form>
    </div>     
</body>     
</html>