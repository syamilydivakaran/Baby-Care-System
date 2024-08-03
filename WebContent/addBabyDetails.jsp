<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Baby Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String allergies = request.getParameter("allergies");
        String bloodGroup = request.getParameter("bloodGroup");

        // Database connection
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = getConnection();
            String sql = "INSERT INTO baby_details (baby_name, baby_gender, baby_birthday, baby_allergies, baby_blood) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setDate(3, Date.valueOf(birthday)); // Make sure the date format is yyyy-mm-dd
            pstmt.setString(4, allergies);
            pstmt.setString(5, bloodGroup);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                message = "Baby details added successfully!";
            } else {
                message = "Failed to add baby details.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Database error: " + e.getMessage();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>

<div class="container">
    <h2>Add Baby Details</h2>
    <p><%= message %></p>
    <form action="addBabyDetails.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
			<option value="--select--">--select--</option>
			<option value="male">male</option>
			<option value="female">female</option>
			<option value="other">other</option>
		</select><br><br><br>

        <label for="birthday">Birthday:</label>
        <input type="date" id="birthday" name="birthday" required><br><br>

        <label for="allergies">Allergies:</label>
        <input type="text" id="allergies" name="allergies"><br><br>

        <label for="bloodGroup">Blood Group:</label>
        <select id="bloodGroup" name="bloodGroup" required>
			<option value="--select--">--select--</option>
			<option value="A+">A+</option>
			<option value="A-">A-</option>
			<option value="B+">B+</option>
			<option value="B-">B-</option>
			<option value="AB+">AB+</option>
			<option value="AB-">AB-</option>
			<option value="O+">O+</option>
			<option value="O-">O-</option>
		</select><br>

        <input type="submit" value="Add Baby Details" action="viewBabyDetails.jsp">
    </form>
</div>

</body>
</html>
