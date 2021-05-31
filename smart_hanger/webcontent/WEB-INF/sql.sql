
drop table my_clothes;
drop table cody_clothes;
--�̰Ŵ� �� ��� 
create table my_clothes (
num number,                  --������
my_clothes_num varchar2(200),--�� �ڵ� 
userid varchar2(200),        --�������̵�
clothesname varchar2(200),   --���̸�
clothestype varchar2(200),   --������
day2 date,                   --�ʵ�ϳ�¥
memo varchar2(500)           --�޸�
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
insert into my_clothes values(num_clothes.nextval, 'test',  'test', 'test', 'test', sysdate, 'test')


--�̰Ŵ� �ڵ� �� ���̺� 
create table cody_clothes ( 
num number,                    --������
cody_num varchar2(200),        --�ڵ��ڵ�
my_clothes_num varchar2(200),  --���ڵ�
userid varchar2(200)           --�������̵�
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
insert into CODY_CLOTHES values(num_cody_clothes.nextval, 'text', 'text', 'text' )
--�̰Ŵ� �����̹���
create table my_clothes_img_path ( 
num number,  
path_num varchar2(200),
my_clothes_num varchar2(200),        
clothespath varchar2(200)           
)
--���� �̹��� ��ȸ
select * from my_clothes_img_path
--�̰Ŵ� �����̹��� ������ ����
create sequence num_my_clothes_img_path
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--�������� �ߵ����� �׽�Ʈ
insert into my_clothes_img_path values(num_my_clothes_img_path.nextval, 'text', 'text', 'text' )
--�̰Ŵ� �ڵ� �̹��� ���̺�
create table cody_img_path ( 
num number,  
path_num varchar2(200),
cody_num varchar2(200),        
clothespath varchar2(200)           
)
--�ڵ� �̹��� ���̺� ��ȸ
select * from cody_img_path
--�̰Ŵ� �ڵ��̹��� ������ ����
create sequence num_cody_img_path
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--�������� �ߵ����� �׽�Ʈ
insert into cody_img_path values(num_cody_img_path.nextval, 'text', 'text', 'text' )

--����� �ڵ� ���̺�
create table cody ( 
num number,  
cody_num varchar2(200),
title varchar2(200),        
content varchar2(200),
kind varchar2(200)
)
--�ڵ� ��ȸ
select * from cody
--�̰Ŵ� �ڵ� ������ ����
create sequence num_cody
increment by 1 
start with 1 
minvalue 1 
maxvalue 100 
nocycle;
--�������� �ߵ����� �׽�Ʈ
insert into cody values(num_cody.nextval, 'text', 'text', 'text', 'text' )




create sequence num start with 1 increment by 1










