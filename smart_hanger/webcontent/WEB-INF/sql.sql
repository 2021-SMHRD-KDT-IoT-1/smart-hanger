
drop table cody_board_comments;
drop table cody_board;
drop table my_clothes_img_path
drop table board_img_path
drop table Service
drop table member
drop table cody_clothes
drop table my_clothes
drop table cody_img_path
drop table cody_board_num
drop table cody
drop table board
drop table board_comments















-- 코디 게시판 댓글
CREATE TABLE cody_board_comments (
	comments_num   VARCHAR(255)   PRIMARY KEY,
   	userID   varchar2(200) NULL,
   	cody_board_num  varchar2(200) NULL,
  	comments   varchar2(200)   NULL,
 	upload_date   date   NULL
);


-- 코디 게시판
CREATE TABLE cody_board (
	cody_board_num varchar2(200)	NOT NULL PRIMARY KEY,
	userid	varchar2(200)	NOT NULL,
	title	varchar2(200)	NOT NULL,
	content	varchar2(200)	NOT NULL,
	upload_date	date	NOT NULL,
	like_num		varchar2(200)	NULL,
	view_num		varchar2(200)	NULL
);


-- 옷장 이미지
CREATE TABLE my_clothes_img_path (
	path_num varchar2(200)  NOT NULL PRIMARY KEY,
	my_clothes_num num  NOT NULL,
	clothesPath varchar2(200) NOT NULL
); 

-- 커뮤니티 게시글 이미지
CREATE TABLE board_img_path (
	path_num   varchar2(200)   NOT NULL PRIMARY KEY,
	board_num   varchar2(200)   NOT NULL,
	clothesPath   varchar2(200)   NOT NULL
); 

-- 고객센터
CREATE TABLE SERVICE (
	SERVICE_NUM 	varchar2(200)	 NOT NULL PRIMARY KEY,
	USERID	 varchar2(200)  NULL,
	TITLE	 varchar2(200)	 NULL,
	CONTENT	 varchar2(200) 	NULL,
	UPLOAD_DATE	 date 	NULL
);

-- 회원정보테이블
CREATE TABLE MEMBER (
	USERID 	 varchar2(200)	 NULL PRIMARY KEY,
	USERPW 	 varchar2(200)	 NULL,
	USERNAME	 varchar2(200)	 NULL,
	USERAGE	 varchar2(200)	 NULL
);

-- 코디 옷
CREATE TABLE cody_clothes (
	num varchar2(200) NOT NULL PRIMARY KEY,
	cody_num varchar2(200) NOT NULL,
	my_clothes_num varchar2(200) NOT NULL,
	userID varchar2(200) NOT NULL
);

-- 옷장
CREATE TABLE my_clothes (
	my_clothes_num varchar2(20) NOT NULL ,
	userID varchar2(200) NOT NULL ,
	clothesname varchar2(200) ,
	clothestype varchar2(200) ,
	upload_date date NOT NULL ,
	Memo varchar2(500) 
);

-- 코디 이미지
CREATE TABLE cody_img_path (
	path_num   varchar2(200)   NOT NULL PRIMARY KEY,
	cody_num   varchar2(200)   NOT NULL,
	clothesPath   varchar2(200)  NOT  NULL
);

-- 코디 게시판 이미지
CREATE TABLE cody_board_img_path(
	path_num   varchar2(200)   NOT NULL PRIMARY KEY,
	cody_num   varchar2(200)   NOT NULL,
	clothesPath   varchar2(200)  NOT  NULL
);

-- 코디
CREATE TABLE cody (
   cody_num   varchar2(200)   NOT NULL PRIMARY KEY,
   title   varchar2(200)   NOT NULL,
   content  varchar2(200)  NOT  NULL,
   kind   varchar2(200)  NOT  NULL
);

-- 커뮤니티 게시판
CREATE TABLE board (
	voard_num   varchar2(200) NOT NULL PRIMARY KEY,
	userid   varchar2(200) NOT NULL,
	title   varchar2(200)NOT NULL,
	content   varchar2(200) NOT NULL,
	upload_date   upload_date NOT NULL,
	like_num   varchar2(200) NOT NULL,
	view_num varchar2(200) NOT NULL
);


-- 커뮤니티 댓글
CREATE TABLE board_comments (
	comments_num  VARCHAR(255)  NOT NULL  PRIMARY KEY,
	userid   varchar2(200) NOT NULL,
	board_num   varchar2(200) NOT NOT NULL,
	content   varchar2(200) NOT NULL,
	upload_date   upload_date NOT  NULL
);

















-- 여기가 원본


-- 코디 게시판 댓글
CREATE TABLE cody_board_comments (
	comments_num   VARCHAR(255)   PRIMARY KEY,
   	userID   varchar2(200) NULL,
   	cody_board_num  varchar2(200) NULL,
  	comments   varchar2(200)   NULL,
 	upload_date   date   NULL,

	CONSTRAINT FK_member_TO_cody_board_comments _1 
	FOREIGN KEY (userid) REFERENCES member(userid)
);


