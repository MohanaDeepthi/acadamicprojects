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
<title>Add Weekly Rental Page</title>
</head>
<body>
<h1>Enter Weekly Rent details</h1>
<%
String date=request.getParameter("startdate");
try{
			//Establishing DB connection
			Connection conn=null;
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/project2";
			conn = DriverManager.getConnection(url,"root","root");
			
			//Querires for Customers and Cars
			String customerQuery = "SELECT * FROM CUSTOMERS";
			String carQuery = "SELECT * FROM CARS";

			Statement st = conn.createStatement();
			ResultSet customerQueryRs = st.executeQuery(customerQuery);
			
			%>
			<form action='AddWeeklyRentals.jsp' method='post'>
			<table>
			
			<tr><td>Customer:</td><td><select name='customerId'>
			<%
			while (customerQueryRs.next())
			{
				String idNo = customerQueryRs.getString("IDNO");
				String name = customerQueryRs.getString("NAME");%>
				<option value='<%=idNo%>'><%=name%></option>
			<%}%>
			</select></td></tr>
			<tr><td>Car:</td><td><select name='vehicleId'>
			<%
			ResultSet carRs = st.executeQuery(carQuery);
			while (carRs.next())
			{
				String vehicleId = carRs.getString("VEHICLE_ID");
				%>
				<option value='<%=vehicleId%>'><%=vehicleId%></option>
			<%}%>
			</select></td></tr>
			<tr><td>Start Date(dd-MM-yyyy) selected:</td><td><input type='text' name='startdate' value="<%=date%>" disabled="disabled"/></td></tr>
			<tr><td>Number Of weeks:</td><td><input type='text' name='noOfWeeks'/></td></tr>
			<tr><td><input type='reset' value='clear'/></td><td><input type='submit' value='Add Rental'/></td></tr>			
			</table>
			<input type="hidden" name="startdate" value="<%=date%>" />
			</form>
		<%}
		catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		
		%>
</body>
</html>