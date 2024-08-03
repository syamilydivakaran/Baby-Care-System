<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Baby Details</title>
    <link href="css/styleThree.css" rel="stylesheet" type="text/css" />
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

            if (rs.next()) {
                String name = rs.getString("baby_name");
                String gender = rs.getString("baby_gender");
                Date birthday = rs.getDate("baby_birthday");
                String allergies = rs.getString("baby_allergies");
                String bloodGroup = rs.getString("baby_blood");
    %>
    <form action="vaccinationSchedule.jsp" method="post">
    <h2>BASIC DETAILS</h2>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= name %>" readonly><br><br>
    
    <label for="gender">Gender:</label>
    <input type="text" id="gender" name="gender" value="<%= gender %>" readonly><br><br>

    <label for="birthday">Birthday:</label>
    <input type="text" id="birthday" name="birthday" value="<%= birthday %>" readonly><br><br>

    <label for="allergies">Allergies:</label>
    <input type="text" id="allergies" name="allergies" value="<%= allergies %>" readonly><br><br>
    
    <label for="bloodGroup">Blood Group:</label>
    <input type="text" id="bloodGroup" name="bloodGroup" value="<%= bloodGroup %>" readonly><br><br>
    
    <input type="hidden" name="birthday" value="<%= birthday %>">
    
    <!-- Add an age selection field -->
    <label for="age">Select Age:</label>
    <select id="age" name="age">
        <option value="BIRTH">BIRTH</option>
        <option value="6 WEEKS">6 WEEKS</option>
        <option value="10 WEEKS">10 WEEKS</option>
        <option value="14 WEEKS">14 WEEKS</option>
        <option value="6 MONTHS">6 MONTHS</option>
        <option value="9 MONTHS">9 MONTHS</option>
        <option value="12 MONTHS">12 MONTHS</option>
        <option value="15 MONTHS">15 MONTHS</option>
        <option value="16-18 MONTHS">16-18 MONTHS</option>
        <option value="4-6 YEARS">4-6 YEARS</option>
        <option value="9-14 YEARS">9-14 YEARS</option>
        <option value="15-18 YEARS">15-18 YEARS</option>
    </select>
    <br><br>
    <input type="submit" value="BACK" formaction="selectBabyDetails.jsp">
</form>

    <%
            } else {
                out.println("<p>No baby details found.</p>");
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
</body>
</html>
