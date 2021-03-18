package com.techblog.helper;

import java.sql.*;

//databse se connect krne ke liye class taki puri website me baar baar na connection bnana pde .
public class DBConnectionProvider {

	private static Connection con;

//returns connection ka object 'con'
	public static Connection getConnection() {

		try {

			// ye nnhi likhte to connection baar baar bnta
			// agr connection pehle se bna hua h to waps nhi bnayenge wohi return kr denge
			// wrna bnayenge
			if (con == null) {
				// load class
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tech_blog", "root", "root");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		// returning connection
		return con;
	}

}
