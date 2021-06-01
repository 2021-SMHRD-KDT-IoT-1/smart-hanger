package com.Model;

public class My_clothesDTO {
	private String my_clothes_num;
	private String userId;
	private String clothesName;
	private String clothesType;
	private String upload_date;
	private String memo;
	
	public My_clothesDTO(String my_clothes_num, String userId, String clothesName, String clothesType,
			String upload_date, String memo) {
		super();
		this.my_clothes_num = my_clothes_num;
		this.userId = userId;
		this.clothesName = clothesName;
		this.clothesType = clothesType;
		this.upload_date = upload_date;
		this.memo = memo;
	}
	
	public String getMy_clothes_num() {
		return my_clothes_num;
	}
	public String getUserId() {
		return userId;
	}
	public String getClothesName() {
		return clothesName;
	}
	public String getClothesType() {
		return clothesType;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public String getMemo() {
		return memo;
	}
	
	
	

}
