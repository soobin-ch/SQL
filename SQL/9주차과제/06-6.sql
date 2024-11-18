use sqlDB;
select userID, name, addr into memberTBL from userTbl;
select * from memberTBL

create table changeTBL (changeType NCHAR(4), userID char(4), name nvarchar(10), addr nchar(2));
insert into changeTBL values
('신규가입', 'TBN', '티파니', '미국'),
('주소변경', 'LSG', null, '제주'),
('주소변경', 'LJB' , null, '영국'),
('회원탈퇴', 'BBK', null, null),
('회원탈퇴', 'SSK', null, null);
select * from changeTBL;


merge memberTBL as M
using changeTBL as C
on M.userID = C.userID
when not matched and changeType = '신규가입' then
insert (userID, name, addr) values (C.userID, C.name, C.addr)
when matched and changeType = '주소변경' then
update set M.addr = C.addr
when matched and changeType = '회원탈퇴' then
delete;

select * from memberTBL