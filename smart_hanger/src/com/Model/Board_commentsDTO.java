package com.Model;


public class Board_commentsDTO {

	private String comments_num;
	private String userId;
	private String board_num;
	private String comments;
	private String upload_date;
	
	public Board_commentsDTO(String comments_num, String userId, String board_num, String comments, String upload_date) {
		this.comments_num = comments_num;
		this.userId = userId;
		this.board_num = board_num;
		this.comments = comments;
		this.upload_date = upload_date;
	}

	
	
	
	public Board_commentsDTO(String userId, String board_num, String comments) {
		super();
		this.userId = userId;
		this.board_num = board_num;
		this.comments = comments;
	}




	public String getComments_num() {
		return comments_num;
	}

	public void setComments_num(String comments_num) {
		this.comments_num = comments_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getboard_num() {
		return board_num;
	}

	public void setCody_board_num(String board_num) {
		this.board_num = board_num;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	

	
	
	
	
	
}
