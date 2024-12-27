use moumita
create table sports
(
id int primary key,
Spname varchar(45),
Fees int,
gender char(1),
Studname varchar(12)
)
insert into sports values(1,'Cricket',1500,'F','Kiran Joshi'),
(2,'Cricket',1500,'F','Mitali Rao'),
(3,'Football',1200,'M','Sameer Jha'),
(4,'Football',1200,'F','Soni Sinha')
select * from sports
create table stud_Audit_Test
(
id int identity,
Audit_Action text
);
Go
-------Insert-------
drop trigger trInsert_stud
Create Trigger trInsert_stud
On sports
for insert
as 
begin
declare @id int
select @id=id from inserted
insert into stud_Audit_Test values('New student with id='+cast(@id as varchar(10))+' is added at '+cast(getdate() as  varchar(22)))
end
insert into sports values(6,'tennis',2500,'M','Mehul Sharma')
select * from stud_Audit_Test;
go
----Delete----
create trigger trDelete_stud
on sports
for delete
as
begin 
Declare @id int
select @id=id from deleted
insert into stud_Audit_Test values('An existing employee with id = '+cast(@id as varchar(10))+' is deleted at '
+cast(Getdate() as varchar(22)))
end
delete from sports where id=6;
select * from stud_Audit_Test
go
-----update-----
create trigger trUpdate_stud
on sports
for update 
as
begin
declare @id int
select @id=id from inserted
insert into stud_Audit_Test values('An existing employee with id ='+cast(@id as varchar(10))+' is updated at '
+cast(getdate() as varchar(22)))
end
select * from sports
update sports set gender='M' where id=4;
select * from stud_Audit_Test


