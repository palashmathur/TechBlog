//HAR EK CLASS entities PACKAGE KI HR EK DATABASE KI TABLE KO REPRESENT KREGI INKE THROUGH HI VALUE INSERT DELETE EDIT WGERA HOGI
//AUR HAR CLASS KA OBJECT PAERTICULER CLASS KI EK ROW KO REPRESENT KREGA
//IS CLASS KA OBJECT APN PERTICULER SERVLET BNATE TIME BNAYENGE 
//AUR IS CLASS KE OBJECT KO APN US CLASS KE OBJECT ME AS A PARAMETER PASS KRENGE JO DATABSE ME CHANGES KREGI


package com.techblog.entities;

import java.sql.*;

public class Users {

	// jitne bhi coloum table me h user ki utni variable
	private int id;
	private String username;
	private String email;
	private String password;
	private String contact;
	private String gender;
	private Timestamp registration_time;
	private String profile;

	// iska use nhi kra register krte time pr bna diya h kbhi jrurt pde baad me
	// isliye
	public Users(int id, String username, String email, String password, String contact, String gender,
			Timestamp registration_time) {

		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.contact = contact;
		this.gender = gender;
		this.registration_time = registration_time;
	}

	// Is class ka object 'RegisterServlet' me bnaya h aur uske corresponding ye
	// constructor chlega aur values inilizise hongi
	public Users(String username, String email, String password, String contact, String gender) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.contact = contact;
		this.gender = gender;

	}

	// iska use nhi kra register krte time pr bna diya h kbhi jrurt pde baad me
	// isliye
	public Users() {
		// TODO Auto-generated constructor stub
	}

	// all the getters and setters methods
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the contact
	 */
	public String getContact() {
		return contact;
	}

	/**
	 * @param contact the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the registration_time
	 */
	public Timestamp getRegistration_time() {
		return registration_time;
	}

	/**
	 * @param registration_time the registration_time to set
	 */
	public void setRegistration_time(Timestamp registration_time) {
		this.registration_time = registration_time;
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

}
