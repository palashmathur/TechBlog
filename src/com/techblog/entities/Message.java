package com.techblog.entities;

public class Message {

	
	private String msg_content;
	private String msg_type;
	private String cssClass;
	/**
	 * @param msg_content
	 * @param msg_type
	 * @param cssClass
	 */
	public Message(String msg_content, String msg_type, String cssClass) {
		
		this.msg_content = msg_content;
		this.msg_type = msg_type;
		this.cssClass = cssClass;
	}
	/**
	 * @return the msg_content
	 */
	public String getMsg_content() {
		return msg_content;
	}
	/**
	 * @param msg_content the msg_content to set
	 */
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	/**
	 * @return the msg_type
	 */
	public String getMsg_type() {
		return msg_type;
	}
	/**
	 * @param msg_type the msg_type to set
	 */
	public void setMsg_type(String msg_type) {
		this.msg_type = msg_type;
	}
	/**
	 * @return the cssClass
	 */
	public String getCssClass() {
		return cssClass;
	}
	/**
	 * @param cssClass the cssClass to set
	 */
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
}
