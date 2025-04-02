
use sqlDB;

create view v_userTbl as select userid, name,addr from userTbl;

select * from v_userTbl;

USE sqlDB;
GO
CREATE VIEW v_userbuyTbl
AS
  SELECT U.userid AS [USER ID], U.name AS [USER NAME], 
         B.prodName AS [PRODUCT NAME],U.addr, 
         U.mobile1 + U.mobile2 AS [MOBILE PHONE]
	  FROM userTbl U INNER JOIN buyTbl B
		ON U.userid = B.userid;
GO


SELECT [USER ID],[USER NAME] FROM v_userbuyTbl;


ALTER VIEW v_userbuyTbl
AS
  SELECT U.userid AS [사용자 아이디], U.name AS [이름],  	   
         B.prodName AS [제품 이름], U.addr, 
         U.mobile1 + U.mobile2 AS [전화 번호]
	FROM userTbl U INNER JOIN buyTbl B
		ON U.userid = B.userid ;
GO

SELECT [이름],[전화 번호] FROM v_userbuyTbl;
DROP VIEW v_userbuyTbl;


SELECT * FROM sys.sql_modules ;
SELECT OBJECT_NAME(object_id) AS [뷰 이름], definition
    FROM sys.sql_modules ;

ALTER VIEW v_userTbl
    WITH ENCRYPTION
AS
    SELECT userid, name, addr FROM userTbl ;

SELECT OBJECT_NAME(object_id) AS [뷰 이름], definition
    FROM sys.sql_modules ;

SELECT * FROM v_userTbl WHERE userid='BBK';

UPDATE v_userTbl SET addr = N'부산' WHERE userid='BBK';
SELECT * FROM v_userTbl WHERE userid='BBK';
SELECT * FROM userTbl WHERE userid='BBK';

INSERT INTO v_userTbl(userid, name, addr) 
          VALUES('KBM','김병만','충북');


CREATE VIEW v_height177
AS SELECT * FROM userTbl WHERE height >= 177;

SELECT * FROM v_height177;

DELETE v_height177 WHERE height < 177;  

INSERT INTO v_height177 
          VALUES('KBM', '김병만', 1977 , '경기', '010', 
                 '5555555', 158, '2020-10-10') ;


SELECT * FROM v_height177 ;


select * from userTbl;


ALTER VIEW v_height177
AS
    SELECT * FROM userTbl WHERE height >= 177
    	WITH CHECK OPTION ;


INSERT INTO v_height177 
          VALUES('WDT', '우당탕', 2006 , '서울', '010', 
                 '3333333', 155, '2014-3-3');


EXEC sp_depends userTbl;
