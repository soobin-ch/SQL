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
/*���������� ������ �Ͼ�� �ʾ���*/


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
INSERT INTO userTbl VALUES('LSG', '�̽±�', 1987, '����');
INSERT INTO userTbl VALUES('KBS', '�����', 1979, '�泲');
INSERT INTO userTbl VALUES('KKH', '���ȣ', 1971, '����');
INSERT INTO userTbl VALUES('JYP', '������', 1950, '���');
INSERT INTO userTbl VALUES('SSK', '���ð�', 1979, '����');
GO

SELECT * FROM userTbl;
 

 USE tempdb;
CREATE TABLE clusterTbl
(	userID char(8) NOT NULL ,
	name nvarchar(10) NOT NULL
);
GO
INSERT INTO clusterTbl VALUES('LSG', '�̽±�');
INSERT INTO clusterTbl VALUES('KBS', '�����');
INSERT INTO clusterTbl VALUES('KKH', '���ȣ');
INSERT INTO clusterTbl VALUES('JYP', '������');
INSERT INTO clusterTbl VALUES('SSK', '���ð�');
INSERT INTO clusterTbl VALUES('LJB', '�����');
INSERT INTO clusterTbl VALUES('YJS', '������');
INSERT INTO clusterTbl VALUES('EJW', '������');
INSERT INTO clusterTbl VALUES('JKW', '������');
INSERT INTO clusterTbl VALUES('BBK', '�ٺ�Ŵ'); -- 10 Record ����
SELECT * FROM clusterTbl;

alter table clusterTbl add constraint PK_clusterTbl_userID primary key(userID);

select * from clusterTbl;

INSERT INTO clusterTbl VALUES('FNT', 'Ǫ��Ÿ');
INSERT INTO clusterTbl VALUES('KAI', 'ī����');


USE tempdb;
CREATE TABLE nonclusterTbl
(	userID char(8) NOT NULL ,
	name nvarchar(10) NOT NULL
);
GO
INSERT INTO nonclusterTbl VALUES('LSG', '�̽±�');
INSERT INTO nonclusterTbl VALUES('KBS', '�����');
INSERT INTO nonclusterTbl VALUES('KKH', '���ȣ');
INSERT INTO nonclusterTbl VALUES('JYP', '������');
INSERT INTO nonclusterTbl VALUES('SSK', '���ð�');
INSERT INTO nonclusterTbl VALUES('LJB', '�����');
INSERT INTO nonclusterTbl VALUES('YJS', '������');
INSERT INTO nonclusterTbl VALUES('EJW', '������');
INSERT INTO nonclusterTbl VALUES('JKW', '������');
INSERT INTO nonclusterTbl VALUES('BBK', '�ٺ�Ŵ');

ALTER TABLE nonclusterTbl
ADD CONSTRAINT UK_nonclusterTbl_userID
	UNIQUE (userID);
SELECT * FROM nonclusterTbl;

INSERT INTO nonclusterTbl VALUES('FNT', 'Ǫ��Ÿ');
INSERT INTO nonclusterTbl VALUES('KAI', 'ī����');


USE tempdb;
CREATE TABLE mixedTbl
(    userID char(8) NOT NULL ,
	    name nvarchar(10) NOT NULL,
	    addr nchar(2)
);
GO


INSERT INTO mixedTbl VALUES('LSG', '�̽±�', '����');
INSERT INTO mixedTbl VALUES('KBS', '�����', '�泲');
INSERT INTO mixedTbl VALUES('KKH', '���ȣ', '����');
INSERT INTO mixedTbl VALUES('JYP', '������', '���');
INSERT INTO mixedTbl VALUES('SSK', '���ð�', '����');
INSERT INTO mixedTbl VALUES('LJB', '�����', '����');
INSERT INTO mixedTbl VALUES('YJS', '������', '�泲');
INSERT INTO mixedTbl VALUES('EJW', '������', '���');
INSERT INTO mixedTbl VALUES('JKW', '������', '���');
INSERT INTO mixedTbl VALUES('BBK', '�ٺ�Ŵ', '����');

ALTER TABLE mixedTbl
		ADD CONSTRAINT PK_mixedTbl_userID
			PRIMARY KEY (userID);

ALTER TABLE mixedTbl
		ADD CONSTRAINT UK_mixedTbl_name
			UNIQUE (name) ;

EXEC sp_helpindex mixedTbl;


select addr from mixedTbl where name ='�����';

SELECT * FROM mixedTbl WHERE userId = 'LJB';


SELECT * FROM mixedTbl;
