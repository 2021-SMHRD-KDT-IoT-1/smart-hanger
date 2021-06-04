package com.Model;

public class CommunityDTO {
	private int board_num;
	private String userid;
	private String title;
	private String content;
	private String upload_date;
	private int like_num;
	private int view_num;
	private String clothespath;
	
	public CommunityDTO(int board_num, String userid, String title, String content, String upload_date, int like_num,
			int view_num, String clothespath) {
		super();
		this.board_num = board_num;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.upload_date = upload_date;
		this.like_num = like_num;
		this.view_num = view_num;
		this.clothespath = clothespath;
	}
	public CommunityDTO(int board_num, String userid, String title, String content, String upload_date, int like_num,
			int view_num) {
		super();
		this.board_num = board_num;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.upload_date = upload_date;
		this.like_num = like_num;
		this.view_num = view_num;
	}
	public CommunityDTO(int board_num, String userid, String title, String content, String upload_date) {
		super();
		this.board_num = board_num;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.upload_date = upload_date;
		
	}
	
	public CommunityDTO(int board_num, String userid, String title,String clothespath) {
		super();
		this.board_num = board_num;
		this.userid = userid;
		this.title = title;
		this.clothespath = clothespath;
	}
	public CommunityDTO(String title,String userid,String content,String upload_date) {
		super();
		this.title = title;
		this.userid = userid;
		this.content = content;
		this.upload_date = upload_date;
		
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getView_num() {
		return view_num;
	}

	public void setView_num(int view_num) {
		this.view_num = view_num;
	}

	public String getClothespath() {
		return clothespath;
	}

	public void setClothespath(String clothespath) {
		this.clothespath = clothespath;
	}
	
	}