use moumita

---While loop----
create procedure loopshow(@start int, @end int)
as
declare @c int=@start
while @c<=@end
begin
print @c
set @c=@c+1
end
exec loopshow 20,125

---Assignment---

--Enter a no and display its table----
create procedure assign(@num int)
as 
declare @n int=1
while @n<=10 
begin
print Cast(@num as varchar(10))+'X'+Cast(@n as varchar(10))+'='+Cast((@num*@n) as varchar(10))
set @n=@n+1
end
exec assign 5


create table bikeshop1
(
id int primary key identity,
bike_name varchar(50) not null,
price float
)
declare @count int;
set @count=1;
while @count<=10
begin
insert into bikeshop1 values('Bike-'+cast(@count as varchar),@count*5000)
set @count=@count+1
end
select * from bikeshop1












































