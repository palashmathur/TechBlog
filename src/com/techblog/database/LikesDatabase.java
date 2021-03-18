package com.techblog.database;

import java.sql.*;

import com.techblog.helper.DBConnectionProvider;

public class LikesDatabase {

	private Connection con;

	/**
	 * @param con
	 */
	public LikesDatabase(Connection con) {
		this.con = con;
	}

	// insert like
	public String insertLikes(int bid, int uid) {

		LikesDatabase likesDao = new LikesDatabase(DBConnectionProvider.getConnection());

		String flag = "";

		if (likesDao.checkLike(bid, uid)) {
			likesDao.removeLike(bid, uid);
			flag = "disliked";
		} else {

			try {
				String q = "insert into likes(bid,uid) values(?,?)";
				PreparedStatement p = this.con.prepareStatement(q);

				p.setInt(1, bid);
				p.setInt(2, uid);
				p.executeUpdate();
				flag = "liked";

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return flag;

	}

	// count total likes
	public int getTotalLikes(int bid) {

		int count = 0;

		try {

			Statement st = con.createStatement();
			String q = "SELECT count(*) from likes where bid='" + bid + "' ";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}

	// Check already liked or not
	public boolean checkLike(int bid, int uid) {
		boolean flag = false;

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from likes where bid='" + bid + "'  AND uid='" + uid + "'";
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

	// remove like if clicked even number of time on like button
	public boolean removeLike(int bid, int uid) {
		boolean flag = false;

		try {

			Statement st = con.createStatement();
			String q = "DELETE from likes where bid='" + bid + "'  AND uid='" + uid + "'";
			st.executeUpdate(q);
			flag = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

}
