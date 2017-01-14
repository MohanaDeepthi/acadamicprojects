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
<title>Add Daily Rentals Saving page</title>
</head>
<body>
<%
String vehicleId=request.getParameter("vehicleId");
String customerId=request.getParameter("customerId");
String date=request.getParameter("startdate");
String noOfDays=request.getParameter("noOfDays");

try{
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/project2";
	Connection conn = DriverManager.getConnection(url,"root","root");
	PreparedStatement ps=conn.prepareStatement("INSERT INTO PROJECT2.DAILY_RENTALS (IDNO,VEHICLE_ID,START_DATE,NO_OF_DAYS,RETURN_DATE,AMOUNT_DUE) VALUES "+
	"("+customerId+",'"+vehicleId+"',STR_TO_DATE('"+date+"','%m/%d/%Y'),"+noOfDays+",(STR_TO_DATE('"+date+"','%m/%d/%Y'))+"+noOfDays+", "+noOfDays+"*(SELECT CT.DAILY_RATE FROM CAR_TYPES CT, CARS C WHERE CT.CAR_TYPE = C.CAR_TYPE and C.VEHICLE_ID='"+vehicleId+"'))");


	int i=ps.executeUpdate();
	if(i>0)%>
	<p>Daily rent is successfully inserted</p>

	<%
	PreparedStatement ps2 = conn.prepareStatement("UPDATE PROJECT2.CAR_AVAILABILITY SET DAILY_AVAILABILITY=(DAILY_AVAILABILITY-1) WHERE VEHICLE_ID = '"+vehicleId+"' AND START_DATE=STR_TO_DATE('"+date+"','%m/%d%Y')");


	i=ps2.executeUpdate();
	if(i>0)%>
	<p>Rental availability is successfully inserted</p>
	
	<%}catch (Exception e2) {System.out.println(e2);}

%>
</body>
</html>