<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Current rented details page</title>
</head>
<body>
<h1>Rented details to return</h1>
<%
int noOfDays=0;
int noOfWeeks=0;
try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/project2";
			Connection conn = DriverManager.getConnection(url,"root","root");
			String dailyQuery = "SELECT * FROM DAILY_RENTALS WHERE curdate() between START_DATE and RETURN_DATE";
			//String weeklyQuery = "SELECT * FROM WEEKLY_RENTALS WHERE START_DATE >= curdate() OR RETURN_DATE <= curdate() ";
			String weeklyQuery = "SELECT * FROM WEEKLY_RENTALS WHERE curdate() between START_DATE and RETURN_DATE";
			Statement st = conn.createStatement();
			ResultSet dailyQueryRS = st.executeQuery(dailyQuery);
			%>
			<P> Daily Rentals</P>
			<table>
			
			<tr><th>VehicleId</th><th>Start Date</th><th>No of days</th><th>Selection</th>
			
			<%
			int i=0;
			while (dailyQueryRS.next())
			{
				String vehicleId = dailyQueryRS.getString("VEHICLE_ID");
				Date startDate = dailyQueryRS.getDate("START_DATE");
				noOfDays = dailyQueryRS.getInt("NO_OF_DAYS");
				int idno = dailyQueryRS.getInt("IDNO");
				%>
				<tr><td><input type="text" name="vehicleId" value="<%=vehicleId%>" disabled="disabled"/></td>
				<td><input type="text" name="startDate" value="<%=startDate%>" disabled="disabled"/></td>
				<td><input type="text" name="noOfDays" value="<%=noOfDays%>" disabled="disabled"/></td>
				<td><form action='DailyRentalReturn.jsp' name="daily<%=i %>" method='post'>
				<input type="hidden" name="vehicleId" value="<%=vehicleId%>"/>
				<input type="hidden" name="startDate" value="<%=startDate%>"/>
				<input type="hidden" name="noOfDays" value="<%=noOfDays%>"/>
				<input type="hidden" name="idno" value="<%=idno%>"/>
				<input type='submit' value='Return'/>
				</form>
				</td>
				</tr>
				<%i++;
			}
			%>
			
			</table>
			
			<%
			

			ResultSet weeklyQueryRS = st.executeQuery(weeklyQuery);
			%>
			<P> Weekly Rentals</P>
			<table>
			<tr><th>VehicleId</th><th>Start Date</th><th>No of weeks</th><th>Selection</th>
			<%
			int j=0;
			while (weeklyQueryRS.next())
			{
				String vehicleId = weeklyQueryRS.getString("VEHICLE_ID");
				Date startDate = weeklyQueryRS.getDate("START_DATE");
				noOfWeeks = weeklyQueryRS.getInt("NO_OF_WEEKS");
				int idno = weeklyQueryRS.getInt("IDNO");
				%>
				<tr><td><input type="text" name="vehicleId" value="<%=vehicleId%>" disabled="disabled"/></td>
				<td><input type="text" name="startDate" value="<%=startDate%>" disabled="disabled"/></td>
				<td><input type="text" name="noOfWeeks" value="<%=noOfDays%>" disabled="disabled"/></td>
				<td><form action='WeeklyRentalReturn.jsp' name="weekly<%=i %>" method='post'>
				<input type="hidden" name="vehicleId" value="<%=vehicleId%>"/>
				<input type="hidden" name="startDate" value="<%=startDate%>"/>
				<input type="hidden" name="noOfWeeks" value="<%=noOfWeeks%>"/>
				<input type="hidden" name="idno" value="<%=idno%>"/>
				<input type='submit' value='Return'/>
				</form>
				</td>
				</tr>
				<%j++;
				
		}%>
		</table>
		<%
		}catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		
		%>
</body>
</html>