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
<title>Rental Availability search Page</title>
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
<h1>Enter details to search</h1>
<%
Connection conn=null;
try{
			Class.forName("com.mysql.jdbc.Driver");
			
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
			String carQuery = "SELECT * FROM CARS";

			Statement st = conn.createStatement();
			ResultSet carRs = st.executeQuery(carQuery);
			%>
			<form action='RentalsOnAvailability.jsp' method='post'>
			<table>
			
			<tr><td>Car:</td><td><select name='vehicleId'>
			<%
			
			while (carRs.next())
			{
				String vehicleId = carRs.getString("VEHICLE_ID");
				%>
				<option value='<%=vehicleId%>'><%=vehicleId%></option>
			<%}%>
			</select></td></tr>
			<tr><td>Start Date:</td><td><input id="datepicker" name="startdate" /></td></tr>
			
			<tr><td><input type='reset' value='clear'/></td><td><input type='submit' value='Search Rental'/></td></tr>			
			</table>
			</form>
		<%}
		catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		out.close();
		
		%>
</body>
</html>