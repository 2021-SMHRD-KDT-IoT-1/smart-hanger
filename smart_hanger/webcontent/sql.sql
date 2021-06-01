   회원가입한 정보를 저장할 수 있는 'web_member'테이블을 만드시오.
   컬럼명 : email / pw / name / age
   
select * from cloth_member;

CREATE TABLE cloth_member (
	USERID 	 varchar2(200)	 NULL PRIMARY KEY,
	USERPW 	 varchar2(200)	 NULL,
	USERNAME	 varchar2(200)	 NULL,
	USERAGE	 varchar2(200)	 NULL
);

