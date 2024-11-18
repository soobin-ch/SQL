select * from Sales.Customer;

select COUNT(*) FROM Sales.Customer;

use sqlDB;

SELECT userID AS [사용자], SUM(price * amount) AS [총구매액] FROM buyTbl GROUP BY userID HAVING SUM(price * amount) >1000;
/*집계함수를 쓴 상태에서 where 절을 쓸 수 없음 전체 레코드에서만 특정 레코드 조회시에는 where 절 가능*/
/*having 은 그룹핑 한 값에 조건을 주고싶을 때 사용*/
SELECT userID AS [사용자], SUM(price * amount) AS [총구매액] FROM buyTbl GROUP BY userID HAVING SUM(price * amount) >1000 ORDER BY SUM(price* amount);

SELECT userID AS [사용자], SUM(price * amount) AS [총구매액] FROM buyTbl GROUP BY userID HAVING SUM(price * amount) >1000 ORDER BY [총구매액];
select groupName, sum(price * amount)  as [비용] from buyTbl group by groupName;

select groupName, SUM(price * amount) as [비용] from buyTbl group by rollup(groupName);
select groupName, SUM(price * amount) as [비용], GROUPING_ID(groupName) as [추가행여부] from buyTbl group by rollup(groupName);


select groupName, num,SUM(price * amount) as [비용], GROUPING_ID(groupName) as [추가행여부] from buyTbl group by rollup(groupName,num);

USE sqlDB;
create table cubeTbl (prodName NCHAR(3), color NCHAR(2), amount INT);

insert into cubeTbl values('컴퓨터', '검정', 11);
insert into cubeTbl values('컴퓨터', '검정', 22);
insert into cubeTbl values('모니터', '검정', 33);
insert into cubeTbl values('모니터', '파랑', 44);

select * from cubeTbl;

select prodName, color, SUM(amount) AS [수량합계] from cubeTbl group by cube (color,prodName);
select color, prodName, SUM(amount) AS [수량합계] from cubeTbl group by cube (prodName,color);


select userID, SUM(amount* price) as[총구매액] from buyTbl group by userID order by [총구매액] desc;

/*cte  이름: 임시테이블 이름*/
WITH [사용자별 총구매액]([사용자],[총구매액]) AS (SELECT userID, SUM(price * amount) from buyTbl Group by userID)

select * from [사용자별 총구매액] order by [총구매액] desc;

select addr, max(height) from userTbl group by addr;
WITH [지역별 최고키] (addr, maxHeight) AS (SELECT addr, MAX(height) FROM userTbl GROUP By addr)
SELECT AVG(maxHeight *1.0) AS [각 지역별 최고키의 평균] FROM [지역별 최고키];

WITH [사용자별 총구매액](userID, total) AS (SELECT userID, SUM(price* amount) from buyTbl group by userID),
[총구매금액](sumtotal) AS (select sum(total) from [사용자별 총구매액]),
[구매평균](sumavg) AS (SELECT  sumtotal / (SELECT  count(*)  FROM  buyTbl) FROM [총구매금액])
select * from [구매평균];

