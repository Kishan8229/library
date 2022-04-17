<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
  session.invalidate();
  response.sendRedirect("Homepage.jsp");
%>