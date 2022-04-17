<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%! String s="yes"; %>
<%
String snum=request.getParameter("snum");
String email=request.getParameter("email");
String fullname=request.getParameter("fullname");
String book_id=request.getParameter("book_id");
String issuedate=request.getParameter("issuedate");
String returndate=request.getParameter("returndate");
String userreturndate=request.getParameter("userreturndate");
String fine=request.getParameter("fine");
//int total=0;
int z=0;
//int x=0;
//try
//{
		
		//Connection con=ConnectionProvider.getCon();
	//Statement st=con.createStatement();
		//ResultSet rs1=st.executeQuery("select COUNT(*)from issuebook where email='"+email+"'");

		//while(rs1.next())
		//{
		//	total=rs1.getInt(1);
		//	System.out.println(total);
		//}
		
		
//}
//catch(Exception e)
//{
	
//}
try
{
	
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select *from issuebook,book where email='"+email+"' and id='"+book_id+"'");

while(rs.next())
{
	z=1;
//	x=1;
Statement st1=con.createStatement();
st1.executeUpdate("Update book set available='"+s+"' where id='"+book_id+"'");
PreparedStatement ps=con.prepareStatement("insert into returnbook values(?,?,?,?,?,?,?,?)");
ps.setString(1, snum);
ps.setString(2, email);
ps.setString(3, fullname);
ps.setString(4, book_id);
ps.setString(5, issuedate);
ps.setString(6, returndate);
ps.setString(7, userreturndate);
ps.setString(8, fine);
ps.executeUpdate();
Statement st3=con.createStatement();
st3.executeUpdate("update issuebook set returnststus='"+s+"' where email='"+email+"' and book_id='"+book_id+"'");
response.sendRedirect("return.jsp?msg=done");
}
if(z==0)
	response.sendRedirect("return.jsp?msg=notexist");
}
catch(Exception e)
{
	response.sendRedirect("return.jsp?msg=wrong");
}

%>