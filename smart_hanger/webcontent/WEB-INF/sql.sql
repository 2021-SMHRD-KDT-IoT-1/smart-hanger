
drop table my_clothes;

--�̰Ŵ� �� ��� 
create table my_clothes (
num number,
clothesname varchar2(200), 
clothesPath varchar2(200), 
username varchar2(200), 
clothestype varchar2(200), 
day2 date
)
--�ʵ�� ���̺� ������ Ȯ�� �Ͻÿ�
select * from my_clothes
--�̰Ŵ� �ʵ��  ������ ����
create sequence num_clothes
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--�������� �ߵ����� �׽�Ʈ
insert into my_clothes values(num_clothes.nextval, 'test', 'test', 'test', sysdate)


--�̰Ŵ� �ڵ� �� ���̺� 
create table cody_clothes (
num number,
cody_num varchar2(200),
my_clothes_num varchar2(200), 
userid varchar2(200),
clothespath varchar2(200)
)
--���̺� ������ Ȯ���Ͻÿ�
select * from CODY_CLOTHES 
--�̰Ŵ� ���ڵ�  ������ ����
create sequence num_cody_clothes
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--�������� �ߵ����� �׽�Ʈ
insert into CODY_CLOTHES values(num_cody_clothes.nextval, 'text', 'text', 'text', 'text' )

 


create sequence num start with 1 increment by 1










