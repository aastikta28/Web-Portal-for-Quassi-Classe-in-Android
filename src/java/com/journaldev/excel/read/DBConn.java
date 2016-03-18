package com.journaldev.excel.read;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	final static String DRIVER_NAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

	public static Connection getConn(String ip, String databaseName, String user, String password) {
		Connection conn = null;

		try {
			Class.forName(DRIVER_NAME);			
			String url = buildUrl(ip, databaseName);
			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {		
			e.printStackTrace();
		}

		return conn;
	}

	public static String buildUrl(String ip, String databaseName) {
		return new StringBuffer().append("jdbc:sqlserver://")
			.append(ip).append(":1433;DatabaseName=")
			.append(databaseName).toString();
	}

    static Connection getConnection() {
        throw new UnsupportedOperationException("Not yet implemented");
    }
}