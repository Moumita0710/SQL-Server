use moumita;

----creating procedure------
create procedure mypro
as 
begin
select * from dept1;
select ename,job,sal,deptno from emp1 where sal in(select max(sal) from emp1 group by deptno)
end
exec mypro
-----alter procedure-----
alter procedure mypro (@dno as int)
as 
begin
select * from dept1 where deptno=@dno;
select ename,job,sal,deptno from emp1 where sal in(select max(sal) from emp1 group by deptno)and deptno=@dno
end
exec mypro 20
----declare varibale using @----
declare @deptno as int
set @deptno=20
exec mypro @deptno;
-----create procedure square----
create procedure square(@no as int)
as 
begin
declare @ans as int
set @ans=@no*@no;
select 'square of', @no,'is',@ans
end
exec square 34

---Assignment----

----1) create a procedure to display all records where emp name starts with 'A'
create procedure empA
as 
begin
select * from emp1 where ename like 'A%'
end
exec empA

----2) create a procedure with 2 input parameters to find the addition and subtraction
create procedure subnadd(@num1 as int , @num2 as int)
as 
begin
declare @add as int, @sub as int
set @add=@num1+@num2;
set @sub=@num1-@num2;
select 'addition of', @num1,@num2'is',@add
select 'subtraction of', @num1,@num2'is',@sub
end
exec subnadd 21,12

----create procedure to display all the records of employee table where minimum and maximum sal is entered by user----
--create procedure minmax(@min as int, @max as int)--
create procedure maxmin(@deptno int)
as 
begin
select * from emp1
--select * from emp1 where sal>=@min and sal<=@max;--
  select min(sal),max(sal) from emp1 where deptno=@deptno;
end
exec minmax 10
----create procedure to find department wise sum of sal where department no is enterd by user
create procedure deptusers(@dno as int)
as 
begin
select * from dept1;
select deptno=@dno,sum(sal) from emp1
end
exec deptusers 10

-----Procedure with output parameter----
create procedure totalsal(@deptno int , @total int output)
as
begin
select @total=sum(sal) from emp1 group by(deptno) having deptno=@deptno
end
declare @T int;
exec totalsal 20,@T output
select @T

create procedure maxmin(@deptno int, @min int output,@max int output)
as begin
select @min=min(sal),@max=max(sal) from emp1 where deptno=@deptno;
end
declare @min int, @max int
exec maxmin 10,@min output,@max output
select @min,@max
---Assignment----
----Enter 2 no as input and display addition as output

create procedure addition(@num1 int,@num2 int, @add int output)
as begin
set @add=@num1+@num2;
--select 'addition of', @num1,'and',@num2'is',@add--
end
declare @add int
exec addition 5,6, @add output
select @add

--if-else--
create procedure eligible(@age int, @result varchar(30) output)
as begin
if(@age>=18)
  select @result='Eligible fro voting'
else
  select @result='Not Eligible for voting'
end
declare @res varchar(30)
exec eligible 10,@res output
select @res

create procedure insertEmp(@deptno int)
as begin
declare @C int;
select @C=count(*) from emp1 where deptno=@deptno
if(@C<5)
  insert into emp1(empno,ename,deptno)values(33214,'Jagruti',@deptno)
else
  select 'count not less than 5'
end
exec insertEmp 20

