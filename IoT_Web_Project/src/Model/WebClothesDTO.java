package Model;

public class WebClothesDTO {
	private int num; // ������ �ѹ�
	private String clothesname; // ���̸�
	private String clothesPath; // �� ���� ���
	private String username; // ����� �̸�
	private String clothestype; // ������
	private String day2; // ��¥
	
	
	
	
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
