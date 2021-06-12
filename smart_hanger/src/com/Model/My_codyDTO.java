package com.Model;

public class My_codyDTO {
	private String my_cody_num;
	private String userID;
	private String clothesname;
	private String Memo;
	private String clothespath;
	
	public My_codyDTO(String my_cody_num, String userID, String clothesname, String memo, String clothespath) {
		super();
		this.my_cody_num = my_cody_num;
		this.userID = userID;
		this.clothesname = clothesname;
		Memo = memo;
		this.clothespath = clothespath;
	}

	
	
	
	public My_codyDTO(String userID, String clothesname, String memo, String clothespath) {
		super();
		this.userID = userID;
		this.clothesname = clothesname;
		Memo = memo;
		this.clothespath = clothespath;
	}




	public String getMy_cody_num() {
		return my_cody_num;
	}

	public String getUserID() {
		return userID;
	}

	public String getClothesname() {
		return clothesname;
	}

	public String getMemo() {
		return Memo;
	}

	public String getClothespath() {
		return clothespath;
	}

	
}
