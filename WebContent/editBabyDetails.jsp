<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Baby Details</title>
    <link href="css/styleThree.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <%
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String allergies = request.getParameter("allergies");
        String bloodGroup = request.getParameter("bloodGroup");
    %>

    <form action="updateBabyDetails.jsp" method="post">
        <h2>Edit Baby Details</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>"><br><br>
        
        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender" value="<%= gender %>"><br><br>

        <label for="birthday">Birthday:</label>
        <input type="date" id="birthday" name="birthday" value="<%= birthday %>"><br><br>

        <label for="allergies">Allergies:</label>
        <input type="text" id="allergies" name="allergies" value="<%= allergies %>"><br><br>
        
        <br> <label for="bloodGroup">Blood Group:</label> 
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
        
        <input type="submit" value="Save" action="viewBabyDetails.jsp">
        
    </form>

</body>
</html>
