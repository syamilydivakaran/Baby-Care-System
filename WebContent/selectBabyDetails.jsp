<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Baby Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        conn = getConnection();
        String sql = "SELECT baby_name FROM baby_details";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
%>

<h2>Select Baby</h2>
<form action="viewBabyDetails.jsp" method="post">
    <label for="babyName">Baby Name:</label>
    <select id="babyName" name="babyName">
        <option value="">--Select--</option>
<%
        while (rs.next()) {
            String babyName = rs.getString("baby_name");
%>
        <option value="<%= babyName %>"><%= babyName %></option>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>Database error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
    </select>
    <br><br>
    <input type="submit" value="View Details">
            &nbsp&nbsp&nbsp&nbsp<input type="submit" value="Health diet" formaction="babyHealthDiet.jsp" />
                    &nbsp&nbsp&nbsp&nbsp <input type="submit" value="BACK" formaction="babyHome.jsp"><br><br>
</form>

</body>
</html>
