use tempDB;

create table isoTable
	(charData character(2),
	varcharData Character Varying(2),
	varbinaryData Binary Varying,
	decimalData Dec,
	floatData Double Precision,
	intData Integer,
	ncharData National Character(2),
	nvarcharData National Character Varying(2),
	rowversionData Timestamp);


EXEC sp_columns @table_name = 'isoTable';

create type myTypeName from nchar(10) NOT NULL


use tempDB;
create table uniTest(korName nvarchar(10));

go
insert into uniTest values(N'È«±æµ¿');
insert into uniTest values('È«±æµ¿');


create table person (
id int,
korName nchar(10),
engName char(20),
email char(30)
);


use sqlDB;
declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(5,2);
declare @myVar4 nchar(20);

set @myVar1 =5;
set @myVar2 =3;
set @myVar3 =4.25;
set @myVar4 = '°¡¼ö ÀÌ¸§=> ';

use sqlDB;

select @myVar1;
select  @myVar2 + @myVar3;
select @myVar4, Name from userTbl where height > 180;


use sqlDB;
declare @myVar5 int;
set @myVAR5 =3;
select top(@myVAR5) Name, height from userTbl order by height


