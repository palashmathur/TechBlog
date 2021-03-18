package com.techblog.entities;

public class Categories {

	private int c_id;
	private String c_name;
	private String c_description;
	
	
	/**
	 * @param c_id
	 * @param c_name
	 * @param c_description
	 */
	public Categories(int c_id, String c_name, String c_description) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_description = c_description;
	}
	
	
	/**
	 * @param c_name
	 * @param c_description
	 */
	public Categories(String c_name, String c_description) {
		super();
		this.c_name = c_name;
		this.c_description = c_description;
	}
	
	
	/**
	 * 
	 */
	public Categories() {
		super();
	}


	/**
	 * @return the c_id
	 */
	public int getC_id() {
		return c_id;
	}


	/**
	 * @param c_id the c_id to set
	 */
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}


	/**
	 * @return the c_name
	 */
	public String getC_name() {
		return c_name;
	}


	/**
	 * @param c_name the c_name to set
	 */
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	/**
	 * @return the c_description
	 */
	public String getC_description() {
		return c_description;
	}


	/**
	 * @param c_description the c_description to set
	 */
	public void setC_description(String c_description) {
		this.c_description = c_description;
	}
	
	//Getters and Setters
	
	
}
