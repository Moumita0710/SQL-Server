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

