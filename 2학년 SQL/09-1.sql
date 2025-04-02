use tempdb;
create table tbl1
(
a int primary key,
b int,
c int
);

exec sp_helpindex tbl1;


CREATE TABLE tbl2
(	a INT PRIMARY KEY,
	b INT UNIQUE,
	c INT UNIQUE,
	d INT
);

EXEC sp_helpindex tbl2;


create table tbl3 (
a int primary key nonclustered,
b int unique,
c int unique,
d int
);

EXEC sp_helpindex tbl3;
/*내부적으로 정렬이 일어나지 않았음*/


CREATE TABLE tbl4
(	a INT PRIMARY KEY NONCLUSTERED,
	b INT UNIQUE CLUSTERED,
	c INT UNIQUE,
	d INT
);

EXEC sp_helpindex tbl4;


CREATE TABLE tbl5
(	a INT PRIMARY KEY,
	b INT UNIQUE CLUSTERED,
	c INT UNIQUE CLUSTERED,    -- Error
	d INT
);


USE tempdb;
CREATE TABLE userTbl
(	userID char(8) NOT NULL PRIMARY KEY,
	name nvarchar(10) NOT NULL,
	birthYear int NOT NULL,
	addr nchar(2) NOT NULL
);
INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울');
GO

SELECT * FROM userTbl;
 

 USE tempdb;
CREATE TABLE clusterTbl
(	userID char(8) NOT NULL ,
	name nvarchar(10) NOT NULL
);
GO
INSERT INTO clusterTbl VALUES('LSG', '이승기');
INSERT INTO clusterTbl VALUES('KBS', '김범수');
INSERT INTO clusterTbl VALUES('KKH', '김경호');
INSERT INTO clusterTbl VALUES('JYP', '조용필');
INSERT INTO clusterTbl VALUES('SSK', '성시경');
INSERT INTO clusterTbl VALUES('LJB', '임재범');
INSERT INTO clusterTbl VALUES('YJS', '윤종신');
INSERT INTO clusterTbl VALUES('EJW', '은지원');
INSERT INTO clusterTbl VALUES('JKW', '조관우');
INSERT INTO clusterTbl VALUES('BBK', '바비킴'); -- 10 Record 삽입
SELECT * FROM clusterTbl;

alter table clusterTbl add constraint PK_clusterTbl_userID primary key(userID);

select * from clusterTbl;

INSERT INTO clusterTbl VALUES('FNT', '푸니타');
INSERT INTO clusterTbl VALUES('KAI', '카아이');


USE tempdb;
CREATE TABLE nonclusterTbl
(	userID char(8) NOT NULL ,
	name nvarchar(10) NOT NULL
);
GO
INSERT INTO nonclusterTbl VALUES('LSG', '이승기');
INSERT INTO nonclusterTbl VALUES('KBS', '김범수');
INSERT INTO nonclusterTbl VALUES('KKH', '김경호');
INSERT INTO nonclusterTbl VALUES('JYP', '조용필');
INSERT INTO nonclusterTbl VALUES('SSK', '성시경');
INSERT INTO nonclusterTbl VALUES('LJB', '임재범');
INSERT INTO nonclusterTbl VALUES('YJS', '윤종신');
INSERT INTO nonclusterTbl VALUES('EJW', '은지원');
INSERT INTO nonclusterTbl VALUES('JKW', '조관우');
INSERT INTO nonclusterTbl VALUES('BBK', '바비킴');

ALTER TABLE nonclusterTbl
ADD CONSTRAINT UK_nonclusterTbl_userID
	UNIQUE (userID);
SELECT * FROM nonclusterTbl;

INSERT INTO nonclusterTbl VALUES('FNT', '푸니타');
INSERT INTO nonclusterTbl VALUES('KAI', '카아이');


USE tempdb;
CREATE TABLE mixedTbl
(    userID char(8) NOT NULL ,
	    name nvarchar(10) NOT NULL,
	    addr nchar(2)
);
GO


INSERT INTO mixedTbl VALUES('LSG', '이승기', '서울');
INSERT INTO mixedTbl VALUES('KBS', '김범수', '경남');
INSERT INTO mixedTbl VALUES('KKH', '김경호', '전남');
INSERT INTO mixedTbl VALUES('JYP', '조용필', '경기');
INSERT INTO mixedTbl VALUES('SSK', '성시경', '서울');
INSERT INTO mixedTbl VALUES('LJB', '임재범', '서울');
INSERT INTO mixedTbl VALUES('YJS', '윤종신', '경남');
INSERT INTO mixedTbl VALUES('EJW', '은지원', '경북');
INSERT INTO mixedTbl VALUES('JKW', '조관우', '경기');
INSERT INTO mixedTbl VALUES('BBK', '바비킴', '서울');

ALTER TABLE mixedTbl
		ADD CONSTRAINT PK_mixedTbl_userID
			PRIMARY KEY (userID);

ALTER TABLE mixedTbl
		ADD CONSTRAINT UK_mixedTbl_name
			UNIQUE (name) ;

EXEC sp_helpindex mixedTbl;


select addr from mixedTbl where name ='임재범';

SELECT * FROM mixedTbl WHERE userId = 'LJB';


SELECT * FROM mixedTbl;
