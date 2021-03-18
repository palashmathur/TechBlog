package com.techblog.database;

import java.sql.*;
import java.util.ArrayList;

import com.techblog.entities.Users;

public class FollowDatabase {

	private Connection con;

	/**
	 * @param con
	 */
	public FollowDatabase(Connection con) {
		this.con = con;
	}

	// for follow and unfollow
	public String Follow(int follower_id, int following_id) {

		String flag = "";
		if (alredyFollowing(follower_id, following_id)) {

			unFollow(follower_id, following_id);

			flag = "unfollowed";
		} else {

			try {
				String q = "insert into followers(follower_id,following_id) values(?,?)";
				PreparedStatement p = this.con.prepareStatement(q);

				p.setInt(1, follower_id);
				p.setInt(2, following_id);
				p.executeUpdate();
				flag = "followed";

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
		return flag;
	}

	// to unfollow someone
	public void unFollow(int follower_id, int following_id) {

		try {

			Statement st = con.createStatement();
			String q = "DELETE from followers where follower_id='" + follower_id + "'  AND following_id='"
					+ following_id + "'";
			st.executeUpdate(q);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	// check pehle se follow kr rhe h ya nhi
	public boolean alredyFollowing(int follower_id, int following_id) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from followers where follower_id='" + follower_id + "'  AND following_id='"
					+ following_id + "'";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	// get Users list of all followers
	public ArrayList<Users> getFollowers(int user_id) {

		ArrayList<Integer> idList = new ArrayList<>();
		ArrayList<Users> users = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from followers WHERE following_id='" + user_id + "'";
			ResultSet rs = st.executeQuery(q);
			while (rs.next()) {
				int follower_id = rs.getInt("follower_id");
				idList.add(follower_id);
			}
			users = getAllUsersList(idList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return users;
	}

	// helper function for getFollowers and getFollowing
	public ArrayList<Users> getAllUsersList(ArrayList<Integer> idList) {
		// TODO Auto-generated method stub
		ArrayList<Users> userList = new ArrayList<Users>();

		for (Integer id : idList) {
			try {

				Statement st = con.createStatement();
				String q = "SELECT * from techblog_users WHERE id='" + id + "' ";
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

					userList.add(user);
				}

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}

		}
		return userList;

	}

	// get Users list of all following
	public ArrayList<Users> getFollowing(int user_id) {

		ArrayList<Integer> idList = new ArrayList<>();
		ArrayList<Users> users = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from followers WHERE follower_id='" + user_id + "'";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {
				int following_id = rs.getInt("following_id");
				idList.add(following_id);
			}

			users = getAllUsersList(idList);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return users;
	}

	// to get total Followers
	public int getTotalFollowers(int user_id) {
		int totalFollowers = 0;

		try {
			Statement st = con.createStatement();
			String q = "SELECT * from followers WHERE following_id='" + user_id + "'";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {
				totalFollowers++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return totalFollowers;
	}

	// to get total Following
	public int getTotalFollowing(int user_id) {
		int totalFollowing = 0;

		try {
			Statement st = con.createStatement();
			String q = "SELECT * from followers WHERE follower_id='" + user_id + "'";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {
				totalFollowing++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return totalFollowing;
	}

}
