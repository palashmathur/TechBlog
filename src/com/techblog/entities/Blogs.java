package com.techblog.entities;

import java.sql.*;

public class Blogs {

	private int b_id;
	private String b_title;
	private String b_content;
	private String b_code;
	private String b_pic;
	private Timestamp date;
	private int b_cid;
	private int user_id;
	/**
	 * @param b_id
	 * @param b_title
	 * @param b_content
	 * @param b_code
	 * @param b_pic
	 * @param date
	 * @param b_cid
	 * @param user_id
	 */
	public Blogs(int b_id, String b_title, String b_content, String b_code, String b_pic, Timestamp date, int b_cid,
			int user_id) {
		super();
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_code = b_code;
		this.b_pic = b_pic;
		this.date = date;
		this.b_cid = b_cid;
		this.user_id = user_id;
	}
	/**
	 * @param b_title
	 * @param b_content
	 * @param b_code
	 * @param b_pic
	 * @param date
	 * @param b_cid
	 * @param user_id
	 */
	public Blogs(String b_title, String b_content, String b_code, String b_pic, Timestamp date, int b_cid,
			int user_id) {
		super();
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_code = b_code;
		this.b_pic = b_pic;
		this.date = date;
		this.b_cid = b_cid;
		this.user_id = user_id;
	}
	
	
	
	
	/**
	 * @param b_id
	 * @param b_title
	 * @param b_content
	 * @param b_code
	 * @param b_pic
	 */
	public Blogs(int b_id, String b_title, String b_content, String b_code, String b_pic) {
		super();
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_code = b_code;
		this.b_pic = b_pic;
	}
	/**
	 * 
	 */
	public Blogs() {
		super();
	}
	/**
	 * @return the b_id
	 */
	public int getB_id() {
		return b_id;
	}
	/**
	 * @param b_id the b_id to set
	 */
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	/**
	 * @return the b_title
	 */
	public String getB_title() {
		return b_title;
	}
	/**
	 * @param b_title the b_title to set
	 */
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	/**
	 * @return the b_content
	 */
	public String getB_content() {
		return b_content;
	}
	/**
	 * @param b_content the b_content to set
	 */
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	/**
	 * @return the b_code
	 */
	public String getB_code() {
		return b_code;
	}
	/**
	 * @param b_code the b_code to set
	 */
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	/**
	 * @return the b_pic
	 */
	public String getB_pic() {
		return b_pic;
	}
	/**
	 * @param b_pic the b_pic to set
	 */
	public void setB_pic(String b_pic) {
		this.b_pic = b_pic;
	}
	/**
	 * @return the date
	 */
	public Timestamp getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Timestamp date) {
		this.date = date;
	}
	/**
	 * @return the b_cid
	 */
	public int getB_cid() {
		return b_cid;
	}
	/**
	 * @param b_cid the b_cid to set
	 */
	public void setB_cid(int b_cid) {
		this.b_cid = b_cid;
	}
	/**
	 * @return the user_id
	 */
	public int getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	//getters and setters
	
	

}
