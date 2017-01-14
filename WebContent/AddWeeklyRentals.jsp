<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<html>
<head>
Weekly Rental Submission
</head>
<body>
<%
String vehicleId=request.getParameter("vehicleId");
String customerId=request.getParameter("customerId");
String startdate=request.getParameter("startdate");
String noOfWeeks=request.getParameter("noOfWeeks");
System.out.println(vehicleId);
System.out.println(customerId);
System.out.println(startdate);
System.out.println(noOfWeeks);
try
{
//Establish Db connection
	Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/project2";
	conn = DriverManager.getConnection(url,"root","root");
	//Insert Data to DB
	PreparedStatement ps=conn.prepareStatement("INSERT INTO PROJECT2.WEEKLY_RENTALS VALUES "+"("+customerId+",'"+vehicleId+"',"+"str_to_date('"+startdate+"',('%m/%d/%Y'))"+","+noOfWeeks+","+"str_to_date('"+startdate+"',('%m/%d/%Y'))"+"+"+noOfWeeks+", "+noOfWeeks+"*(SELECT CT.WEEKLY_RATE FROM CAR_TYPES CT, CARS C WHERE CT.CAR_TYPE = C.CAR_TYPE and C.VEHICLE_ID='"+vehicleId+"'))");

	int i=ps.executeUpdate();
	if(i>0)%>
	<p>Weekly rental details are updated successfully</p>
		
<%
	PreparedStatement ps2 = conn.prepareStatement("UPDATE PROJECT2.CAR_AVAILABILITY SET WEEKLY_AVAILABILITY=(WEEKLY_AVAILABILITY-1) WHERE VEHICLE_ID = '"+vehicleId+"' AND START_DATE=STR_TO_DATE('"+startdate+"','%m/%d%Y')");


	i=ps2.executeUpdate();
	if(i>0)%>
	<p>Rental availability is successfully updated</p>
	
	<%}catch (Exception e2) {System.out.println(e2);}

%>
</body>
</html>