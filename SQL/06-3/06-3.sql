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

select userID AS [����ھ��̵�], SUM(amount) AS [�ѱ��Ű���] FROM buyTbl GROUP BY userID;

select userID, price * amount AS [���ž�] FROM buyTbl ORDER BY userID;


select userID AS [����ھ��̵�], SUM(price * amount) AS [�ѱ��ž�] FROM buyTbl GROUP BY userId;

select AVG(amount) AS [��ձ��Ű���] FROM buyTbl;

select AVG(amount *1.0) AS [��ձ��Ű���] FROM buyTbl;


select userID, AVG(amount *1.0) AS [��ձ��Ű���]  FROM buyTbl GROUP BY userID ORDER BY  [��ձ��Ű���] DESC;


SELECT name, MAX(height), MIN(height) FROM userTbl GROUP BY name;

select userid, MAX(amount) from buyTbl GROUP BY userid;

select MAX(height), MIN(height) FROM userTbl;

select COUNT(*) FROM userTbl;

select COUNT(mobile1) AS [�޴����� �ִ� ����� ��]  from userTbl;

