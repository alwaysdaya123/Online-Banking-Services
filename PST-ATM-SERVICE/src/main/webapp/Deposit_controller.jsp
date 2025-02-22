<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"href="css/Style.css"/>
    <meta charset="UTF-8">
    <title>Deposit Amount</title>
</head>
<body>
<div class="header">
	PST-ATM-SERVICE
	</div>
	<div class="nav-bar">
		<ul>
			<li><a href ="home_navigation.html">Home </a></li>
			<li><a href ="CreateNewUser.html">CreatNewUser </a></li>
			<li><a href ="Account_find.html">DepositAmount </a></li>
			<li><a href ="Find_Account.html">WithDrawalAmount </a></li>
			<li><a href ="Balance_Enquiry.html">BalanceEnquiry </a></li>
			<li><a href ="Change_pho.html">ChangeMobileNumber</a></li>
	   </ul>
      </div>

<%
String UpdateAmount = "UPDATE pst_user SET amount = ? WHERE account_number = ?";

String accNum = request.getParameter("account_number");
long account_number = Long.parseLong(accNum);
String cA = request.getParameter("amount");
double amount = Double.parseDouble(cA);
String da = request.getParameter("deposit_amount");
double depositAmount = Double.parseDouble(da);
double totalAmount = amount + depositAmount;

try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pst_bank", "pst_bank");
    PreparedStatement ps = con.prepareStatement(UpdateAmount);
    ps.setDouble(1, totalAmount);
    ps.setLong(2, account_number);
    int i = ps.executeUpdate();
    if(i > 0) {
        out.println("<h1>Amount deposited successfully...</h1>");
    } else {
        out.println("<h1>Amount deposit failed, please try again...</h1>");
    }
    con.close();
} catch(Exception e) {
    e.printStackTrace();
}
%>
<div class="footer">
<marquee><center><h3>copy right www.dayasofttech.com @2024</h3></center></marquee>
</div>
</body>
</html>
