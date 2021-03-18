package com.techblog.database;

import java.sql.*;

import com.techblog.entities.Admin;

public class AdminDatabase {

	private Connection con;

	/**
	 * @param con
	 */
	public AdminDatabase(Connection con) {
		super();
		this.con = con;
	}

	// login admin
	public Admin loginAdmin(String admin_email, String admin_password) {

		Admin admin = null;

		// String user_email2=user_email;
		try {
			Statement st = con.createStatement();
			String q = "select * from techblog_admin where admin_email='" + admin_email + "'  AND admin_password='"
					+ admin_password + "' ";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {

				admin = new Admin();

				admin.setAdmin_id(rs.getInt("admin_id"));
				admin.setAdmin_name(rs.getString("admin_name"));
				admin.setAdmin_email(admin_email);
				admin.setAdmin_password(admin_password);
				admin.setAdmin_contact(rs.getString("admin_contact"));
				admin.setAdmin_gender(rs.getString("admin_gender"));

				admin.setProfile(rs.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return admin;
	}

	//update admin
	public boolean updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try {
			Statement st = con.createStatement();
			String q = "update techblog_admin set admin_name= '" + admin.getAdmin_name() + "',admin_email='" + admin.getAdmin_email()
					+ "',admin_password='" + admin.getAdmin_password() + "',admin_contact='" + admin.getAdmin_contact() + "',admin_gender='"
					+ admin.getAdmin_gender() + "',profile='" + admin.getProfile() + "' WHERE admin_id='" + admin.getAdmin_id() + "'";
			st.executeUpdate(q);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
}
