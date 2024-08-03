package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO {
	private static Connection dbCon;
	private static String dbURL;
	private static String dbDriver;
	private static String userName;
	private static String passWord;
	
	private static void dbInit() {
		try {
			dbDriver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/babycare";
			userName = "root";
			passWord = "Syamily@123";
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void connect() throws ClassNotFoundException, SQLException {
		dbInit();
		Connection conn = null;
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbURL, userName, passWord);
			setDbCon(conn);
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}
	}
	
	public static void setDbCon(Connection con) {
		dbCon = con;
	}
	
	public static Connection getDbCon() {
		return dbCon;
	}
	
	public static void close() throws SQLException {
		dbCon.close();
	}

}
