package com.Model;

public class Cody_clothesDTO {
	private String cody_num;
	private String my_clothes_num;
	private String userID;
	private String title;
	private String content;
	private String kind;
	private String clothesPath;
	

	public Cody_clothesDTO(String cody_num, String my_clothes_num, String userID, String title, String content,
			String kind, String clothesPath) {
		super();
		this.cody_num = cody_num;
		this.my_clothes_num = my_clothes_num;
		this.userID = userID;
		this.title = title;
		this.content = content;
		this.kind = kind;
		this.clothesPath = clothesPath;
	}


	public String getCody_num() {
		return cody_num;
	}


	public String getMy_clothes_num() {
		return my_clothes_num;
	}


	public String getUserID() {
		return userID;
	}


	public String getTitle() {
		return title;
	}


	public String getContent() {
		return content;
	}


	public String getKind() {
		return kind;
	}


	public String getClothesPath() {
		return clothesPath;
	}
	
	
	
	
}
