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
<title>Add Daily Rental Page</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>

</head>
<body>
<%
try{
		//Establishing DB connection
		Connection conn=null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/project2";
		conn = DriverManager.getConnection(url,"root","root");
		//Query for Cars 	
		String carQuery = "SELECT * FROM project2.CARS";
		Statement st = conn.createStatement();
		ResultSet carsSet=st.executeQuery(carQuery);
%>		
		<form action='RentalsOnAvailability.jsp' method='post'>
		<table>
		
		<tr><td>Car:</td><td><select name='vehicleId'>
<%
		while(carsSet.next())
		{
			String vehicleId = carsSet.getString("VEHICLE_ID");
			%>
			<option value='<=%vehicelId%>'><=%vehicelId%></option>
		<%}%>
		</select>
		<tr><td>Start Date(dd-mm-yyyy):</td><td><input type='text' name='startDate'/></td></tr>
			
			<tr><td><input type='reset' value='clear'/></td><td><input type='submit' value='Search Rental'/></td></tr>			
			</table>
			</form>
	
<%}	
catch(Exception e)
{
System.out.println(e);
}
%>