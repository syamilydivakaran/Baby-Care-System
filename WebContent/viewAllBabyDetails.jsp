<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Baby Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			String sql = "SELECT baby_name, baby_gender, baby_birthday, baby_allergies, baby_blood FROM baby_details";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
	%>

	<h2>All Baby Details</h2>
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Gender</th>
			<th>Birthday</th>
			<th>Allergies</th>
			<th>Blood Group</th>
		</tr>
		<%
			while (rs.next()) {
					String name = rs.getString("baby_name");
					String gender = rs.getString("baby_gender");
					Date birthday = rs.getDate("baby_birthday");
					String allergies = rs.getString("baby_allergies");
					String bloodGroup = rs.getString("baby_blood");
		%>
		<tr>
			<td><%=name%></td>
			<td><%=gender%></td>
			<td><%=birthday%></td>
			<td><%=allergies%></td>
			<td><%=bloodGroup%></td>
		</tr>
		<%
			}
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("<p>Database error: " + e.getMessage() + "</p>");
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ignore) {
					}
				if (stmt != null)
					try {
						stmt.close();
					} catch (SQLException ignore) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ignore) {
					}
			}
		%>
	</table>

</body>
</html>
