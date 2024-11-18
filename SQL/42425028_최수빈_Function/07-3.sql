USE tempDB;
CREATE TABLE maxTbl (col1 VARCHAR(MAX),
			   col2 NVARCHAR(MAX));
INSERT INTO maxTbl 
	    VALUES( REPLICATE('A',1000000), REPLICATE('가',1000000));

SELECT LEN(col1) AS [VARCHAR(MAX)], LEN(col2)AS [NVARCHAR(MAX)]
	FROM maxTbl;

DELETE FROM maxTbl;

INSERT INTO maxTbl VALUES(
		  REPLICATE( CAST('A' AS VARCHAR(MAX)), 1000000 ),
		  REPLICATE( CONVERT(NVARCHAR(MAX) , '가'), 1000000) ) ;

SELECT LEN(col1) AS [VARCHAR(MAX)], LEN(col2)AS [NVARCHAR(MAX)]
	FROM maxTbl;


UPDATE maxTbl 
	SET col1 = REPLACE( (SELECT col1 FROM maxTbl),'A', 'B'),
	    col2 = REPLACE( (SELECT col2 FROM maxTbl),'가', '나') ;

SELECT REVERSE((SELECT col1 FROM maxTbl)) ;
SELECT SUBSTRING((SELECT col2 FROM maxTbl),999991, 10) ;

UPDATE maxTbl SET
	col1 = STUFF( (SELECT col1 FROM maxTbl),
			999991, 10, REPLICATE('C', 10)),
	col2 = STUFF( (SELECT col2 FROM maxTbl),
			999991, 10, REPLICATE('다',10)) ;

SELECT REVERSE((SELECT col1 FROM maxTbl)) ;
SELECT REVERSE((SELECT col2 FROM maxTbl)) ;


UPDATE maxTbl 
   SET col1.WRITE('DDDDD',999996, 5), 
	   col2.WRITE('라라라라라',999996, 5) ;

SELECT REVERSE((SELECT col1 FROM maxTbl)) ;
SELECT REVERSE((SELECT col2 FROM maxTbl)) ;


use sqlDB;

select row_number() over(order by height desc, name asc) as [키큰순위], name ,addr, height from userTbl;

SELECT addr, 
	   ROW_NUMBER( ) 
		OVER(PARTITION BY addr 
			ORDER BY height DESC, name ASC) 
				AS [지역별키큰순위], 
	   name, height
	FROM userTbl ;


select rank() over(order by height desc) as [키큰순위], name, addr,height from userTbl;

select dense_rank() over(order by height desc) as [키큰순위], name, addr, height from userTbl;

select ntile(2) over(order by height desc) as [반번호], name, addr, height from userTbl;

SELECT NTILE(2) OVER(ORDER BY height DESC) AS [반번호], 
	   name, addr, height
	 FROM userTbl ;
