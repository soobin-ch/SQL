EXECUTE sp_helpdb;

EXEC sp_helpdb;

USE sqlDB;

EXEC sp_tables;

EXEC sp_tables @TABLE_TYPE = "'TABlE'";
EXEC sp_tables @TABLE_TYPE= "'VIEW'";

--sp_helpdb: ����Ǿ��ִ� �����

EXEC sp_columns @table_name = 'userTbl';

EXEC sp_columns @table_name = 'userTbl',
				@table_owner = 'dbo';


use sqlDB;

select * from userTbl;
select * from dbo.userTbl;
select * from sqlDB.dbo.userTbl;
select * from [DESKTOP-LEMH9PJ\SQLEXPRESS].sqlDB.dbo.userTbl;
select * from [DESKTOP-LEMH9PJ\SQLEXPRESS].[sqlDB].[dbo].[userTbl];



select userID,name from userTbl;
select name, userID, addr from userTbl;

select name, mobile1, mobile2 from userTbl;

select userID, amount from buyTbl;

select * from userTbl where name = '�ٺ�Ŵ';

select userID, name from userTbl where birthYear >= 1970 AND height >=182

select userID, name from userTbl where  birthYear >=1970 or height >=182;

select name, height from userTbl where height >=180 and height<=183;
select name, height from userTbl where height between 180 and 183;


select name, addr from userTbl where addr = '�泲' or addr = '����' or addr = '���';
select name, addr from userTbl where addr in ('�泲', '����', '���');

select name, height from userTbl where name like '��%';
select name, height from userTbl where name like '_����';

select name,height from userTbl where height > (select height from userTbl where name = '���ȣ');
select name, height from userTbl where height >= (select height from userTbl where addr = '�泲');
select name, height from userTbl where height >= any(select height from userTbl where addr = '�泲');
select name, height from userTbl where height >= all(select height from userTbl where addr = '�泲');
select name, height from userTbl where height in(select height from userTbl where addr = '�泲');