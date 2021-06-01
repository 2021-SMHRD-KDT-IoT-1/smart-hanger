package Model;

public class ClothMemberDTO {
	
	private String email;
	private String pw;
	private String name;
	private String age;
	
	
	
	public ClothMemberDTO(String email, String pw, String name, String age) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.age = age;
	}
	
	public ClothMemberDTO(String email, String pw) {
		super();
		this.email = email;
		this.pw = pw;
		
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}
	
	
	
	
	
	
}
