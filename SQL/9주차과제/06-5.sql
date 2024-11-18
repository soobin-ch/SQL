use tempdb
create table testTbl6(id int, Fname nvarchar(50), Lname nvarchar(50));
insert into testTbl6 select BusinessEntityID, FirstName, LastName from AdventureWorks2022.Person.Person;

select *from testTbl6;

select BusinessEntityID, FirstName, LastName into testTbl7 from AdventureWorks2022.Person.Person;
select * from testTbl7;

use tempDB;
select * from testTbl6 where Fname = 'Kim';

update testTbl7 set LastName = '없음'
select * from testTbl7

update testTbl6 set Lname = '없음' where Fname = 'Kim';
select * from testTbl6 where Fname = 'Kim';

use sqlDB;
select * from buyTbl;

use sqlDB;
update buyTbl set price = price * 1.5;
select * from buyTbl

update buyTbl set price = price / 1.5;
select * from buyTbl


use tempdb
delete testTbl7;
select * from testTbl7

delete testTbl6 where Fname = 'Kim';
select * from testTbl6 where Fname = 'Kim'


use tempdb;
select * into bigTbl1 from AdventureWorks2022.Sales.SalesOrderDetail;
select * into bigTbl2 from AdventureWorks2022.Sales.SalesOrderDetail;
select * into bigTbl3 from AdventureWorks2022.Sales.SalesOrderDetail;

delete from bigTbl1;
truncate table bigTbl2;
drop table bigTbl3;