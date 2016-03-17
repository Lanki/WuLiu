package com.xy;

import java.sql.*;

public class JDBConnection {
	static final String url = "jdbc:mysql://localhost:3306/test?"
			+ "user=root&password=root&useUnicode=true&characterEncoding=UTF8";
	static final String drive = "com.mysql.jdbc.Driver";
	static final String username = "root";
	static final String password = "root";

	static {
		try {
			Class.forName(drive);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection conn, Statement st,
			ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void closeConnection(Connection conn, Statement st) {
		closeConnection(conn, st, null);
	}

}
