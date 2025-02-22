<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance</title>
<link rel="stylesheet" href="css/Style.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: cornflowerblue; 
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background: #fff; /* White */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            margin-top: 40px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            border: 1px solid #ccc; /* Light Gray */
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="radio"] {
            width: auto;
            margin: 5px 10px 20px 0;
        }
        input[type="radio"] + label {
            margin-left: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049; /* Dark Green */
        }
    </style>
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
String BLANCE_ENQUIRY="select  user_name ,amount from pst_user where account_number=?";
String accNum = request.getParameter("account_number");
String user_name=request.getParameter("user_name");


String cA = request.getParameter("amount");




try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pst_bank","pst_bank");
	PreparedStatement ps=con.prepareStatement(BLANCE_ENQUIRY);
	ps.setString(1, accNum);
	ResultSet rs=ps.executeQuery();
	if(rs.next()) {
		user_name=rs.getString("user_name");
	cA=rs.getString("amount");
	}
	
	
}catch(Exception e){
	e.printStackTrace();
}
%>
<form >
    <h2>AvaliableBalance</h2>
    <table>
        <tr>
            <td><label for="account_number">Account Number:</label></td>
             <td><label><%=accNum %></label></td>
        </tr>
         <tr>
            <td><label for="user_name">User Name:</label></td>
            <td><label><%=user_name%></label></td>
        </tr>
         
        <tr>
            <td><label for="amount">AvaliableAmount:</label></td>
            <td><label><%=cA%></label></td>
        </tr>
        
        
    </table>
   
   
</form>

<div class="footer">
<marquee><center><h3>copy right www.dayasofttech.com @2024</h3></center></marquee>
</div>
</body>
</html>