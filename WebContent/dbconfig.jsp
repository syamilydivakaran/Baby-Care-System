<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%! 
    // Database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/babycare";
    String dbUser = "root"; // your database username
    String dbPassword = "Syamily@123"; // your database password

    Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return DriverManager.getConnection(dbURL, dbUser, dbPassword);
    }
%>
