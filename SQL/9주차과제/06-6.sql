use sqlDB;
select userID, name, addr into memberTBL from userTbl;
select * from memberTBL

create table changeTBL (changeType NCHAR(4), userID char(4), name nvarchar(10), addr nchar(2));
insert into changeTBL values
('�ű԰���', 'TBN', 'Ƽ�Ĵ�', '�̱�'),
('�ּҺ���', 'LSG', null, '����'),
('�ּҺ���', 'LJB' , null, '����'),
('ȸ��Ż��', 'BBK', null, null),
('ȸ��Ż��', 'SSK', null, null);
select * from changeTBL;


merge memberTBL as M
using changeTBL as C
on M.userID = C.userID
when not matched and changeType = '�ű԰���' then
insert (userID, name, addr) values (C.userID, C.name, C.addr)
when matched and changeType = '�ּҺ���' then
update set M.addr = C.addr
when matched and changeType = 'ȸ��Ż��' then
delete;

select * from memberTBL