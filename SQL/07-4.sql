--ERROR
select userID, name, prodName, addr, mobile1 + mobile2 as [연락처]
from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;
--ERROR

select buyTbl.userID, name, prodName, addr, mobile1 + mobile2 as [연락처]
from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;

select buyTbl.userID, userTbl.name, buyTbl.prodName, userTbl.addr, userTbl.mobile1 + userTbl.mobile2 as [연락처]
from buyTbl inner join userTbl
on buyTbl.userID = userTbl.userID;

select B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
from buyTbl as B inner join userTbl as U
on B.userID = U.userID;

select B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
from buyTbl B inner join userTbl U
on B.userID = U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
from userTbl U inner join buyTbl B
on U.userID = B.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
from userTbl U inner join buyTbl B
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
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

INSERT INTO stdTbl VALUES ('김범수','경남'), ('성시경','서울'), ('조용필','경기'), ('은지원','경북'),('바비킴','서울');
INSERT INTO clubTbl VALUES ('수영','101호'), ('바둑','102호'), ('축구','103호'), ('봉사','104호');
INSERT INTO stdclubTbl VALUES ('김범수','바둑'), ('김범수','축구'), ('조용필','축구'), ('은지원','축구'), ('은지원','봉사'), ('바비킴','봉사');
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

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
from userTbl U left outer join buyTbl B
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
from buyTbl B right outer join userTbl U
on U.userID = B.userID
order by U.userID;

select U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 as [연락처]
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