<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String author=request.getParameter("author");
String category=request.getParameter("category");
String available=request.getParameter("available");
try
{
Connection con=ConnectionProvider.getCon();
PreparedStatement ps=con.prepareStatement("insert into book values(?,?,?,?,?)");
ps.setString(1, id);
ps.setString(2, name);
ps.setString(3, author);
ps.setString(4, category);
ps.setString(5, available);
ps.executeUpdate();
response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>