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
<title>Add Rentals Saving page</title>
</head>

<body>
<%
String vehicleId=request.getParameter("vehicleId");
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String date=request.getParameter("startdate");
String noOfDays=request.getParameter("noOfDays");
String noOfWeeks=request.getParameter("noOfWeeks");
String rentalType=request.getParameter("rentalType");
int customerId=0;
System.out.println("in add complete rental");
System.out.println(vehicleId);
System.out.println(name);
System.out.println(phone);
System.out.println(date);

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
	PreparedStatement ps=conn.prepareStatement("INSERT INTO PROJECT2.CUSTOMERS (NAME,PHONE) VALUES (?,?)");
	ps.setString(1,name);
	ps.setString(2,phone);
	int i=ps.executeUpdate();

	String query = "SELECT IDNO FROM CUSTOMERS WHERE NAME='"+name+"' AND PHONE = '"+phone+"'";

	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(query);

	while (rs.next())
	{
	customerId = rs.getInt("IDNO");
	}
	PreparedStatement ps1 = null;
	if(rentalType.equalsIgnoreCase("daily")){
	ps1=conn.prepareStatement("INSERT INTO PROJECT2.DAILY_RENTALS (IDNO,VEHICLE_ID,START_DATE,NO_OF_DAYS,RETURN_DATE,AMOUNT_DUE) VALUES "+
			"("+customerId+",'"+vehicleId+"',STR_TO_DATE('"+date+"','%m/%d/%Y'),"+noOfDays+",(STR_TO_DATE('"+date+"','%m/%d/%Y'))+"+noOfDays+", "+noOfDays+"*(SELECT CT.DAILY_RATE FROM CAR_TYPES CT, CARS C WHERE CT.CAR_TYPE = C.CAR_TYPE and C.VEHICLE_ID='"+vehicleId+"'))");
	
}else{
	ps1=conn.prepareStatement("INSERT INTO PROJECT2.WEEKLY_RENTALS (IDNO,VEHICLE_ID,START_DATE,NO_OF_WEEKS,RETURN_DATE,AMOUNT_DUE) VALUES "
			+"("+customerId+",'"+vehicleId+"',STR_TO_DATE('"+date+"','%m/%d/%Y'),"+noOfWeeks+",(STR_TO_DATE('"+date+"','%m/%d/%Y'))+("+noOfWeeks+"*7), "+noOfWeeks+"*(SELECT CT.WEEKLY_RATE FROM CAR_TYPES CT, CARS C WHERE CT.CAR_TYPE = C.CAR_TYPE and C.VEHICLE_ID='"+vehicleId+"'))");

}
//i=ps.executeUpdate();
i=ps1.executeUpdate();
if(i>0)%>
<p>Rental is successfully inserted</p>
<%
PreparedStatement ps2 = null;
if(rentalType.equalsIgnoreCase("daily")){
	ps2=conn.prepareStatement("UPDATE PROJECT2.CAR_AVAILABILITY SET DAILY_AVAILABILITY=(DAILY_AVAILABILITY-1) WHERE VEHICLE_ID = '"+vehicleId+"' AND START_DATE=STR_TO_DATE('"+date+"','%m/%d/%Y')");
}else{
	ps2=conn.prepareStatement("UPDATE PROJECT2.CAR_AVAILABILITY SET WEEKLY_AVAILABILITY=(WEEKLY_AVAILABILITY-1) WHERE VEHICLE_ID = '"+vehicleId+"' AND START_DATE=STR_TO_DATE('"+date+"','%m/%d/%Y')");
}

i=ps2.executeUpdate();

if(i>0)%>
<p>Rental availability is successfully inserted</p>
	
<%}catch (Exception e2) {System.out.println(e2);}


%>
</body>
</html>