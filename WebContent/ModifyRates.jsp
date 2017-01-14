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
<title>Add Car Saving page</title>
</head>
<body>
<%

String carType=request.getParameter("carType");
String weeklyRate=request.getParameter("weeklyRate");
String dailyRate=request.getParameter("dailyRate");

try{
	Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
	PreparedStatement ps=conn.prepareStatement("UPDATE PROJECT2.CAR_TYPES SET DAILY_RATE=?, WEEKLY_RATE=? WHERE CAR_TYPE=?");
	ps.setString(1,dailyRate);
	ps.setString(2,weeklyRate);
	ps.setString(3,carType);

int i=ps.executeUpdate();
if(i>0)%>
<p>Car type rates successfully updated</p>
<%

	
}catch (Exception e2) {System.out.println(e2);}


%>
</body>
</html>