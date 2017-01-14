<%//This program to add Cars to Database %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cars</title>
</head>
<body>
<h3>Car Details</h3>
<!-- Connection to Database-->
<% 
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
String query1="Select car_type from project2.Car_types";
//Create Statement
Statement stmt =conn.createStatement();
ResultSet rs=stmt.executeQuery(query1);
%>
<form action ='AddCars.jsp' method ='post'>
	Vehicle ID:<input type='text' name='vehicleId'/>
	Year   :<input type ='text' name ='Year'/><br></br>
	Model  :<input type ='text' name='Model'/><br></br>
CarType:<Select name='CAR_TYPE'>
<%
while(rs.next())
{ %>
<option><%=rs.getString("CAR_TYPE")%> </option>

<%} %>
</Select>
<input type ='submit' value = 'AddCar'/>
</form>
</body>
</html>