   회원가입한 정보를 저장할 수 있는 'web_member'테이블을 만드시오.
   컬럼명 : email / pw / name / age
   
select * from member;

drop table member;

CREATE TABLE member (
	userID 	 varchar2(200)	 NULL PRIMARY KEY,
	userPW 	 varchar2(200)	 NULL,
	userNAME	 varchar2(200)	 NULL,
	userAGE	 varchar2(200)	 NULL
);

