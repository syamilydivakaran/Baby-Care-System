<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Baby Details</title>
    <link href="css/styleThree.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <%
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String allergies = request.getParameter("allergies");
        String bloodGroup = request.getParameter("bloodGroup");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "UPDATE baby_details SET baby_name = ?, baby_gender = ?, baby_birthday = ?, baby_allergies = ?, baby_blood = ? WHERE baby_name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setDate(3, Date.valueOf(birthday));
            pstmt.setString(4, allergies);
            pstmt.setString(5, bloodGroup);
            pstmt.setString(6, name); // Assuming baby_name is unique and used as an identifier

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>Baby details updated successfully!</p>");
            } else {
                out.println("<p>Error: No baby details were updated.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Database error: " + e.getMessage() + "</p>");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
    <a href="babyDetails.jsp">Back to home</a>
</body>
</html>
