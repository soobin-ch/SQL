--ERROR
select userID, name, prodName, addr, mobile1 + mobile2 as [����ó]
from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;
--ERROR

select buyTbl.userID, name, prodName, addr, mobile1 + mobile2 as [����ó]
from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;

select buyTbl.userID, userTbl.name, buyTbl.prodName, userTbl.addr, userTbl.mobile1 + userTbl.mobile2 as [����ó]
from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;

select B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from buyTbl as B inner join userTbl as U
on B.userID = U.userID;

select B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from buyTbl B inner join userTbl U
on B.userID = U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from userTbl U inner join buyTbl B
on U.userID = B.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from userTbl U inner join buyTbl B
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from userTbl U inner join buyTbl B
on U.userID = B.userID
where B.userID = 'JYP';

select U.userID, U.name, U.addr
from userTbl U inner join buyTbl B
on U.userID = B.userID
order by U.userID;

select distinct U.userID, U.name, U.addr
from userTbl U inner join buyTbl B
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, U.addr
from userTbl U
where exists (select * from buyTbl B
where U.userID = B.userID);

USE sqlDB;
CREATE TABLE stdTbl
    (stdName nvarchar(10) NOT NULL PRIMARY KEY,
     addr nchar(4) NOT NULL
    );

CREATE TABLE clubTbl
    (clubName nvarchar(10) NOT NULL PRIMARY KEY,
     roomNo nchar(4) NOT NULL
    );

CREATE TABLE stdclubTbl
    (num int IDENTITY NOT NULL PRIMARY KEY,
     stdName nvarchar(10) NOT NULL
	 FOREIGN KEY REFERENCES stdTbl(stdName),
     clubName nvarchar(10) NOT NULL
	FOREIGN KEY REFERENCES clubTbl(clubName),
);

INSERT INTO stdTbl VALUES ('�����','�泲'), ('���ð�','����'), ('������','���'), ('������','���'),('�ٺ�Ŵ','����');
INSERT INTO clubTbl VALUES ('����','101ȣ'), ('�ٵ�','102ȣ'), ('�౸','103ȣ'), ('����','104ȣ');
INSERT INTO stdclubTbl VALUES ('�����','�ٵ�'), ('�����','�౸'), ('������','�౸'), ('������','�౸'), ('������','����'), ('�ٺ�Ŵ','����');
GO

select S.stdName, S.addr, C.clubName, C.roomNo
from stdTbl S inner join stdclubTbl SC
on S.stdName = SC.stdName
inner join clubTbl C
on SC.clubName = C.clubName
order by S.stdName;

select C.clubName, C.roomNo, S.stdName, S.addr
from stdTbl S inner join stdclubTbl SC
on SC.stdName = S.stdName
inner join clubTbl C
on SC.clubName = C.clubName
order by C.clubName

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from userTbl U left outer join buyTbl B
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from buyTbl B right outer join userTbl U
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [����ó]
from userTbl U left outer join buyTbl B
on U.userID = B.userID
where B.prodName is null
order by U.userID;

use sqlDB;
select S.stdName, S.addr, C.clubName, C.roomNo
from stdTbl S left outer join stdclubTbl SC
on S.stdName = SC.stdName
left outer join clubTbl C
on SC.clubName = C.clubName
order by S.stdName

select C.clubName, C.roomNo, S.stdName, S.addr
from stdTbl S left outer join stdclubTbl SC
on SC.stdName = S.stdName
right outer join clubTbl C
on SC.clubName = C.clubName
order by C.clubName;

select S.stdName, S.addr, C.clubName, C.roomNo
from stdTbl S full outer join stdclubTbl SC
on S.stdName = SC.stdName
full outer join clubTbl C
on SC.clubName = C.clubName
order by S.stdName;