<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Daily Rentals Saving page</title>
</head>
<body>
<%
String vehicleId=request.getParameter("vehicleId");
String noOfDays=request.getParameter("noOfDays");
String startDate=request.getParameter("Date");
String idno=request.getParameter("idno");
int dailyRate=0;
%>
<%=vehicleId %> 
<%
try{
	Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
	//getting rate details
	String query = "SELECT CT.DAILY_RATE FROM CAR_TYPES CT, CARS C WHERE CT.CAR_TYPE = C.CAR_TYPE and C.VEHICLE_ID='"+vehicleId+"'";

	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(query);

	while (rs.next())
	{
	System.out.println("Inside while loop");
	//dailyRate = Integer.parseInt(rs.getString("DAILY_RATE"));
	dailyRate=rs.getInt("DAILY_RATE");	
	System.out.println(dailyRate);
	}
	//Updating Amount Due
	int ammountDue = (Integer.parseInt(noOfDays))*dailyRate;
	PreparedStatement ps1 = conn.prepareStatement("UPDATE PROJECT2.DAILY_RENTALS SET AMOUNT_DUE ="+ammountDue+" WHERE VEHICLE_ID = '"+vehicleId+"' AND START_DATE=STR_TO_DATE('"+startDate+"','%m/%d%Y') AND IDNO="+idno);
	int i=ps1.executeUpdate();	
	if(i>0)%>
	Amount due updated in DB : <%=ammountDue %>
	<%

	PreparedStatement ps2=conn.prepareStatement("UPDATE PROJECT2.CAR_AVAILABILITY SET DAILY_AVAILABILITY=(DAILY_AVAILABILITY+1) WHERE VEHICLE_ID = '"+vehicleId+"' AND START_DATE=STR_TO_DATE('"+startDate+"','%m/%d%Y')");

	int j=ps2.executeUpdate();

	if(j>0)%>
	<p>Daily Rental availability is successfully updated</p>
	<%

	
	}catch (Exception e2) {System.out.println(e2);}


	%>
</body>
</html>