<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CustomerDetails</title>
</head>
<body>
<h3>Customer Details</h3>
<%
//Retrieve the data from form
Connection conn=null;
String Name=request.getParameter("Name"); 
String Phone=request.getParameter("Phone");

try{

Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
if(conn!=null)
{
System.out.println("driver found and connected to database");
}

PreparedStatement ps=conn.prepareStatement("INSERT INTO PROJECT2.CUSTOMERS (NAME,PHONE) VALUES (?,?)");
ps.setString(1,Name);
ps.setString(2,Phone);
int i =ps.executeUpdate();
if(i>0)%>
<p>Customer with name: <%=Name %> and  phone: <%=Phone %> is successfully inserted</p>
<% }
catch(Exception e2){System.out.println(e2);}
%>
</body>