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
<title>Inserting Cars Data</title>
</head>
<body>
<!-- Connection to Database-->
<% 

String vehicle_id=request.getParameter("vehicleId");
String Car_type=request.getParameter("CAR_TYPE");
String model=request.getParameter("Model");
int year = Integer.parseInt(request.getParameter("Year"));
try{
//Establishing Database connection
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project2","root","root");
//Inserting Data in to Database
if(conn!=null)
{
PreparedStatement ps=conn.prepareStatement("INSERT INTO PROJECT2.CARS (VEHICLE_ID,CAR_TYPE,MODEL,YEAR) VALUES (?,?,?,?)");
ps.setString(1,vehicle_id);
ps.setString(2,Car_type);
ps.setString(3,model);
ps.setInt(4,year);
int i =ps.executeUpdate();
if(i>0) %>
<p>Car with id: <%=vehicle_id%> and  Car_type: <%=Car_type%> and <%=model%> and <%=year%> is successfully inserted</p>
<% }
%>
<% }catch(Exception e2){System.out.println(e2);}
%>

</body>
</html>