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
String vehicleId=request.getParameter("VehicleId");
String customerId=request.getParameter("customerId");
String stdate=request.getParameter("startdate");
String noOfDays=request.getParameter("noOfDays");
System.out.println(vehicleId);
System.out.println(customerId);
System.out.println(stdate);
System.out.println(noOfDays);


try{

String url = "jdbc:mysql://localhost:3306/project2";
Connection conn = DriverManager.getConnection(url,"root","root");
PreparedStatement ps=conn.prepareStatement("INSERT INTO PROJECT2.DAILY_RENTALS VALUES "+"("+customerId+",'"+vehicleId+"',"+"str_to_date('"+stdate+"',('%m/%d/%Y'))"+","+noOfDays+","+"str_to_date('"+stdate+"',('%m/%d/%Y'))"+"+"+noOfDays+", "+noOfDays+"*(SELECT CT.DAILY_RATE FROM CAR_TYPES CT, CARS C WHERE CT.CAR_TYPE = C.CAR_TYPE and C.VEHICLE_ID='"+vehicleId+"'))");

int i=ps.executeUpdate();
if(i>0)%>
<p>Daily rent is successfully inserted</p>
<%
//need to write code for updating availability flag	
}catch (Exception e2) {System.out.println(e2);}

%>
</body>
</html>