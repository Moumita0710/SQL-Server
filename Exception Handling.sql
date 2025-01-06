use moumita

---EXCEPTION HANDLING---
go
create procedure spDivideTwoNumber(
@Number1 int,
@Number2 int)
as
begin
 declare @result int 
 set @result=0
 set @result=@Number1/@Number2
 print 'Result is :'+cast(@result as varchar)
 print 'Remaining Procedure'
 end
 exec spDivideTwoNumber 100,0
 

 ---TRY-CATCH---
 go
 create procedure spDivideTwoNumbers(
@Number1 int,
@Number2 int)
as
begin
 declare @result int 
 set @result=0
 begin try
 set @result=@Number1/@Number2
 print 'Result is :'+cast(@result as varchar)
 print 'Remaining Procedure'
 end try
 begin catch
  print 'Second Number Should Not Be Zero'
  end catch
end
 exec spDivideTwoNumbers 100,0
 
 go
 create proc usp_divide(
 @a decimal,
 @b decimal,
 @c decimal output
 )as begin
 begin try
 set @c=@a/@b
 end try
 begin catch
 select 
   ERROR_NUMBER() AS ErrorNumber,
   ERROR_SEVERITY() AS ErrorSeverity,
   ERROR_STATE() AS ErrorState,
   ERROR_PROCEDURE() AS ErrorProcedure,
   ERROR_LINE() AS ErrorLine,
   ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END
GO 
declare @r decimal;
exec usp_divide 10,0,@r output
print @r
select * from emp1
begin try
 insert into emp1(empno,ename,deptno) values(5555,'Vijay',10);
end try
begin catch
 select ERROR_MESSAGE() AS [ErrorMessage],
        ERROR_LINE() AS ErrorLine,
        ERROR_NUMBER() AS [ErrorNumber],
		ERROR_SEVERITY() AS [ErrorSeverity],
		ERROR_STATE() AS [ErrorState]
end catch


-----Exception throug if-else-----
go
alter procedure spDivideTwoNumber(
@Number1 int,
@Number2 int)
as
begin
 declare @result int 
 set @result=0
 if (@Number2=0)
 Begin
  Raiserror('Second number cannot be zero',16,3)
 end
 else
 begin
 set @result=@Number1/@Number2
 print 'Result is :'+cast(@result as varchar)
 end
 end
 exec spDivideTwoNumber 100,0

 begin try
   insert into emp1(empno,ename)values(5555,'AAA');
 end try
begin catch
  select ERROR_NUMBER() as error_number
end catch

begin try
   insert into emp1(empno,ename)values(5555,'AAA');
 end try
begin catch
 if @@Error<>0
   print 'error'
 end catch
  




