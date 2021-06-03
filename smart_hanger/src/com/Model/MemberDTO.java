package com.Model;

public class MemberDTO {

	private String userId;
	private String userPw;
	private String userName;
	private String userAge;

	public MemberDTO(String userId, String userPw, String userName, String userAge) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAge = userAge;
	}
	
	
	

	public MemberDTO(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}




	public String getUserId() {
		return userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserAge() {
		return userAge;
	}

}
