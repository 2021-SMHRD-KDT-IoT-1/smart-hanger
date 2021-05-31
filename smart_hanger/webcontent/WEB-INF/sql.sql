
drop table my_clothes;

--이거는 옷 등록 
create table my_clothes (
num number,
clothesname varchar2(200), 
clothesPath varchar2(200), 
username varchar2(200), 
clothestype varchar2(200), 
day2 date
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
insert into my_clothes values(num_clothes.nextval, 'test', 'test', 'test', sysdate)


--이거는 코디 옷 테이블 
create table cody_clothes (
num number,
cody_num varchar2(200),
my_clothes_num varchar2(200), 
userid varchar2(200),
clothespath varchar2(200)
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
insert into CODY_CLOTHES values(num_cody_clothes.nextval, 'text', 'text', 'text', 'text' )

 


create sequence num start with 1 increment by 1










