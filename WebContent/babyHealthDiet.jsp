<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baby Health Diet</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String babyName = request.getParameter("babyName");
    String selectedAge = request.getParameter("age");

    if (babyName != null && !babyName.isEmpty()) {
        try {
            conn = getConnection();
            String sql = "SELECT baby_name, baby_birthday FROM baby_details WHERE baby_name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, babyName);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("baby_name");
                java.sql.Date birthday = rs.getDate("baby_birthday");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String birthdayStr = sdf.format(birthday);

%>

<h2>Baby Health Diet Schedule</h2>
<p>Name: <%= name %></p>
<p>Birthday: <%= birthdayStr %></p>

<form action="babyHealthDiet.jsp" method="post">
    <input type="hidden" name="babyName" value="<%= name %>">
    <label for="age">Select Age:</label>
    <select id="age" name="age">
        <option value="">--select--</option>
        <option value="0-6 MONTHS" <%= "0-6 MONTHS".equals(selectedAge) ? "selected" : "" %>>0-6 MONTHS</option>
        <option value="6-12 MONTHS" <%= "6-12 MONTHS".equals(selectedAge) ? "selected" : "" %>>6-12 MONTHS</option>
        <option value="1-2 YEARS" <%= "1-2 YEARS".equals(selectedAge) ? "selected" : "" %>>1-2 YEARS</option>
        <option value="2-3 YEARS" <%= "2-3 YEARS".equals(selectedAge) ? "selected" : "" %>>2-3 YEARS</option>
        <option value="3-5 YEARS" <%= "3-5 YEARS".equals(selectedAge) ? "selected" : "" %>>3-5 YEARS</option>
        <option value="5+ YEARS" <%= "5+ YEARS".equals(selectedAge) ? "selected" : "" %>>5+ YEARS</option>
    </select>
    <br><br>
    <input type="submit" value="Generate Diet Schedule">
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

    // Display diet schedule if age is selected
    if (selectedAge != null && !selectedAge.isEmpty()) {
        String dietSchedule = "";

        switch (selectedAge) {
            case "0-6 MONTHS":
                dietSchedule = "Breast milk or formula milk.";
                break;
            case "6-12 MONTHS":
                dietSchedule = "Pureed fruits and vegetables, small amounts of cereal.";
                break;
            case "1-2 YEARS":
                dietSchedule = "Soft fruits, small pieces of cooked vegetables, small amounts of meat and fish.";
                break;
            case "2-3 YEARS":
                dietSchedule = "Chopped fruits and vegetables, small servings of grains, dairy, and protein.";
                break;
            case "3-5 YEARS":
                dietSchedule = "Balanced meals with fruits, vegetables, grains, protein, and dairy.";
                break;
            case "5+ YEARS":
                dietSchedule = "Family meals, including a variety of fruits, vegetables, grains, protein, and dairy.";
                break;
            default:
                dietSchedule = "No specific diet schedule available for the selected age.";
                break;
        }
%>

<h3>Diet Schedule for <%= selectedAge %></h3>
<p><%= dietSchedule %></p>

<%
    }
%>

</body>
</html>
