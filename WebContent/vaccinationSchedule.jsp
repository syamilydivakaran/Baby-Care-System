<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vaccination Schedule</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <%
        // Retrieve parameters
        String selectedAge = request.getParameter("age");
        String babyName = request.getParameter("name");
        String birthdayStr = request.getParameter("birthday");
        
        // Default values
        String schedule = "";
        String actionMessage = "";
        java.util.Date birthDate = null;

        // Parse the birthday if available
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Adjust format as needed
        if (birthdayStr != null && !birthdayStr.isEmpty()) {
            try {
                birthDate = sdf.parse(birthdayStr);
            } catch (ParseException e) {
                actionMessage = "Error parsing the date.";
                e.printStackTrace();
            }
        }

        // Calculate the next vaccination date
        Calendar cal = Calendar.getInstance();
        if (birthDate != null) {
            cal.setTime(birthDate);
        }

        if (selectedAge != null) {
            switch (selectedAge) {
                case "BIRTH":
                    schedule = "BCG, Hepatitis B, OPV 0";
                    actionMessage = "Newborn vaccinations initiated.";
                    if (birthDate != null) {
                        cal.add(Calendar.MONTH, 18);
                        actionMessage += " Next vaccination on: " + sdf.format(cal.getTime());
                    }
                    break;
                case "6 WEEKS":
                    cal.add(Calendar.WEEK_OF_YEAR, 6);
                    schedule = "DTwP 1, IPV 1, Hepatitis B 2, Hib 1, Rotavirus 1, PCV 1";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "10 WEEKS":
                    cal.add(Calendar.WEEK_OF_YEAR, 10);
                    schedule = "DTwP 2, IPV 2, Hib 2, Rotavirus 2, PCV 2";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "14 WEEKS":
                    cal.add(Calendar.WEEK_OF_YEAR, 14);
                    schedule = "DTwP 3, IPV 3, Hib 3, Rotavirus 3, PCV 3";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "6 MONTHS":
                    cal.add(Calendar.MONTH, 6);
                    schedule = "Hepatitis B 3, OPV 1";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "9 MONTHS":
                    cal.add(Calendar.MONTH, 9);
                    schedule = "OPV 2, MMR 1";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "12 MONTHS":
                    cal.add(Calendar.YEAR, 1);
                    schedule = "Hepatitis A 1";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "15 MONTHS":
                    cal.add(Calendar.MONTH, 15);
                    schedule = "MMR 2, Varicella 1, PCV booster";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "16-18 MONTHS":
                    cal.add(Calendar.MONTH, 18);
                    schedule = "DTwP B1/DTaP B1, IPV B1, Hib B1";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "4-6 YEARS":
                    cal.add(Calendar.YEAR, 5); // average age in years
                    schedule = "DTwP B2/DTaP B2, OPV 3, MMR 3, Varicella 2, Typhoid";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "9-14 YEARS":
                    cal.add(Calendar.YEAR, 12); // average age in years
                    schedule = "HPV";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;
                case "15-18 YEARS":
                    cal.add(Calendar.YEAR, 16); // average age in years
                    schedule = "Tdap/Td, HPV";
                    actionMessage = "Next vaccination on: " + sdf.format(cal.getTime());
                    break;

                default:
                    actionMessage = "No specific action for the selected age.";
                    break;
            }
        }
    %>

    <div class="vaccination-schedule">
        <h2>
            Vaccination Schedule for
            <%= (selectedAge != null) ? selectedAge : "No age selected" %>
        </h2>
        <p>
            <%= (schedule != null && !schedule.isEmpty()) ? schedule : "No vaccination schedule available for the selected age." %>
        </p>
        <p>
            <%= actionMessage %>
        </p>
        <p>
            Date of Birth: <%= (birthdayStr != null) ? birthdayStr : "No date selected." %>
        </p>
        
    </div>
    <form action="babyDetails.jsp">
    <input type="submit" value="back"/><br><br>
    </form>
    
    

</body>
</html>
