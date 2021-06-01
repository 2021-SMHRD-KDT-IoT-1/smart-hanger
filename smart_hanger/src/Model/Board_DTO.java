package Model;

public class Board_DTO {


	private String board_num; //커뮤니티 게시글 코드
	private String userid;         //유저아이디
	private String title;          //제목
	private String content;        //게시판 내용
	private String upload_date;    //게시글등록날짜
	private String like_num;       //좋아요
	private String view_num;       //조회수
	private String clothespath;    //사진경로
	
	public Board_DTO(String board_num, String userid, String title, String content, String upload_date, String like_num, String view_num, String clothespath) {
		this.board_num = board_num;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.upload_date = upload_date;
		this.like_num = like_num;
		this.view_num = view_num;
		this.clothespath = clothespath;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getLike_num() {
		return like_num;
	}

	public void setLike_num(String like_num) {
		this.like_num = like_num;
	}

	public String getView_num() {
		return view_num;
	}

	public void setView_num(String view_num) {
		this.view_num = view_num;
	}

	public String getClothespath() {
		return clothespath;
	}

	public void setClothespath(String clothespath) {
		this.clothespath = clothespath;
	}
	
	
	
	
}
