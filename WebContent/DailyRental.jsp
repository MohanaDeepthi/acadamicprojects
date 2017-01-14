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
<title>Add Daily Rental Page from search</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>


</head>
<body>
<h1>Enter Daily Rent details</h1>
<%

String vehicleId=request.getParameter("vehicleId");
String date=request.getParameter("startdate");
System.out.println("In Daily Rental Page");
System.out.println(date);
			%>
			
			<form action='AddCompleteRental.jsp' method='post'>
			<table>
			
			
			<tr><td>Customer Name:</td><td><input type='text' name='name'/></td></tr>
			<tr><td>Customer Phone:</td><td><input type='text' name='phone'/></td></tr>
			<tr><td>Number Of days:</td><td><input type='text' name='noOfDays'/></td></tr>
			<tr><td>StartDate : <input type="text" name="startdate" value="<%=date%>" disabled="disabled"/></td></tr>
			<tr><td><input type='reset' value='clear'/></td><td><input type='submit' value='Add Rental'/></td></tr>			
			</table>
			<input type="hidden" name="rentalType" value="daily"/>
			<input type="hidden" name="vehicleId" value="<%=vehicleId %>"/>
			<input type="hidden" name="startdate" value="<%=date%>"/>
			</form>

</body>
</html>