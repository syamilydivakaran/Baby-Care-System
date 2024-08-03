<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="login">
		<h2>SELECT THE AGE</h2>

		<form name="admin" id="login" method="post" action="vaccinationSchedule.jsp">
			<label for="age">AGE:</label> <select name="age" id="age" onchange="showDatePicker()">
				<option value="">select age group</option>
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
			</select> <br>
			
		 <label for="date">Date of birth :&nbsp&nbsp&nbsp&nbsp</label>
        <input type="date" id="date" name="date" min="2006-01-01" max="2024-12-31" value="select"> <br><br>
        <input type="submit" value="Submit">
       
        
       
			
		</form>

	</div>

</body>
</html>