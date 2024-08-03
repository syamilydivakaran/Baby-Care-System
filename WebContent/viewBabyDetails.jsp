<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baby Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
    String babyName = request.getParameter("babyName");

    if (babyName != null && !babyName.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            String sql = "SELECT baby_name, baby_gender, baby_birthday, baby_allergies, baby_blood FROM baby_details WHERE baby_name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, babyName);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("baby_name");
                String gender = rs.getString("baby_gender");
                Date birthday = rs.getDate("baby_birthday");
                String allergies = rs.getString("baby_allergies");
                String bloodGroup = rs.getString("baby_blood");
%>
<h2>Baby Details</h2>
<p>Name: <%= name %></p>
<p>Gender: <%= gender %></p>
<p>Birthday: <%= birthday %></p>
<p>Allergies: <%= allergies %></p>
<p>Blood Group: <%= bloodGroup %></p>
<form action="vaccinationSchedule.jsp" method="post">
    <input type="hidden" name="name" value="<%= name %>">
    <input type="hidden" name="birthday" value="<%= birthday %>">
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
    <input type="submit" value="VACCINATION" action="vaccinationSchedule.jsp">
    &nbsp&nbsp&nbsp&nbsp
        
        <input type="submit" value="EDIT" formaction="editBabyDetails.jsp">
        &nbsp&nbsp&nbsp&nbsp
        
        <input type="submit" value="ADD" formaction="addBabyDetails.jsp">
        &nbsp&nbsp&nbsp&nbsp <input type="submit" value="BACK" formaction="babyHome.jsp"><br><br>
       
        
</form>
<%
            } else {
                out.println("<p>No details found for the selected baby.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Database error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    } else {
        out.println("<p>No baby name selected.</p>");
    }
%>

</body>
</html>
