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

EXEC ussp_users1 '조관우';




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
exec usp_users4 '테스트값1', @myValue output;
print '현재 입력된 ID 값 ==>'+ CAST(@myValue as char(5));

create proc usp_ifElse
	@userNAme nvarchar(10)
as
	declare @bYear int
	select @bYear = birthYear from userTbl where name=@userName;
	if(@bYear >= 1980)
	begin
		print N'아직 젊군요..';
	end
	else
	begin
		print N'나이가 지긋하네요..';
	end

exec usp_ifElse '조용필';


CREATE PROC usp_case
    @userName nvarchar(10)
AS
  DECLARE @bYear INT
  DECLARE @tti NCHAR(3) -- 띠
  SELECT @bYear = birthYear 
     FROM userTbl WHERE name = @userName;
  SET @tti =
    CASE
      WHEN (@bYear%12 = 0) THEN '원숭이'
      WHEN (@bYear%12 = 1) THEN '닭'
      WHEN (@bYear%12 = 2) THEN '개'
      WHEN (@bYear%12 = 3) THEN '돼지'
      WHEN (@bYear%12 = 4) THEN '쥐'
      WHEN (@bYear%12 = 5) THEN '소'
	  WHEN (@bYear%12 = 6) THEN '호랑이'
      WHEN (@bYear%12 = 7) THEN '토끼'
      WHEN (@bYear%12 = 8) THEN '용'
      WHEN (@bYear%12 = 9) THEN '뱀'
      WHEN (@bYear%12 = 10) THEN '말'
      ELSE '양'
	  END;
   PRINT @userName + '의 띠==> ' 
        + @tti;

	EXEC usp_case '성시경';


use sqlDB;
alter table userTbl
	add grade nvarchar(5);

select * from userTbl;

CREATE PROCEDURE usp_while
AS
   DECLARE userCur CURSOR FOR -- 커서 선언
      SELECT U.userid, sum(price * amount)
         FROM buyTbl B
            RIGHT OUTER JOIN userTbl U
            ON B.userid = U.userid
         GROUP BY U.userid, U.name
   OPEN userCur -- 커서 열기
   DECLARE @id NVARCHAR(10) -- 사용자 아이디
   DECLARE @sum BIGINT -- 총 구매액
   DECLARE @userGrade NCHAR(5) -- 고객 등급 
	FETCH NEXT FROM userCur INTO @id, @sum WHILE (@@FETCH_STATUS=0) -- 행이 없을 때까지 반복
	BEGIN
	  SET @userGrade =
	  CASE
		 WHEN (@sum >= 1500) THEN N'최우수고객'
		 WHEN (@sum >= 1000) THEN N'우수고객'
		 WHEN (@sum >= 1 ) THEN N'일반고객'
		 ELSE N'유령고객'
	  END
	  UPDATE userTbl SET grade = 
		  @userGrade WHERE userID = @id
	  FETCH NEXT FROM userCur INTO @id, @sum
	END
	CLOSE userCur -- 커서 닫기
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
        RETURN 0; -- 성공일 경우, 그냥 RETURN만 써도 0을 돌려줌
    ELSE
        RETURN -1; -- 실패일 경우(즉, 해당 이름의 ID가 없을 경우)

declare @retVal int;
exec @retVal = usp_return '은지원';
select @retVal;

declare @retVal int;
exec @retVal = usp_return '나몰라';
select @retVal;


CREATE PROC usp_error
    @userid char(8),
    @name nvarchar(10),
    @birthYear INT = 1900,
    @addr nchar(2) = N'서울',
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
  '을(를) INSERT에 실패했습니다. ### '
END;
RETURN @err; -- 오류번호를 돌려줌

  
  DECLARE @errNum INT;
EXEC @errNum = usp_error 'WDT', N'우당탕';
IF (@errNum != 0)
    SELECT @errNum;


select * from userTbl;


CREATE PROC usp_tryCatch
    @userid char(8),
    @name nvarchar(10),
    @birthYear INT = 1900,
    @addr nchar(2) = N'서울',
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

EXEC usp_tryCatch 'SYJ', N'손연재' ;
