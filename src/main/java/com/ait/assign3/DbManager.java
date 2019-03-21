package com.ait.assign3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbManager {
	Connection conn;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String user = "root";
			String password = "";

			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sad", user, password);
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println(" YYYYYYYYYYYYYYYYYYYYy");
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			System.out.println(" ZZZZZZZZZZZZZZZZZZZZZZZZZZz");
			e.printStackTrace();
			return null;
		}
	}
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
