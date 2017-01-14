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
<title>Add Car Page</title>
</head>
<body>
<h1>Enter Car details</h1>
<%

try{
			Connection conn=null;
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
			String query = "SELECT * FROM CAR_TYPES";

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			%>
			<form action='ModifyRates.jsp' method='post'>
			<table>
			
			<tr><td>Car Type:</td><td><select name='carType'>
			<%
			while (rs.next())
			{
				String car_type = rs.getString("CAR_TYPE");%>
				<option value='<%=car_type%>'><%=car_type%></option>
			<%}%>
			
			</select></td></tr>
			<tr><td>Daily rate:</td><td><input type='text' name='dailyRate'/></td></tr>
			<tr><td>Weekly rate:</td><td><input type='text' name='weeklyRate'/></td></tr>
			<!--<tr><td>Year:</td><td><input type='text' name='year'/></td></tr>  -->
			<tr><td><input type='reset' value='clear'/></td><td><input type='submit' value='Add Car'/></td></tr>			
			</table>
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