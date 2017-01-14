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
<title>Add Daily Rental Page</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  


</head>
<body>
<h1>Enter Daily Rent details</h1>
<%
String date=request.getParameter("startdate");
System.out.println(date);

try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
			
			String customerQuery = "SELECT * FROM CUSTOMERS";
			String carQuery = "SELECT * FROM CARS";

			Statement st = conn.createStatement();
			ResultSet customerQueryRs = st.executeQuery(customerQuery);
			
			%>
			<form action='AddDailyRentals.jsp' method='post'>
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
			<tr><td>Number Of days:</td><td><input type='text' name='noOfDays'/></td></tr>
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