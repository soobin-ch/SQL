select * from Sales.Customer;

select COUNT(*) FROM Sales.Customer;

use sqlDB;

SELECT userID AS [�����], SUM(price * amount) AS [�ѱ��ž�] FROM buyTbl GROUP BY userID HAVING SUM(price * amount) >1000;
/*�����Լ��� �� ���¿��� where ���� �� �� ���� ��ü ���ڵ忡���� Ư�� ���ڵ� ��ȸ�ÿ��� where �� ����*/
/*having �� �׷��� �� ���� ������ �ְ���� �� ���*/
SELECT userID AS [�����], SUM(price * amount) AS [�ѱ��ž�] FROM buyTbl GROUP BY userID HAVING SUM(price * amount) >1000 ORDER BY SUM(price* amount);

SELECT userID AS [�����], SUM(price * amount) AS [�ѱ��ž�] FROM buyTbl GROUP BY userID HAVING SUM(price * amount) >1000 ORDER BY [�ѱ��ž�];
select groupName, sum(price * amount)  as [���] from buyTbl group by groupName;

select groupName, SUM(price * amount) as [���] from buyTbl group by rollup(groupName);
select groupName, SUM(price * amount) as [���], GROUPING_ID(groupName) as [�߰��࿩��] from buyTbl group by rollup(groupName);


select groupName, num,SUM(price * amount) as [���], GROUPING_ID(groupName) as [�߰��࿩��] from buyTbl group by rollup(groupName,num);

USE sqlDB;
create table cubeTbl (prodName NCHAR(3), color NCHAR(2), amount INT);

insert into cubeTbl values('��ǻ��', '����', 11);
insert into cubeTbl values('��ǻ��', '����', 22);
insert into cubeTbl values('�����', '����', 33);
insert into cubeTbl values('�����', '�Ķ�', 44);

select * from cubeTbl;

select prodName, color, SUM(amount) AS [�����հ�] from cubeTbl group by cube (color,prodName);
select color, prodName, SUM(amount) AS [�����հ�] from cubeTbl group by cube (prodName,color);


select userID, SUM(amount* price) as[�ѱ��ž�] from buyTbl group by userID order by [�ѱ��ž�] desc;

/*cte  �̸�: �ӽ����̺� �̸�*/
WITH [����ں� �ѱ��ž�]([�����],[�ѱ��ž�]) AS (SELECT userID, SUM(price * amount) from buyTbl Group by userID)

select * from [����ں� �ѱ��ž�] order by [�ѱ��ž�] desc;

select addr, max(height) from userTbl group by addr;
WITH [������ �ְ�Ű] (addr, maxHeight) AS (SELECT addr, MAX(height) FROM userTbl GROUP By addr)
SELECT AVG(maxHeight *1.0) AS [�� ������ �ְ�Ű�� ���] FROM [������ �ְ�Ű];

WITH [����ں� �ѱ��ž�](userID, total) AS (SELECT userID, SUM(price* amount) from buyTbl group by userID),
[�ѱ��űݾ�](sumtotal) AS (select sum(total) from [����ں� �ѱ��ž�]),
[�������](sumavg) AS (SELECT  sumtotal / (SELECT  count(*)  FROM  buyTbl) FROM [�ѱ��űݾ�])
select * from [�������];

