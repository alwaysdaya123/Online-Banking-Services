<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>

</head>
<body>


<%String INSERT_DATA="insert into pst_user values(?,?,?,?,?)"; %>

<%
String accNum = request.getParameter("account_number");
long account_number = Long.parseLong(accNum);
String user_name=request.getParameter("user_name");
String gender=request.getParameter("gender");
String pho=request.getParameter("mobile_number");
long mobile_number=Long.parseLong(pho);
String amt=request.getParameter("amount");
double amount=Double.parseDouble(amt);


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pst_bank","pst_bank");
	PreparedStatement ps=con.prepareStatement(INSERT_DATA);
	ps.setLong(1, account_number);
	ps.setString(2, user_name);
	ps.setString(3, gender);
	ps.setLong(4, mobile_number);
	ps.setDouble(5, amount);
	int i=ps.executeUpdate();%><div><%@include file="Home.html" %></div>
	
	<% if(i>0){
		out.println("<center><h1 style='color:black;'>User account Created Successfuly</h1></center>");
	}
	else{
		out.println("<center><h1 style='color:red;'>User account Created failed </h1></center>");
	}
	con.close();
	
}catch(Exception e){
	e.printStackTrace();
}
%>


<div class="footer">
<marquee><center><h3>copy right www.dayasofttech.com @2024</h3></center></marquee>
</div>
</body>
</html>