-- 코디 게시판
CREATE TABLE cody_board (
	cody_board_num varchar2(200)	NOT NULL PRIMARY KEY,
	userid	varchar2(200)	NOT NULL,
	title	varchar2(200)	NOT NULL,
	content	varchar2(200)	NOT NULL,
	upload_date	date	NOT NULL,
	like_num		varchar2(200)	NULL,
	view_num		varchar2(200)	NULL,
	CONSTRAINT FK_member_TO_cody_board_1 
	FOREIGN KEY (userid) REFERENCES member(userid)
);




-- 옷장 이미지
CREATE TABLE my_clothes_img_path (
	path_num varchar2(200)  NOT NULL PRIMARY KEY,
	my_clothes_num num  NOT NULL,
	clothesPath varchar2(200) NOT NULL,

	CONSTRAINT FK_my_clothes_TO_my_clothes_img_path_1
	FOREIGN KEY (my_clothes_num) REFERENCES member(userid)
); 

-- 커뮤니티 게시글 이미지
CREATE TABLE board_img_path (
	path_num   varchar2(200)   NOT NULL PRIMARY KEY,
	board_num   varchar2(200)   NOT NULL,
	clothesPath   varchar2(200)   NOT NULL,

	CONSTRAINT FK_board_TO_board_img_path_1 
	FOREIGN KEY (board_num) REFERENCES member(userid)
); 

-- 고객센터
CREATE TABLE SERVICE (
	SERVICE_NUM 	varchar2(200)	 NOT NULL PRIMARY KEY,
	USERID	 varchar2(200)  NULL,
	TITLE	 varchar2(200)	 NULL,
	CONTENT	 varchar2(200) 	NULL,
	UPLOAD_DATE	 date 	NULL,

	CONSTRAINT FK_SERVICE_TO_USERID_1 
	FOREIGN KEY (USERID) REFERENCES member(USERID)
);

-- 회원정보테이블
CREATE TABLE MEMBER (
	USERID 	 varchar2(200)	 NULL PRIMARY KEY,
	USERPW 	 varchar2(200)	 NULL,
	USERNAME	 varchar2(200)	 NULL,
	USERAGE	 varchar2(200)	 NULL
);

-- 코디 옷
CREATE TABLE cody_clothes (
	num varchar2(200) NOT NULL PRIMARY KEY,
	cody_num varchar2(200) NOT NULL,
	my_clothes_num varchar2(200) NOT NULL,
	userID varchar2(200) NOT NULL,

	constraint cody_clothes_cody_num_fk foreign key(cody_num)
	references cody(cody_num),

	constraint cody_clothes_my_clothes_num_fk foreign key(my_clothes_num) 
	references my_clothes(my_clothes_num),

	constraint cody_clothes_userID_fk foreign key(userID) 
	references member(userID)
);

-- 옷장
CREATE TABLE my_clothes (
	my_clothes_num varchar2(20) NOT NULL ,
	userID varchar2(200) NOT NULL ,
	clothesname varchar2(200) ,
	clothestype varchar2(200) ,
	upload_date date NOT NULL ,
	Memo varchar2(500) , 
	
	constraint my_clothes_userID_fk foreign key(userid) 
	references member(userid)
);

-- 코디 이미지
CREATE TABLE cody_img_path (
	path_num   varchar2(200)   NOT NULL PRIMARY KEY,
	cody_num   varchar2(200)   NOT NULL,
	clothesPath   varchar2(200)  NOT  NULL,

	CONSTRAINT FK_cody_clothes_TO_cody_img_path 
	FOREIGN KEY (cody_num) REFERENCES cody_clothes(cody_num)
);

-- 코디 게시판 이미지
CREATE TABLE cody_board_img_path(
	path_num   varchar2(200)   NOT NULL PRIMARY KEY,
	cody_num   varchar2(200)   NOT NULL,
	clothesPath   varchar2(200)  NOT  NULL,

	CONSTRAINT FK_cody_board_TO_cody_board_img_path
	FOREIGN KEY (cody_board_num) REFERENCES cody_board(cody_board_num)
);

-- 코디
CREATE TABLE cody (
   cody_num   varchar2(200)   NOT NULL PRIMARY KEY,
   title   varchar2(200)   NOT NULL,
   content  varchar2(200)  NOT  NULL,
   kind   varchar2(200)  NOT  NULL
);

-- 커뮤니티 게시판
CREATE TABLE board (
	voard_num   varchar2(200) NOT NULL PRIMARY KEY,
	userid   varchar2(200) NOT NULL,
	title   varchar2(200)NOT NULL,
	content   varchar2(200) NOT NULL,
	upload_date   upload_date NOT NULL,
	like_num   varchar2(200) NOT NULL,
	view_num varchar2(200) NOT NULL,
   
	CONSTRAINT FK_member_TO_board
   	FOREIGN KEY (userid) REFERENCES member(userid) 
);


-- 커뮤니티 댓글
CREATE TABLE board_comments (
	comments_num  VARCHAR(255)  NOT NULL  PRIMARY KEY,
	userid   varchar2(200) NOT NULL,
	board_num   varchar2(200) NOT NOT NULL,
	content   varchar2(200) NOT NULL,
	upload_date   upload_date NOT  NULL ,

	CONSTRAINT FK_member_TO_board_comments 
	FOREIGN KEY (userid) REFERENCES member(userid) 

	CONSTRAINT FK_board_TO_board_comments 
	FOREIGN KEY (board_num) REFERENCES board(board_num)
);













create sequence num start with 1 increment by 1

create sequence num_cody_clothes
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;