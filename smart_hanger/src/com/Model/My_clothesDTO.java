package com.Model;

public class My_clothesDTO {
	private String my_clothes_num;
	private String userId;
	private String clothesName;
	private String clothesType;
	private String upload_date;
	private String memo;
	private String clothespath;
	
	
	
	
	public My_clothesDTO(String my_clothes_num, String userId, String clothesName, String clothesType, String upload_date, String memo, String clothespath) {
		super();
		this.my_clothes_num = my_clothes_num;
		this.userId = userId;
		this.clothesName = clothesName;
		this.clothesType = clothesType;
		this.upload_date = upload_date;
		this.memo = memo;
		this.clothespath = clothespath;
	}
	
	
	
	

	public My_clothesDTO(String my_clothes_num, String clothesName, String memo, String clothespath) {
		super();
		this.my_clothes_num = my_clothes_num;
		this.clothesName = clothesName;
		this.memo = memo;
		this.clothespath = clothespath;
	}





	public My_clothesDTO(String clothesName, String memo, String clothespath) {
		super();
		this.clothesName = clothesName;
		this.memo = memo;
		this.clothespath = clothespath;
	}



	public String getMy_clothes_num() {
		return my_clothes_num;
	}

	public void setMy_clothes_num(String my_clothes_num) {
		this.my_clothes_num = my_clothes_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClothesName() {
		return clothesName;
	}

	public void setClothesName(String clothesName) {
		this.clothesName = clothesName;
	}

	public String getClothesType() {
		return clothesType;
	}

	public void setClothesType(String clothesType) {
		this.clothesType = clothesType;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getClothespath() {
		return clothespath;
	}

	public void setClothespath(String clothespath) {
		this.clothespath = clothespath;
	}
	
	
	
	
	

}
