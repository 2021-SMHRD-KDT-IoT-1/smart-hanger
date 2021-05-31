package Model;

public class WebClothesDTO {
	private int num; // 시퀀스 넘버
	private String clothesname; // 옷이름
	private String clothesPath; // 옷 사진 경로
	private String username; // 사용자 이름
	private String clothestype; // 옷종류
	private String day2; // 날짜
	
	
	
	
	public WebClothesDTO(int num, String clothesname, String clothesPath, String username, String clothestype,
			String day2) {
		super();
		this.num = num;
		this.clothesname = clothesname;
		this.clothesPath = clothesPath;
		this.username = username;
		this.clothestype = clothestype;
		this.day2 = day2;
	}
	
	
	
	
	public int getNum() {
		return num;
	}
	public String getClothesname() {
		return clothesname;
	}
	public String getClothesPath() {
		return clothesPath;
	}
	public String getUsername() {
		return username;
	}
	public String getClothestype() {
		return clothestype;
	}
	public String getDay2() {
		return day2;
	}

}
