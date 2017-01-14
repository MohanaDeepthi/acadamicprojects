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
<title>Add Weekly Rental Page from search</title>
</head>
<body>
<h1>Enter Weekly Rent details</h1>
<%

String vehicleId=request.getParameter("vehicleId");
String date=request.getParameter("startdate");

%>
			
			<form action='AddCompleteRental.jsp' method='post'>
			<table>
			
			
			<tr><td>Customer Name:</td><td><input type='text' name='name'/></td></tr>
			<tr><td>Customer Phone:</td><td><input type='text' name='phone'/></td></tr>
			<tr><td>Number Of Weeks:</td><td><input type='text' name='noOfWeeks'/></td></tr>
			<tr><td>StartDate : <input type="text" name="startdate" value="<%=date%>" disabled="disabled"/></td></tr>
			<tr><td><input type='reset' value='clear'/></td><td><input type='submit' value='Add Rental'/></td></tr>			
			</table>
			<input type="hidden" name="rentalType" value="weekly"/>
			<input type="hidden" name="vehicleId" value="<%=vehicleId %>"/>
			<input type="hidden" name="startdate" value="<%=date%>"/>
			</form>

</body>
</html>