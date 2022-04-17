<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String author=request.getParameter("author");
String category=request.getParameter("category");
String available=request.getParameter("available");
System.out.println(id+" "+name+" "+author+" "+category+" "+available);
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
st.executeUpdate("Update book set name='"+name+"',author='"+author+"', category='"+category+"',available='"+available+"' where id='"+id+"'");
if(available.equals("no"))
{
st.executeUpdate("delete from cart where book_id='"+id+"' and address is NULL");	
}
response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>