use moumita
 
 ---Transaction---

create table person(person_id int primary key, fname varchar(15), lname varchar(15),sal int);

insert into person values(111,'Sanjay','Gandhi',12000);
insert into person values(112,'Rajiv','Gandhi',10000);
insert into person values(113,'Nisha','Mehta',21500);
insert into person values(114,'Aashish','Sharma',25000);
insert into person values(115,'Aakriti','Singh',31000);
insert into person values(116,'Ram','Shrivastava',10000);
insert into person values(117,'Shyam','Sinha',42500);
insert into person values(118,'Jivan','Patil',35000);

select * from person;
begin transaction
insert into person values(119,'Mohit','Khare',80000);
save transaction insave
update person set sal=63000 where person_id=112
save transaction uptrans
delete from person where person_id=113
rollback transaction insave
commit

select * from person;
