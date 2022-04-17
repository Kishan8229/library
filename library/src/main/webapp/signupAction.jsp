<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String gender=request.getParameter("gender");
String psw=request.getParameter("psw");
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
	ps.setString(1,fname);
	ps.setString(2,mname);
	ps.setString(3,lname);
	ps.setString(4,email);
	ps.setString(5,mobilenumber);
	ps.setString(6,gender);
	ps.setString(7,psw);
	ps.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}
%>