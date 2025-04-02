USE sqlDB;
GO
CREATE PROCEDURE usp_users
AS
    SELECT * FROM userTbl;

EXEC usp_users;



use sqlDB;
go
create procedure ussp_users1
	@userName nvarchar(10)
as
	select * from userTbl where name = @userName;

EXEC ussp_users1 '������';




create procedure usp_users2
	@userBirth int,
	@userHeight int
as
	select * from userTbl where birthYear > @userBirth and height > @userHeight;


exec usp_users2 1970, 178;
exec usp_users2 @userHeight = 178, @userBirth =1970;


create procedure usp_users3
	@userBirth int = 1970,
	@userHeight int = 178
as
	select * from userTbl where birthYear > @userBirth and height > @userHeight;

exec usp_users3;
exec usp_users3 1970, 178;


create procedure usp_users4
	@txtValue nchar(10),
	@outValue int output
as
	insert into testTbls values(@txtValue);
	select @outValue = IDENT_CURRENT('testTbls');

create table testTbls (id int identity, txt nchar(10));


declare @myValue int;
exec usp_users4 '�׽�Ʈ��1', @myValue output;
print '���� �Էµ� ID �� ==>'+ CAST(@myValue as char(5));

create proc usp_ifElse
	@userNAme nvarchar(10)
as
	declare @bYear int
	select @bYear = birthYear from userTbl where name=@userName;
	if(@bYear >= 1980)
	begin
		print N'���� ������..';
	end
	else
	begin
		print N'���̰� �����ϳ׿�..';
	end

exec usp_ifElse '������';


CREATE PROC usp_case
    @userName nvarchar(10)
AS
  DECLARE @bYear INT
  DECLARE @tti NCHAR(3) -- ��
  SELECT @bYear = birthYear 
     FROM userTbl WHERE name = @userName;
  SET @tti =
    CASE
      WHEN (@bYear%12 = 0) THEN '������'
      WHEN (@bYear%12 = 1) THEN '��'
      WHEN (@bYear%12 = 2) THEN '��'
      WHEN (@bYear%12 = 3) THEN '����'
      WHEN (@bYear%12 = 4) THEN '��'
      WHEN (@bYear%12 = 5) THEN '��'
	  WHEN (@bYear%12 = 6) THEN 'ȣ����'
      WHEN (@bYear%12 = 7) THEN '�䳢'
      WHEN (@bYear%12 = 8) THEN '��'
      WHEN (@bYear%12 = 9) THEN '��'
      WHEN (@bYear%12 = 10) THEN '��'
      ELSE '��'
	  END;
   PRINT @userName + '�� ��==> ' 
        + @tti;

	EXEC usp_case '���ð�';


use sqlDB;
alter table userTbl
	add grade nvarchar(5);

select * from userTbl;

CREATE PROCEDURE usp_while
AS
   DECLARE userCur CURSOR FOR -- Ŀ�� ����
      SELECT U.userid, sum(price * amount)
         FROM buyTbl B
            RIGHT OUTER JOIN userTbl U
            ON B.userid = U.userid
         GROUP BY U.userid, U.name
   OPEN userCur -- Ŀ�� ����
   DECLARE @id NVARCHAR(10) -- ����� ���̵�
   DECLARE @sum BIGINT -- �� ���ž�
   DECLARE @userGrade NCHAR(5) -- �� ��� 
	FETCH NEXT FROM userCur INTO @id, @sum WHILE (@@FETCH_STATUS=0) -- ���� ���� ������ �ݺ�
	BEGIN
	  SET @userGrade =
	  CASE
		 WHEN (@sum >= 1500) THEN N'�ֿ����'
		 WHEN (@sum >= 1000) THEN N'�����'
		 WHEN (@sum >= 1 ) THEN N'�Ϲݰ�'
		 ELSE N'���ɰ�'
	  END
	  UPDATE userTbl SET grade = 
		  @userGrade WHERE userID = @id
	  FETCH NEXT FROM userCur INTO @id, @sum
	END
	CLOSE userCur -- Ŀ�� �ݱ�
	DEALLOCATE userCur

SELECT * FROM userTbl;
EXEC usp_while;
SELECT * FROM userTbl;


CREATE PROC usp_return
    @userName nvarchar(10)
AS
    DECLARE @userID char(8);
    SELECT @userID = userID FROM userTbl WHERE name = @userName;
    IF (@userID <>  '')
        RETURN 0; -- ������ ���, �׳� RETURN�� �ᵵ 0�� ������
    ELSE
        RETURN -1; -- ������ ���(��, �ش� �̸��� ID�� ���� ���)

declare @retVal int;
exec @retVal = usp_return '������';
select @retVal;

declare @retVal int;
exec @retVal = usp_return '������';
select @retVal;


CREATE PROC usp_error
    @userid char(8),
    @name nvarchar(10),
    @birthYear INT = 1900,
    @addr nchar(2) = N'����',
    @mobile1 char(3) = NULL,
    @mobile2 char(8) = NULL,
    @height smallInt = 170,
    @mdate date = '2013-11-11'
AS
    DECLARE @err INT;
    INSERT INTO 
       userTbl(userID, name, birthYear,addr,mobile1,mobile2,height,
    mDate)    
VALUES (@userid,@name,@birthYear,
        @addr,@mobile1,@mobile2,
        @height,@mDate);
SELECT @err = @@ERROR;
IF @err != 0
BEGIN
  PRINT '###' + @name + 
  '��(��) INSERT�� �����߽��ϴ�. ### '
END;
RETURN @err; -- ������ȣ�� ������

  
  DECLARE @errNum INT;
EXEC @errNum = usp_error 'WDT', N'�����';
IF (@errNum != 0)
    SELECT @errNum;


select * from userTbl;


CREATE PROC usp_tryCatch
    @userid char(8),
    @name nvarchar(10),
    @birthYear INT = 1900,
    @addr nchar(2) = N'����',
    @mobile1 char(3) = NULL,
    @mobile2 char(8) = NULL,
    @height smallInt = 170,
    @mdate date = '2013-11-11'
AS
BEGIN TRY
INSERT INTO      
   userTbl(userID,name,birthYear,
            addr,mobile1,mobile2,
            height,mDate)
      VALUES(@userid,@name,
        @birthYear,@addr,@mobile1,
        @mobile2,@height,@mDate);
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()
    SELECT ERROR_MESSAGE()
END CATCH

EXEC usp_tryCatch 'SYJ', N'�տ���' ;
