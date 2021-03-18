//IS PACKAGE ME SARI WO CLASSES RHENGI JO DATABASE  ME CHANGES PERFORM KREGI
//HAR EK TABLE KE LIYE DATABASE KI ALG ALG CLASS BNEGI

package com.techblog.database;

import java.sql.*;
import java.util.ArrayList;

import com.techblog.entities.Users;

//insert a user into database 
public class UsersDatabase {

	// to hold a connection
	private Connection con;

	// initialize it with connection object jo servlet me se diya h JB IS CLASS KA
	// OBJECT BNANA TB AS A PARAMETER
	public UsersDatabase(Connection con) {
		this.con = con;
	}

	// method to insert data into database

	// YE 'Users' class ka object as a parameter me accept kr rhi h
	// jo ki servlet me is class ko call krte time dala tha
	public boolean insertUser(Users user) {

		// check krne ke liye ki insert hua ya koi error exception aagyi
		// false return hua mtlb nhi insert hua
		// true return hua mtln hogya.
		boolean flag = false;

		// users class ki getters methods se value le rhi h
		String username = user.getUsername();
		String email = user.getEmail();
		String password = user.getPassword();
		String contact = user.getContact();
		String gender = user.getGender();

		// database ke connection ko use krke statment bnaya aur queary chlai insert ki
		try {
			Statement st = con.createStatement();
			String q1 = "INSERT INTO techblog_users (username,email,password,contact,gender) values('" + username
					+ "','" + email + "','" + password + "','" + contact + "','" + gender + "')";
			st.executeUpdate(q1);
			// update hone ke baad true kra denge mtln insert nhi hua hoga to false hi rhega
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	// login ke liye
	public Users LoginUser(String user_email, String user_password) {

		Users user = null;

		// String user_email2=user_email;
		try {
			Statement st = con.createStatement();
			String q = "select * from techblog_users where email='" + user_email + "'  AND password='" + user_password
					+ "' ";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {

				user = new Users();

				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(user_email);
				user.setPassword(user_password);
				user.setContact(rs.getString("contact"));
				user.setGender(rs.getString("gender"));
				user.setRegistration_time(rs.getTimestamp("registration_date"));
				user.setProfile(rs.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	// update user info
	public boolean updateUser(Users user) {
		boolean flag = false;

		try {
			Statement st = con.createStatement();
			String q = "update techblog_users set username= '" + user.getUsername() + "',email='" + user.getEmail()
					+ "',password='" + user.getPassword() + "',contact='" + user.getContact() + "',gender='"
					+ user.getGender() + "',profile='" + user.getProfile() + "' WHERE id='" + user.getId() + "'";
			st.executeUpdate(q);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	// fetch single user by id
	public Users getUserById(int user_id) {

		Users user = null;

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from techblog_users where id='" + user_id + "' ";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {

				user = new Users();

				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setContact(rs.getString("contact"));
				user.setGender(rs.getString("gender"));
				user.setRegistration_time(rs.getTimestamp("registration_date"));
				user.setProfile(rs.getString("profile"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return user;
	}

	// fetch all users
	public ArrayList<Users> getAllUser() {

		ArrayList<Users> list = new ArrayList<Users>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from techblog_users";
			ResultSet rs = st.executeQuery(q);
			while (rs.next()) {

				Users user = new Users();

				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setContact(rs.getString("contact"));
				user.setGender(rs.getString("gender"));
				user.setRegistration_time(rs.getTimestamp("registration_date"));
				user.setProfile(rs.getString("profile"));

				list.add(user);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return list;
	}

	//delete single user
	public boolean deleteUser(int user_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try {
			Statement st = con.createStatement();
			String q = "DELETE from techblog_users WHERE id='" + user_id + "' ";
			st.executeUpdate(q);
			flag = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	
		return flag;
	}
}
