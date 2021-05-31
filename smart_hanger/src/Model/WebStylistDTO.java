package Model;

public class WebStylistDTO {

	private int num; //시퀀스
	private String cody_num; //코디코드
	private int my_clothes_num; // 옷 코드
	private String userid; // 유저아이디
	private String clothespath; //경로
	
	public WebStylistDTO(int num, String cody_num, int my_clothes_num, String userid, String clothespath) {
		this.num = num;
		this.cody_num = cody_num;
		this.my_clothes_num = my_clothes_num;
		this.userid = userid;
		this.clothespath = clothespath;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCody_num() {
		return cody_num;
	}

	public void setCody_num(String cody_num) {
		this.cody_num = cody_num;
	}

	public int getMy_clothes_num() {
		return my_clothes_num;
	}

	public void setMy_clothes_num(int my_clothes_num) {
		this.my_clothes_num = my_clothes_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getClothespath() {
		return clothespath;
	}

	public void setClothespath(String clothespath) {
		this.clothespath = clothespath;
	}
	
	
	
}
