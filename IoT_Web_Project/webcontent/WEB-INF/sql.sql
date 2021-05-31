
drop table my_clothes;

create table my_clothes (
num number,
clothesname varchar2(200), 
clothesPath varchar2(200), 
username varchar2(200), 
clothestype varchar2(200), 
day2 date
)

-- ½ÃÄö½º »ý¼º
create sequence num_clothes
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle; 


create sequence num start with 1 increment by 1

select * from my_clothes

insert into my_clothes values(num_clothes.nextval, 'test', 'test', 'test', sysdate)







