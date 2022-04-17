<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
 try
 {
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users (fname varchar(50),mname varchar(50),lname varchar(50),email varchar(100) primary key,mobilenumber bigint, gender varchar(100),psw varchar(100))";
    String q2="create table book(id int,name varchar(500),author varchar(100),category varchar(500),Available varchar(10))";
    String q3="create table cart(email varchar(100),book_id int,mobilenumber bigint,issuedate varchar(100),returndate varchar(100))";
    String q4="create table issuebook(sn int,email varchar(100),fullname varchar(200),book_id int,issuedate varchar(100),returndate varchar(100))";
    String q5="create table returnbook(sn int,email varchar(100),fullname varchar(200),book_id int,issuedate varchar(100),returndate varchar(100),userreturndate varchar(100),fine int)";
   // String q5="create table mybook(sn int,email varchar(100),fullname varchar(200),book_id int,issuedate varchar(100),returndate varchar(100))";
    System.out.print(q1);
	System.out.print(q2);
	System.out.print(q3);
	System.out.print(q4);
	System.out.print(q5);
    //st.execute(q1);
    //st.execute(q2);
   // st.execute(q3);
    //st.execute(q4);
    st.execute(q5);
    System.out.print("Table created");
    con.close();
 }
 catch(Exception e)
 {
	 System.out.print(e);
 }
 %>