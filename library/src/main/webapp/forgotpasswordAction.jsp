<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String newpsw=request.getParameter("newpsw");

int check=0;
try
{
 Connection con=ConnectionProvider.getCon();
 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery("select *from users where email='"+email+"' and mobilenumber='"+mobilenumber+"'");
 while(rs.next())
 {
	 check=1;
	 st.executeUpdate("update users set psw='"+newpsw+"'where email='"+email+"'");
	 response.sendRedirect("forgotpassword.jsp?msg=done");
 }
 if(check==0)
 {
	 response.sendRedirect("forgotpassword.jsp?msg=invalid");
 }
}
catch(Exception e)
{
System.out.println(e);

}
%>
