package com.xy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.xml.crypto.Data;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CountTime data = new CountTime();
		String sql = "insert into tb_logistics (Title,Content,Author,IssueDate)values(?,?,?,?)";
		try {
			Connection conn = JDBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "wowowo");
			ps.setString(2, "zxcasfqwrfasx56f4a564f");
			ps.setString(3, "lg");
			ps.setString(4, data.currentlyTime());
			int index = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
