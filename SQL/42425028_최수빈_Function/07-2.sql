declare @myVar1 char(3) ;
set @myVar1 = '100';
select @myVar1+ '200';
select @myVar1 + 200;

select cast(@myVar1 as decimal(5,1)) + 200.0;
select cast(@myVar1 as int) + 200;

declare @myVar2 decimal(10,5);
set @myVar2 = 10.12345;

select cast(@myVar2 as nchar(11));


declare @myVar3 decimal(10,5);
set @myVar3 = 10.12345;

select cast(@myVar3 as int);

declare @myVar4 decimal(10,5);

set @myVar4 = 10.12345;
select cast(@myVar4 as decimal(10,2));


select @@langid;
select @@servername;
select @@servicename;
select @@servicename;
select @@spid as 'id', system_user as [ 로그인사용자], user as [사용자];

select @@version;

select sysdatetime(), getdate();

select dateadd(Day, 100, '2020/10/10');
select datediff(week, getdate(), '2022/10/22');
select datename(weekday, '2022/10/20');

select datepart(year, getdate());
select month('2022/10/20');
select datefromparts('2022','10','20');
select eomonth('2020/10/20');
select eomonth(getdate(),3);


select abs(-100);
select round(1234.5678,2), round(1234.5678,-2);
select rand();
select sqrt(10);
select power(3,2);

select ascii('A'), char(65);
select concat('sql','server', 2019)
select 'sql' + 'server' + '2019';
select unicode('가'), nchar(44032);
select charindex('Server', 'sql Server 2019');
select left('sql Server 2019',3);
select right('sql Server 2019',4);
select substring(N'대한민국화이팅',3,2);
select len('sql server 2019');


select lower('abcdEFGH'), upper('abcdEFGH');
select ltrim(' 공백앞뒤두개 '), rtrim(' 공백앞뒤두개 ');

select replace ('sql server 2019', 'Server', '서버');
select replicate ('sql',5);
select space(5);

select stuff('sql 서버 2019', 5,2, 'Server');
select format( getdate(), 'dd/mm/yyyy');


use sqldb;

select col_length('userTbl','name');
select db_id(N'AdventureWorks2022');
select db_name(5);
select object_id(N'sqlDB.dbo.userTbl');
select object_name(901578250);










