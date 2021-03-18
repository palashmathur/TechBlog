package com.techblog.entities;

import java.sql.Timestamp;

public class Admin {

	
	private int admin_id;
	private String admin_name;
	private String admin_password;
	private String admin_email;
	private String admin_contact;
	private String admin_gender;
	private String profile;
	/**
	 * @param admin_id
	 * @param admin_name
	 * @param admin_password
	 * @param admin_email
	 * @param admin_contact
	 * @param admin_gender
	 * @param reg_date
	 * @param profile
	 */
	public Admin(int admin_id, String admin_name, String admin_password, String admin_email, String admin_contact,
			String admin_gender) {
		super();
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.admin_password = admin_password;
		this.admin_email = admin_email;
		this.admin_contact = admin_contact;
		this.admin_gender = admin_gender;
		
		
	}
	/**
	 * @param admin_name
	 * @param admin_password
	 * @param admin_email
	 * @param admin_contact
	 * @param admin_gender
	 * @param reg_date
	 * @param profile
	 */
	public Admin(String admin_name, String admin_password, String admin_email, String admin_contact,
			String admin_gender) {
		super();
		this.admin_name = admin_name;
		this.admin_password = admin_password;
		this.admin_email = admin_email;
		this.admin_contact = admin_contact;
		this.admin_gender = admin_gender;
		
		
	}
	/**
	 * 
	 */
	public Admin() {
		super();
	}
	/**
	 * @return the admin_id
	 */
	public int getAdmin_id() {
		return admin_id;
	}
	/**
	 * @param admin_id the admin_id to set
	 */
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	/**
	 * @return the admin_name
	 */
	public String getAdmin_name() {
		return admin_name;
	}
	/**
	 * @param admin_name the admin_name to set
	 */
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	/**
	 * @return the admin_password
	 */
	public String getAdmin_password() {
		return admin_password;
	}
	/**
	 * @param admin_password the admin_password to set
	 */
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	/**
	 * @return the admin_email
	 */
	public String getAdmin_email() {
		return admin_email;
	}
	/**
	 * @param admin_email the admin_email to set
	 */
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	/**
	 * @return the admin_contact
	 */
	public String getAdmin_contact() {
		return admin_contact;
	}
	/**
	 * @param admin_contact the admin_contact to set
	 */
	public void setAdmin_contact(String admin_contact) {
		this.admin_contact = admin_contact;
	}
	/**
	 * @return the admin_gender
	 */
	public String getAdmin_gender() {
		return admin_gender;
	}
	/**
	 * @param admin_gender the admin_gender to set
	 */
	public void setAdmin_gender(String admin_gender) {
		this.admin_gender = admin_gender;
	}

	/**
	 * @return the profile
	 */
	public String getProfile() {
		return profile;
	}

	/**
	 * @param profile the profile to set
	 */
	public void setProfile(String profile) {
		this.profile = profile;
	}

	//Getters and setter
	
	
	
	
}
