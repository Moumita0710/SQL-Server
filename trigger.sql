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

//INSTEAD OF TRIGGER

use moumita
create table customers
(
customer_id int primary key identity,
cname varchar(20),
website varchar(20),
)
create table contact
(
contact_id int identity,
fname varchar(20),
lname varchar(20),
customer_id int,
constraint pk_cid primary key (contact_id),
constraint fk_cust_id foreign key(customer_id)references customers (customer_id))
 go

 create view vw_customer as
 select customers.customer_id,cname,website,fname,lname from customers inner join contact
 on customers.customer_id=contact.customer_id;
 go

 /*inserting value into view will throw error because view is inner join with contact table and in this case 
 we can not insert value in view*/

 insert into vw_customer(cname,website,fname,lname) values ('Sunita','test.com','vishal','joshi');
 go

 /*so we can insert value in view through trigger*/

 create or alter trigger new_customer_trg 
 on vw_customer instead of insert
 as
 Begin
 declare @cus_id int;
 ---insert a new customer first---
 insert into customers(cname,website)
 select i.cname,i.website
 from inserted i;
 --save customer id in variable--
 select @cus_id=customers.customer_id from customers join inserted
on customers.cname=inserted.cname
---- check variable if it is null show error -----
if(@cus_id is null)
 begin
  Raiserror('Invalid customer name. Statement Terminated',16,1)
  return
 end

---insert the contact---
insert into contact(fname,lname,customer_id)
select i.fname,i.lname,@cus_id from inserted i;
end;
go
insert into vw_customer(cname,website,fname,lname)values('Moumita', 'www.moumita.com','moumita','soni')
select * from contact
select * from customers
select * from vw_customer
