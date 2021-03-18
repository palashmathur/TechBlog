package com.techblog.database;

import java.sql.*;

import com.techblog.entities.Blogs;
import java.util.*;

//import org.graalvm.compiler.debug.TimeSource;

public class BlogsDatabase {

	Connection con;

	/**
	 * @param con
	 */

	public BlogsDatabase(Connection con) {

		this.con = con;
	}

	// insert post
	public boolean doPost(Blogs blog) {

		boolean flag = false;

		String b_title = blog.getB_title();
		String b_content = blog.getB_content();
		String b_code = blog.getB_code();
		String b_pic = blog.getB_pic();
		int b_cid = blog.getB_cid();
		int user_id = blog.getUser_id();

		try {
			Statement st = con.createStatement();

			String q1 = " INSERT into not_confiremd_blogs (b_title,b_content,b_code,b_pic,b_cid,user_id) values('"
					+ b_title + "','" + b_content + "','" + b_code + "','" + b_pic + "','" + b_cid + "','" + user_id
					+ "') ";
			// update hone ke baad true kra denge mtln insert nhi hua hoga to false hi rhega
			st.executeUpdate(q1);
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	// fetch all posts
	public ArrayList<Blogs> getAllBlogs() {

		ArrayList<Blogs> list = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from blogs order by b_id desc";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int b_id = rs.getInt("b_id");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int b_cid = rs.getInt("b_cid");
				int user_id = rs.getInt("user_id");

				Blogs blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);

				list.add(blog);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	// fetch all posts of same category
	public ArrayList<Blogs> getBlogsByCategories(int b_cid) {

		ArrayList<Blogs> list = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from blogs where b_cid='" + b_cid + "' ";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int b_id = rs.getInt("b_id");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int user_id = rs.getInt("user_id");

				Blogs blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);

				list.add(blog);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	// fetch single post
	public Blogs getSingleBlog(int b_id) {

		Blogs blog = null;

		try {
			Statement st = con.createStatement();
			String q = "SELECT * from blogs where b_id='" + b_id + "' ";
			ResultSet rs = st.executeQuery(q);

			if (rs.next()) {

				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int b_cid = rs.getInt("b_cid");
				int user_id = rs.getInt("user_id");

				blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return blog;
	}

	// fetch blogs by user id
	public ArrayList<Blogs> getAllBlogByUserID(int user_id) {
		ArrayList<Blogs> list = new ArrayList<>();

		Blogs blog = null;

		try {
			Statement st = con.createStatement();
			String q = "SELECT * from blogs where user_id='" + user_id + "' ";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int b_id = rs.getInt("b_id");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int b_cid = rs.getInt("b_cid");

				blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);

				list.add(blog);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	// delete single blog
	public boolean deleteBlog(int bid) {
		boolean flag = false;

		try {
			Statement st = con.createStatement();
			String q = "DELETE from blogs WHERE b_id='" + bid + "' ";
			st.executeUpdate(q);
			flag = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	//edit blog
	public boolean editPost(Blogs blog) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try {

			Statement st = con.createStatement();
			String q = "UPDATE blogs set b_title='" + blog.getB_title() + "',b_content='" + blog.getB_content()
					+ "',b_code='" + blog.getB_code() + "',b_pic='" + blog.getB_pic() + "'  where b_id='"
					+ blog.getB_id() + "' ";
			st.executeUpdate(q);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	// fatch all not confirmed blogs
	public ArrayList<Blogs> getAllNotConfirmedBlogs() {

		ArrayList<Blogs> list = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from not_confiremd_blogs order by b_id desc";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int b_id = rs.getInt("b_id");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int b_cid = rs.getInt("b_cid");
				int user_id = rs.getInt("user_id");

				Blogs blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);

				list.add(blog);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	// fetch not confirmed blogs by cid
	public ArrayList<Blogs> getNotConfirmedBlogsByCategories(int b_cid) {

		ArrayList<Blogs> list = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "SELECT * from not_confiremd_blogs where b_cid='" + b_cid + "' ";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int b_id = rs.getInt("b_id");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int user_id = rs.getInt("user_id");

				Blogs blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);

				list.add(blog);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	// fetch not confirmed single blogs by bid
	public Blogs getSingleNotConfirmedBlog(int b_id) {
		Blogs blog = null;

		try {
			Statement st = con.createStatement();
			String q = "SELECT * from not_confiremd_blogs where b_id='" + b_id + "' ";
			ResultSet rs = st.executeQuery(q);

			if (rs.next()) {

				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				Timestamp date = rs.getTimestamp("b_date");
				int b_cid = rs.getInt("b_cid");
				int user_id = rs.getInt("user_id");

				blog = new Blogs(b_id, b_title, b_content, b_code, b_pic, date, b_cid, user_id);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return blog;
	}

	// confirm blog
	public boolean confirmBlog(int bid) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try {
			Statement st = con.createStatement();
			String q = "SELECT * from not_confiremd_blogs where b_id='" + bid + "' ";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {

			

				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_code = rs.getString("b_code");
				String b_pic = rs.getString("b_pic");
				int b_cid = rs.getInt("b_cid");
				int user_id = rs.getInt("user_id");

				String q1 = " INSERT into blogs (b_title,b_content,b_code,b_pic,b_cid,user_id) values('"
						+ b_title + "','" + b_content + "','" + b_code + "','" + b_pic + "','" + b_cid + "','" + user_id
						+ "') ";
				// update hone ke baad true kra denge mtln insert nhi hua hoga to false hi rhega
				st.executeUpdate(q1);
				flag = true;
				if(flag) {
					String q2="DELETE from not_confiremd_blogs where b_id='" + bid + "' ";
					st.executeUpdate(q2);
					
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	
	//delete not cofirmed blogs 
	public boolean deleteNotConfiremdBlog(int bid) {
		// TODO Auto-generated method stub
		boolean flag=false;
		
		try {
			Statement st = con.createStatement();
			String q = "DELETE from not_confiremd_blogs WHERE b_id='" + bid + "' ";
			st.executeUpdate(q);
			flag = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return flag;
	}

}
