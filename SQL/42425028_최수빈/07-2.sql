USE sqlDB;
SELECT AVG(amount) AS [��ձ��Ű���] 
    FROM buyTbl ;

SELECT AVG( CONVERT(FLOAT, amount) ) AS [��ձ��Ű���]   
    FROM buyTbl ;

SELECT AVG(TRY_CONVERT(FLOAT, amount)) AS [��ձ��Ű���] 
    FROM buyTbl ;


SELECT price, amount, 
       price/amount 
	  AS [�ܰ�/����] 
    FROM buyTbl ;

SELECT price, amount, 
       CAST(CAST(price AS FLOAT)/amount AS DECIMAL(10,2)) 
	  AS [�ܰ�/����] 
    FROM buyTbl 


SELECT PARSE('2020�� 10�� 23��' AS DATE) ;



/*ELECT PARSE('123.45' AS INT) ;*/

SELECT TRY_PARSE('123.45' AS INT) ;
