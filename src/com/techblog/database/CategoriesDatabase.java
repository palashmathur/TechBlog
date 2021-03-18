package com.techblog.database;

import java.sql.*;
import java.util.*;

import com.sun.net.httpserver.Authenticator.Result;
import com.techblog.entities.Categories;

public class CategoriesDatabase {

	Connection con;

	/**
	 * @param con
	 */
	public CategoriesDatabase(Connection con) {

		this.con = con;
	}

	// get list of all categories
	public ArrayList<Categories> getCategories() {
		ArrayList<Categories> list = new ArrayList<>();

		try {

			Statement st = con.createStatement();
			String q = "select * from categories";
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int c_id = rs.getInt("c_id");
				String c_name = rs.getString("c_name");
				String c_description = rs.getString("c_description");

				Categories c = new Categories(c_id, c_name, c_description);
				list.add(c);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	// get category by id
	public Categories getCategoryByCID(int cid) {

		Categories cat = null;
		try {

			Statement st = con.createStatement();
			String q = "SELECT * FROM categories where c_id='" + cid + "' ";
			ResultSet rs = st.executeQuery(q);

			if (rs.next()) {
				String c_name = rs.getString("c_name");
				String c_description = rs.getString("c_description");
				cat = new Categories(cid, c_name, c_description);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cat;
	}

	// Insert new Category
	public boolean insertCategory(String cat_name, String cat_des) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			Statement st = con.createStatement();

			String q1 = " INSERT into categories (c_name,c_description) values('" + cat_name + "','" + cat_des + "') ";
			// update hone ke baad true kra denge mtln insert nhi hua hoga to false hi rhega
			st.executeUpdate(q1);
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

//delete category
	public boolean deleteCategory(int cid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			Statement st = con.createStatement();
			String q = "DELETE from categories WHERE c_id='" + cid + "' ";
			st.executeUpdate(q);
			flag = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	
		return flag;
	}
}
