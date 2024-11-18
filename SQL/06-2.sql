EXECUTE sp_helpdb;

EXEC sp_helpdb;

USE sqlDB;

EXEC sp_tables;

EXEC sp_tables @TABLE_TYPE = "'TABlE'";
EXEC sp_tables @TABLE_TYPE= "'VIEW'";

--sp_helpdb: 저장되어있는 디비목록

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

select * from userTbl where name = '바비킴';

select userID, name from userTbl where birthYear >= 1970 AND height >=182

select userID, name from userTbl where  birthYear >=1970 or height >=182;

select name, height from userTbl where height >=180 and height<=183;
select name, height from userTbl where height between 180 and 183;


select name, addr from userTbl where addr = '경남' or addr = '전남' or addr = '경북';
select name, addr from userTbl where addr in ('경남', '전남', '경북');

select name, height from userTbl where name like '김%';
select name, height from userTbl where name like '_종신';

select name,height from userTbl where height > (select height from userTbl where name = '김경호');
select name, height from userTbl where height >= (select height from userTbl where addr = '경남');
select name, height from userTbl where height >= any(select height from userTbl where addr = '경남');
select name, height from userTbl where height >= all(select height from userTbl where addr = '경남');
select name, height from userTbl where height in(select height from userTbl where addr = '경남');