package Model;

public class WebClothesDTO {
	private int num; // ������ �ѹ�
	private String my_clothes_num; // ���ڵ�
	private String userid; //�������̵�
	private String clothesname; //���̸�
	private String username; // ����� �̸�
	private String clothestype; // ������
	private String day2; // ��¥
	private String memo; // �޸�
	
	public WebClothesDTO(int num, String my_clothes_num, String userid, String clothesname, String username, String clothestype, String day2, String memo) {
		
		this.num = num;
		this.my_clothes_num = my_clothes_num;
		this.userid = userid;
		this.clothesname = clothesname;
		this.username = username;
		this.clothestype = clothestype;
		this.day2 = day2;
		this.memo = memo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMy_clothes_num() {
		return my_clothes_num;
	}

	public void setMy_clothes_num(String my_clothes_num) {
		this.my_clothes_num = my_clothes_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getClothesname() {
		return clothesname;
	}

	public void setClothesname(String clothesname) {
		this.clothesname = clothesname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getClothestype() {
		return clothestype;
	}

	public void setClothestype(String clothestype) {
		this.clothestype = clothestype;
	}

	public String getDay2() {
		return day2;
	}

	public void setDay2(String day2) {
		this.day2 = day2;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	
	
	

}
