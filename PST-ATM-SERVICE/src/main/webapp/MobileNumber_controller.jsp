<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Mobile Number</title>
    <link rel="stylesheet" href="css/Style.css"/>
</head>
<body>
<div class="header">
    PST-ATM-SERVICE
</div>
<div class="nav-bar">
    <ul>
        <li><a href ="home_navigation.html">Home </a></li>
        <li><a href ="CreateNewUser.html">Create New User </a></li>
        <li><a href ="Account_find.html">Deposit Amount </a></li>
        <li><a href ="Find_Account.html">Withdrawal Amount </a></li>
        <li><a href ="Balance_Enquiry.html">BalanceEnquiry </a></li>
        <li><a href ="Change_pho.html">Change Mobile Number</a></li>
    </ul>
</div>

<%
String Change_MobileNumber = "UPDATE pst_user SET mobile_number = ? WHERE account_number = ?";
String accNum = request.getParameter("account_number");
long account_number=Long.parseLong(accNum);
String newMobileNumber = request.getParameter("mobile_number");
long mobile=Long.parseLong(newMobileNumber);
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pst_bank", "pst_bank");
    PreparedStatement ps = con.prepareStatement(Change_MobileNumber);
    ps.setLong(1, mobile);
    ps.setLong(2, account_number);
    int i= ps.executeUpdate();
    if (i >0) {
        out.println("<h1>Mobile Number updated successfully.</h1>");
    } else {
        out.println("<h1>Failed to update Mobile Number. Please try again.</h1>");
    }
    con.close();
} catch (Exception e) {
   e.printStackTrace();
}
%>

<div class="footer">
    <marquee><center><h3>Copyright www.dayasofttech.com @2024</h3></center></marquee>
</div>
</body>
</html>
