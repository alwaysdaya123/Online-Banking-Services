<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WithDrawalAmount</title>
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
String accNum = request.getParameter("account_number");
long account_number = Long.parseLong(accNum);
String Account_Finder = "SELECT * FROM pst_user WHERE account_number=?";
String user_name = "";
String gender = "";
long mobile_number = 0;
double amount = 0;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "pst_bank", "pst_bank");
    PreparedStatement ps = con.prepareStatement(Account_Finder);
    ps.setLong(1, account_number); 
    ResultSet rs = ps.executeQuery();
    
    if(rs.next()){
        user_name = rs.getString(2);
        gender = rs.getString(3);
        mobile_number = rs.getLong(4);
        amount = rs.getDouble(5);
        
        con.close();
    }
} catch(Exception e){
    e.printStackTrace();
}
%>
<form action="withdrawal_controller.jsp" method="post">
    <h2>WithDrawalAmount</h2>
    <table>
        <tr>
            <td><label for="account_number">Account Number:</label></td>
            <td><input type="text" disabled="disabled" value="<%=account_number %>"/></td>
            <td><input type="hidden" name="account_number" value="<%=account_number %>"/></td>
        </tr>
        <tr>
            <td><label for="user_name">User Name:</label></td>
            <td><input type="text" disabled="disabled" value="<%=user_name %>"/></td>
            <td><input type="hidden" name="user_name" value="<%=user_name %>"/></td>
        </tr>
        <tr>
            <td><label>Gender:</label></td>
            <td><input type="text" disabled="disabled" value="<%=gender %>"></td>
              <td><input type="hidden" name="gender" value="<%=gender %>"/></td>
        </tr>
        <tr>
            <td><label for="mobile_number">Mobile Number:</label></td>
            <td><input type="text" disabled="disabled" value="<%=mobile_number %>"/></td>
            <td><input type="hidden" name="mobile_number" value="<%=mobile_number %>"/></td>
        </tr>
        <tr>
            <td><label for="amount">Amount:</label></td>
            <td><input type="text" disabled="disabled" value="<%=amount %>"/></td>
            <td><input type="hidden" name="amount" value="<%=amount %>"/></td>
        </tr>
        <tr>
            <td><label for="withdrawal_amount">WithDrawal Amount:</label></td>
            <td><input type="text" id="withdrawal_amount" name="withdrawal_amount"/></td>
        </tr>
    </table>
   
    <input type="submit" value="WithDrawal Amount">
</form>


</body>
</html>
