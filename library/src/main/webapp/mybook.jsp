<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%! String s="no"; %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>

h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">something went wrong! try again</h3>
<%} %>
<table>
<thead>
<%
int total=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select COUNT(*) from issuebook where email='"+email+"' and returnststus='"+s+"'");
    while(rs1.next())
    {
    
    	total=rs1.getInt(1);
    }
}
catch(Exception e){}
%>
<tr>
<th scope="col">Total issued book: <%out.println(total); %></th>
</tr>
</thead>
        <thead>
          <tr>
            <th scope="col">Book ID</th>
            <th scope="col">Email</th>
            <th scope="col">Borrow date</th>
            <th scope="col">Return date</th>
            <th scope="col">Return status</th>
          </tr>
        </thead>
        <tbody>
        <%
        int z=0;
        try
        {
        	Connection con=ConnectionProvider.getCon();
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select *from issuebook where email='"+email+"'");
        while(rs.next())
        {
        	z=z+1;
      %>        	
     

          <tr>
            <td><%=rs.getString(4) %></td>
             <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
          </tr>
<%
}
}
        catch(Exception e)
        {
        	System.out.println(e);
        }
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>