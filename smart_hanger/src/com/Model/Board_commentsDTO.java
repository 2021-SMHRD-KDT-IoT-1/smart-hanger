package com.Model;


public class Board_commentsDTO {

	private String comments_num;
	private String userId;
	private String cody_board_num;
	private String comments;
	private String upload_date;
	
	public Board_commentsDTO(String comments_num, String userId, String cody_board_num, String comments, String upload_date) {
		this.comments_num = comments_num;
		this.userId = userId;
		this.cody_board_num = cody_board_num;
		this.comments = comments;
		this.upload_date = upload_date;
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

	public String getCody_board_num() {
		return cody_board_num;
	}

	public void setCody_board_num(String cody_board_num) {
		this.cody_board_num = cody_board_num;
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
