package com.techblog.entities;

public class Follow {

	private int id;
	private int follower_id;
	private int following_id;
	/**
	 * @param id
	 * @param follower_id
	 * @param following_id
	 */
	public Follow(int id, int follower_id, int following_id) {
		super();
		this.id = id;
		this.follower_id = follower_id;
		this.following_id = following_id;
	}
	/**
	 * @param follower_id
	 * @param following_id
	 */
	public Follow(int follower_id, int following_id) {
		super();
		this.follower_id = follower_id;
		this.following_id = following_id;
	}
	/**
	 * 
	 */
	public Follow() {
		super();
	}
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
	 * @return the follower_id
	 */
	public int getFollower_id() {
		return follower_id;
	}
	/**
	 * @param follower_id the follower_id to set
	 */
	public void setFollower_id(int follower_id) {
		this.follower_id = follower_id;
	}
	/**
	 * @return the following_id
	 */
	public int getFollowing_id() {
		return following_id;
	}
	/**
	 * @param following_id the following_id to set
	 */
	public void setFollowing_id(int following_id) {
		this.following_id = following_id;
	}

}
