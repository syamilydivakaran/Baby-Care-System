<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Baby Details Submitted</title>
</head>
<body>
    <h2>Baby Details Submitted</h2>
    <%
        // Get form data
        String baby_name = request.getParameter("baby_name");
        String baby_gender = request.getParameter("baby_gender");
        String baby_birthday = request.getParameter("baby_birthday");
        String baby_allergies = request.getParameter("baby_allergies");
        String baby_blood = request.getParameter("baby_blood");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Get database connection
            conn = getConnection();
            
            // SQL query to insert data into the babies table
            String sql = "INSERT INTO baby_details (baby_name, baby_gender, baby_birthday, baby_allergies, baby_blood) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, baby_name);
            pstmt.setString(2, baby_gender);
            pstmt.setDate(3, Date.valueOf(baby_birthday));
            pstmt.setString(4, baby_allergies);
            pstmt.setString(5, baby_blood);
            
            // Execute the query
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<p>Record inserted successfully!</p>");
            } else {
                out.println("<p>Error inserting record.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Database error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
    <p>Name: <%= baby_name %></p>
    <p>Gender: <%= baby_gender %></p>
    <p>Birthday: <%= baby_birthday %></p>
    <p>Allergies: <%= baby_allergies %></p>
    <p>Blood Group: <%= baby_blood %></p>
</body>
</html>
