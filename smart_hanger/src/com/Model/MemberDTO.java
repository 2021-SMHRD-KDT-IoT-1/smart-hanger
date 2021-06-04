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




	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
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
