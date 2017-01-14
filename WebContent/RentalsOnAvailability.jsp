<%//This page displays the rentals on availability %>

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
<title>Rental Availability Page</title>
</head>

<body>
<h1>Available daily/weekly Rent details</h1>
<%

String vehicleId=request.getParameter("vehicleId");
String date=request.getParameter("startdate");
int dailyAvailability = 0;
int weeklyAvailability = 0;
System.out.println(vehicleId);
System.out.println(date);

Connection conn=null;
try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");

			
		     //String query = "SELECT * FROM CAR_AVAILABILITY WHERE VEHICLE_ID='"+vehicleId+"' AND START_DATE = STR_TO_DATE('"+date+"','%m/%d%Y')";
			
				String query = "SELECT * FROM CAR_AVAILABILITY WHERE VEHICLE_ID='"+vehicleId+"' AND START_DATE = STR_TO_DATE('"+date+"','%m/%d/%Y')";
			System.out.println(query);
		     Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			if (!rs.next()) {
				%>There is no availability for selected date. Go back to select another date <a href="RentalsAvailabilitySearch.jsp">back</a>
			<%} else {%>
			<table border="1">
			<tr><th>VehicleId</th><th>daily availability</th><th>weekly availability</th>
			<%
				do {
							dailyAvailability = rs.getInt("DAILY_AVAILABILITY");
							weeklyAvailability = rs.getInt("WEEKLY_AVAILABILITY");
						} while (rs.next());
					}
			%>
			<tr>
			<tr>
			<th></th>
			<th>New Customer</th>
			<th>Old Customer</th>
			<th>New Customer</th>
			<th>Old Customer</th>
			<tr>
			<td><%=vehicleId%></td>
				<td><form action='DailyRental.jsp' name="newdaily" method='post'>
				<input type="hidden" name="vehicleId" value="<%=vehicleId%>" />
				<input type="hidden" name="dailyAvailability"
						value="<%=dailyAvailability%>" />
				<input type="hidden" name="startdate" value="<%=date%>" />
				<input type="submit" value="Book Daily"
						<%if (dailyAvailability == 0) {%> disabled="disabled" <%}%> />
				</form></td><td>
				<form action='DailyRentals.jsp' name="olddaily" method='post'>
				<input type="hidden" name="vehicleId" value="<%=vehicleId%>" />
				<input type="hidden" name="dailyAvailability"
						value="<%=dailyAvailability%>" />
				<input type="hidden" name="startdate" value="<%=date%>" />
				<input type="submit" value="Book Daily"
						<%if (dailyAvailability == 0) {%> disabled="disabled" <%}%> />
				</form></td>
				<td><form action='WeeklyRental.jsp' name="newweekly" method='post'>
				<input type="hidden" name="vehicleId" value="<%=vehicleId%>" />
				<input type="hidden" name="weeklyAvailability"
						value="<%=weeklyAvailability%>" />
				<input type="hidden" name="startdate" value="<%=date%>" />
				<input type="submit" value="Book Weekly"
						<%if (weeklyAvailability == 0) {%> disabled="disabled" <%}%> />
				</form></td><td>
				<form action='WeeklyRentals.jsp' name="oldweekly" method='post'>
				<input type="hidden" name="vehicleId" value="<%=vehicleId%>" />
				<input type="hidden" name="weeklyAvailability"
						value="<%=weeklyAvailability%>" />
				<input type="hidden" name="startdate" value="<%=date%>" />
				<input type="submit" value="Book Weekly"
						<%if (weeklyAvailability == 0) {%> disabled="disabled" <%}%> />
				</form></td>
		</tr>
				</table>
			
			
		<%}
		catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		
		%>
		</body>
</html>