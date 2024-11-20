use sqlDB;
select name, addr, height as [Ű], height - (lead(height, 1, 0)
over (order by height desc)) as [���� ����� Ű ����]
from userTbl;

use sqlDB;
select name, addr, height as [Ű], height - (lag (height, 1, 0)
over (order by height desc)) as [�� ����� Ű ����]
from userTbl;

select addr, name, height as [Ű], height - ( FIRST_VALUE(height)
over (partition by addr order by height desc)) as [������ ���� ū Ű�� ����]
from userTbl;

select addr, name, height as [Ű],
(cume_dist() over (partition by addr order by height desc)) * 100 as [�����ο� �����%]
from userTbl;

select distinct addr, PERCENTILE_CONT(0.5) within group (order by height)
over (partition by addr) as [������ Ű�� �߾Ӱ�]
from userTbl;

USE tempdb;
CREATE TABLE pivotTest
	(uName  NCHAR(3),
	 season NCHAR(2),
	 amount INT );
INSERT INTO pivotTest VALUES
	('�����' , '�ܿ�', 10) , ('������' , '����', 15) ,
	('�����' , '����', 25) , ('�����' , '��', 3) ,
	('�����' , '��', 37) ,   ('������' , '�ܿ�', 40) ,
	('�����' , '����', 14) , ('�����' , '�ܿ�', 22) ,
	('������' , '����', 64) ;

SELECT * FROM pivotTest;

select * from pivotTest pivot ( sum(amount) for season in ([��], [����], [����], [�ܿ�]))
as resultPivot;

use sqlDB;
select * from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;

use sqlDB
select * from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID
where buyTbl.userID = 'JYP';