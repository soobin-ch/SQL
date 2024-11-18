USE sqlDB;
SELECT AVG(amount) AS [평균구매개수] 
    FROM buyTbl ;

SELECT AVG( CONVERT(FLOAT, amount) ) AS [평균구매개수]   
    FROM buyTbl ;

SELECT AVG(TRY_CONVERT(FLOAT, amount)) AS [평균구매개수] 
    FROM buyTbl ;


SELECT price, amount, 
       price/amount 
	  AS [단가/수량] 
    FROM buyTbl ;

SELECT price, amount, 
       CAST(CAST(price AS FLOAT)/amount AS DECIMAL(10,2)) 
	  AS [단가/수량] 
    FROM buyTbl 


SELECT PARSE('2020년 10월 23일' AS DATE) ;



/*ELECT PARSE('123.45' AS INT) ;*/

SELECT TRY_PARSE('123.45' AS INT) ;
