<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");

System.out.println(fname+" "+mname+" "+lname+" "+email);
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
st.executeUpdate("Delete from users where email='"+email+"'");

response.sendRedirect("canceluser.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("canceluser.jsp?msg=wrong");
}
%>