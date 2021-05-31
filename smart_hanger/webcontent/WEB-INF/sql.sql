
drop table my_clothes;
drop table cody_clothes;
--이거는 옷 등록 
create table my_clothes (
num number,                  --시퀀스
my_clothes_num varchar2(200),--옷 코드 
userid varchar2(200),        --유저아이디
clothesname varchar2(200),   --옷이름
clothestype varchar2(200),   --옷종류
day2 date,                   --옷등록날짜
memo varchar2(500)           --메모
)
--옷들록 테이블 생성후 확인 하시오
select * from my_clothes
--이거는 옷등록  시퀀스 생성
create sequence num_clothes
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--시퀀스가 잘들어가는지 테스트
insert into my_clothes values(num_clothes.nextval, 'test',  'test', 'test', 'test', sysdate, 'test')


--이거는 코디 옷 테이블 
create table cody_clothes ( 
num number,                    --시퀀스
cody_num varchar2(200),        --코디코드
my_clothes_num varchar2(200),  --옷코드
userid varchar2(200)           --유저아이디
)
--테이블 생성후 확인하시오
select * from CODY_CLOTHES 
--이거는 옷코디  시퀀스 생성
create sequence num_cody_clothes
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--시퀀스가 잘들어가는지 테스트
insert into CODY_CLOTHES values(num_cody_clothes.nextval, 'text', 'text', 'text' )
--이거는 옷장이미지
create table my_clothes_img_path ( 
num number,  
path_num varchar2(200),
my_clothes_num varchar2(200),        
clothespath varchar2(200)           
)
--옷장 이미지 조회
select * from my_clothes_img_path
--이거는 옷장이미지 시퀀스 생성
create sequence num_my_clothes_img_path
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--시퀀스가 잘들어가는지 테스트
insert into my_clothes_img_path values(num_my_clothes_img_path.nextval, 'text', 'text', 'text' )
--이거는 코디 이미지 테이블
create table cody_img_path ( 
num number,  
path_num varchar2(200),
cody_num varchar2(200),        
clothespath varchar2(200)           
)
--코디 이미지 테이블 조회
select * from cody_img_path
--이거는 코디이미지 시퀀스 생성
create sequence num_cody_img_path
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--시퀀스가 잘들어가는지 테스트
insert into cody_img_path values(num_cody_img_path.nextval, 'text', 'text', 'text' )

--여기는 코디 테이블
create table cody ( 
num number,  
cody_num varchar2(200),
title varchar2(200),        
content varchar2(200),
kind varchar2(200)
)
--코디 조회
select * from cody
--이거는 코디 시퀀스 생성
create sequence num_cody
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--시퀀스가 잘들어가는지 테스트
insert into cody values(num_cody.nextval, 'text', 'text', 'text', 'text' )




create sequence num start with 1 increment by 1










