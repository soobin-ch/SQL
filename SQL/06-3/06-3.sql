select name,mDate from userTbl order by mDate desc;
select name, mDate from userTbl order by mDate desc;
select name, height from userTbl order by height desc, name asc;

select addr from userTbl;
select addr from userTbl order by addr;
select distinct addr from userTbl;

select * from AdventureWorks2022.Sales.CreditCard;
use AdventureWorks2022;
select CreditCardId from Sales.CreditCard where CardType = 'Vista' ORDER BY ExpYear, ExpMonth;
select top(10) CreditCardId from Sales.CreditCard where CardType = 'Vista' ORDER BY ExpYear, ExpMonth;

select count(*)/100 from Sales.CreditCard;

select top(0.1) percent with ties CreditCardID, ExpYear, Expmonth from Sales.CreditCard where CardType = 'Vista' order by ExpYear, Expmonth;

select * from Sales.SalesOrderDetail tableSample(5 percent)

select *into tempdb.dbo.test from Sales.SalesOrderDetail tablesample(5 percent);

select * from tempdb.dbo.test;


use sqlDB;

select * into buyTbl2 FROM buyTbl;

select * from buyTbl2;

select userID, ProName into buyTbl3 from buyTbl;
select * from buyTbl3;

select userID, name, birthYear From userTBL ORDER BY birthYear offset 4 rows;

select userID, name, birthYear From userTBL ORDER BY birthYear offset 4 rows fetch next 3 rows only;

select userID, amount from buyTbl ORDER BY userID;

select userID, SUM(amount) FROM buyTbl GROUP BY userID;

select userID AS [사용자아이디], SUM(amount) AS [총구매개수] FROM buyTbl GROUP BY userID;

select userID, price * amount AS [구매액] FROM buyTbl ORDER BY userID;


select userID AS [사용자아이디], SUM(price * amount) AS [총구매액] FROM buyTbl GROUP BY userId;

select AVG(amount) AS [평균구매개수] FROM buyTbl;

select AVG(amount *1.0) AS [평균구매개수] FROM buyTbl;


select userID, AVG(amount *1.0) AS [평균구매개수]  FROM buyTbl GROUP BY userID ORDER BY  [평균구매개수] DESC;


SELECT name, MAX(height), MIN(height) FROM userTbl GROUP BY name;

select userid, MAX(amount) from buyTbl GROUP BY userid;

select MAX(height), MIN(height) FROM userTbl;

select COUNT(*) FROM userTbl;

select COUNT(mobile1) AS [휴대폰이 있는 사용자 수]  from userTbl;

