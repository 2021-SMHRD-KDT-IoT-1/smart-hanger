   ȸ�������� ������ ������ �� �ִ� 'web_member'���̺��� ����ÿ�.
   �÷��� : email / pw / name / age
   
select * from member;

drop table member;

CREATE TABLE member (
	userID 	 varchar2(200)	 NULL PRIMARY KEY,
	userPW 	 varchar2(200)	 NULL,
	userNAME	 varchar2(200)	 NULL,
	userAGE	 varchar2(200)	 NULL
);

