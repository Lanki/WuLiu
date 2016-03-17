package com.xy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Connection conn = JDBConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select * from tb_Customer";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (rs != null) {
			System.out.println("1");
		} else {
			System.out.println("2");
		}

	}

}
