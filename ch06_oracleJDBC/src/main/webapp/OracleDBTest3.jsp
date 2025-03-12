<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JDBC를 이용한 ORACLE 연동</h1>
	<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			st = con.createStatement();
			rs = st.executeQuery("select * from department");
	%>
	
	<table border="1">
		<tr>
			<th>DeptId</th>
			<th>DeptTitle</th>
			<th>LOCATION</th>
		</tr>
	<%
		while(rs.next()) {
			String deptId = rs.getString(1);
			String deptTitle = rs.getString(2);
			String location = rs.getString(3);
		
	%>
		<tr>
			<td><%=deptId %></td>
			<td><%=deptTitle %></td>
			<td><%=location %></td>
		</tr>
	<%} %>
	<% 
		} catch(Exception e) {
			
		} finally {
			if(st != null) {
				st.close();
			}
			if (rs!= null) {
				st.close();	
			}
			if(con != null) {
				con.close();
			}
		}
	%>
	</table>
	
	<p/>
	
	<%
	Connection con1 = null;
	Statement st1 = null;
	ResultSet rs1 = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			st1 = con1.createStatement();
			rs1 = st1.executeQuery("select * from LOCATION");
	%>
	
	<table border="1">
		<tr>
			<th>Local_Code</th>
			<th>National_Code</th>
			<th>Local_Name</th>
		</tr>
	<%
		while(rs1.next()) {
			String Local_Code = rs1.getString(1);
			String National_Code = rs1.getString(2);
			String Local_Name= rs1.getString(3);
	%>
		<tr>
			<td><%=Local_Code %></td>
			<td><%=National_Code %></td>
			<td><%=Local_Name %></td>
		</tr>
	<%} %>
	<% 
		} catch(Exception e) {
			
		} finally {
			if(st1 != null) {
				st1.close();
			}
			if (rs1!= null) {
				st1.close();	
			}
			if(con1 != null) {
				con1.close();
			}
		}
	%>
	</table>

</body>
</html>