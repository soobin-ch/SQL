use sqlDB;
select name, addr, height as [키], height - (lead(height, 1, 0)
over (order by height desc)) as [다음 사람과 키 차이]
from userTbl;

use sqlDB;
select name, addr, height as [키], height - (lag (height, 1, 0)
over (order by height desc)) as [앞 사람과 키 차이]
from userTbl;

select addr, name, height as [키], height - ( FIRST_VALUE(height)
over (partition by addr order by height desc)) as [지역별 가장 큰 키와 차이]
from userTbl;

select addr, name, height as [키],
(cume_dist() over (partition by addr order by height desc)) * 100 as [누적인원 백분율%]
from userTbl;

select distinct addr, PERCENTILE_CONT(0.5) within group (order by height)
over (partition by addr) as [지역별 키의 중앙값]
from userTbl;

USE tempdb;
CREATE TABLE pivotTest
	(uName  NCHAR(3),
	 season NCHAR(2),
	 amount INT );
INSERT INTO pivotTest VALUES
	('김범수' , '겨울', 10) , ('윤종신' , '여름', 15) ,
	('김범수' , '가을', 25) , ('김범수' , '봄', 3) ,
	('김범수' , '봄', 37) ,   ('윤종신' , '겨울', 40) ,
	('김범수' , '여름', 14) , ('김범수' , '겨울', 22) ,
	('윤종신' , '여름', 64) ;

SELECT * FROM pivotTest;

select * from pivotTest pivot ( sum(amount) for season in ([봄], [여름], [가을], [겨울]))
as resultPivot;

use sqlDB;
select * from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;

use sqlDB
select * from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID
where buyTbl.userID = 'JYP';