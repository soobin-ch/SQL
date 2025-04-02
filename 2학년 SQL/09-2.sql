use sqlDB;

select * from userTbl;

exec sp_helpindex userTbl;

create index idx_userTbl_addr on userTbl (addr);

create unique index idx_userTbl_birthYear on userTbl (birthYear);

create unique index idx_userTbl_name on userTbl (name);

EXEC sp_helpindex userTbl


insert into userTbl values('GPS', '김범수', 183, '미국', NULL, NULL, 162, NULL);

create nonclustered index idx_userTbl_name_birthYear on userTbl (name, birthYear);

EXEC sp_helpindex userTbl

select * from userTbl where name= '윤종신' and birthYear = '1969';


select * from userTbl where name = '윤종신';

create nonclustered index idx_userTbl_mobile1 on userTbl (mobile1);

select * from userTbl where mobile1 = '011';

drop index userTbl.idx_userTbl_addr;
drop index useTbl.idx_userTbl_mobile1;
drop index userTbl.idx_userTbl_name;
drop index userTbl.idx_userTbl_name_birthYear;
drop INDEX userTbl.PK__userTbl__PK__userTbl__CB9A1CDFACCE42F6;
/*primary key 를 얼터해서 고쳐야하지만 그럴필요없음*/

use tempdb;

create database indexDB;
GO

use indexDB;


CREATE PROCEDURE usp_IndexInfo
	@tablename sysname
AS
SELECT @tablename AS '테이블이름',
	      I.name AS '인덱스이름',
	      I.type_desc AS '인덱스타입',
	      A.data_pages AS '페이지개수', -- 사용된 데이터 페이지수
	      A.data_pages * 8 AS '크기(KB)', -- 페이지를 KB(1page = 8KB)로 계산
	      P.rows AS '행개수'
FROM sys.indexes I				-- Go 설명서
	      INNER JOIN sys.partitions P			-- Go 설명서
		ON P.object_id = I.object_id 
      AND OBJECT_ID(@tablename) = I.object_id AND I.index_id = P.index_id
	      INNER JOIN sys.allocation_units A		-- Go 설명서
		ON A.container_id = P.hobt_id ;


select count(*) from AdventureWorks2014.Sales.Customer;

select top(19820)* into Cust from AdventureWorks2014.Sales.Customer order by newId();

select top(19820) * into Cust_C from AdventureWorks2014.Sales.Customer order by newId();

select top(19820) * INTO Cust_NC FROM 	AdventureWorks2014.Sales.Customer ORDER BY NEWID();

SELECT TOP(5)* FROM Cust;
SELECT TOP(5)* FROM Cust_C;
SELECT TOP(5)* FROM Cust_NC;

EXEC usp_IndexInfo Cust;
EXEC usp_IndexInfo Cust_C;
EXEC usp_IndexInfo Cust_NC;


create clustered index idx_cust_c on Cust_C (CustomerID);

create nonclustered index idx_cust_nc on Cust_NC (CustomerID);

select top(5) * from Cust;
select top(5) * from Cust_C;
select top(5) * from Cust_NC;


use indexDB;
EXEC usp_IndexInfo Cust;
EXEC usp_IndexInfo Cust_C;
EXEC usp_IndexInfo Cust_NC;




use indexDB;

select * from Cust where CustomerID = 100;
SELECT * FROM Cust_C WHERE CustomerID = 100;

SELECT * FROM Cust_NC WHERE CustomerID = 100;

SELECT * FROM Cust WHERE CustomerID < 100 ;
SELECT * FROM Cust_C WHERE CustomerID < 200;
SELECT * FROM Cust_C WHERE CustomerID < 40000;
SELECT * FROM Cust_C ;

SELECT * FROM Cust_NC WHERE CustomerID < 100 ;

SELECT * FROM Cust_NC WITH (INDEX(idx_cust_nc)) 
	     WHERE CustomerID < 100 ;

SELECT * FROM Cust_NC WHERE CustomerID < 50 ;


SELECT TOP(19820) * INTO Cust2_C
	FROM AdventureWorks2014.Sales.Customer ORDER BY NEWID();

SELECT TOP(19820) * INTO Cust2_NC
	FROM AdventureWorks2014.Sales.Customer ORDER BY NEWID();

CREATE CLUSTERED INDEX idx_cust2_c on Cust2_C (TerritoryID);

CREATE NONCLUSTERED INDEX idx_cust2_nc on Cust2_NC (TerritoryID);

SELECT * FROM Cust2_C WHERE TerritoryID = 2 ;

SELECT * FROM Cust2_NC WHERE TerritoryID = 2 ;
/*지역이 많지 않아서 데이터 상에*/

SELECT DISTINCT TerritoryID FROM Cust2_NC ;

SELECT * FROM Cust_C WHERE CustomerID * 1 = 100 ;

SELECT * FROM Cust_C WHERE CustomerID = 100 / 1 ;









