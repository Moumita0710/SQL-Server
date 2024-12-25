use moumita

---indexes---
create table employees
(
Id int primary key identity,
Ename nvarchar(50),
Email nvarchar(50),
Department nvarchar(50)
)
set nocount on
/*the message that indicates the number of rows that are affected by the T-SQL statement is not returned as part of the result*/
Declare @counter int=1
while(@counter<=500)
Begin 
Declare @Name nvarchar(50)='Moumita' + RTRIM(@counter)
Declare @Email nvarchar(50)='moumita' + RTRIM(@counter) +'@gmail.com'
Declare @Dept nvarchar(50)='Dept' + RTRIM(@counter)
insert into employees values (@Name,@Email,@Dept)
set @counter=@counter+1
if(@counter%10000=0)
 print RTrim(@counter)+' rows inserted'
End
select * from employees where id=400
select * from employees where Ename='Moumita 200'

create NONCLUSTERED INDEX IX_empname on Employees(Ename)
drop index IX_empname on Employees

create table dummyEmp
(
empno int,
fname varchar(20),
lname varchar(20),
)
insert into dummyEmp values(12,'aaa','aaa');
insert into dummyEmp values(1,'bbb','bbb');
insert into dummyEmp values(13,'ccc','ccc');
insert into dummyEmp values(3,'sss','kkk');
select * from dummyEmp
alter table dummyEmp alter column empno int not null
alter table dummyEmp add constraint pk_dummy primary key(empno)

create table FactFinance(
FinanceKey int not null,
DateKey int not null,
OrganizationKey int not null,
DepartmentGroupKey int not null,
Scenariokey int not null,
AccountKey int not null,
Amount float not null,
Date datetime null
)
create clustered index IX_FK_DK on FactFinance
(FinanceKey,DateKey)
Go
Select FinanceKey,
       DateKey,
	   OrganizationKey,
	   DepartmentGroupKey
From FactFinance

create NONCLUSTERED COLUMNSTORE INDEX
IX_FK_DK_OK_DGK ON FactFinance
(FinanceKey,DateKey,OrganizationKey,DepartmentGroupKey)
GO
Select FinanceKey,
       DateKey,
	   OrganizationKey,
	   DepartmentGroupKey
From FactFinance

set statistics IO on 
go
Select FinanceKey,
       DateKey,
	   OrganizationKey,
	   DepartmentGroupKey
From FactFinance with (index(IX_FK_DK))

Go
Select FinanceKey,
       DateKey,
	   OrganizationKey,
	   DepartmentGroupKey
From FactFinance with (index(IX_FK_DK_OK_DGK))




