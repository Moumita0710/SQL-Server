use Moumita;
create table Branch(id int, name varchar(40),
Location varchar(50), Code int,
constraint pk_id primary key(id))

create table Client(id int, full_name varchar(40),address varchar(50),
branch_id int,gender char,city varchar(50),resident char,
open_date date, close_date date, status char,
constraint fk_id foreign key (branch_id) references branch(id))
alter table branch add constraint chk_loc check(location in('India','Bangladesh','USA'))
alter table Client add constraint chk_gen check (gender='m' or gender= 'f')
select * from client where open_date<cast(getdate() as date)
select * from client where close_date<=cast(getdate() as date)

insert into Branch values(101,'Onkita','India',401111)
insert into Branch values(102,'Moumita','USA',201101)
insert into Branch values(103,'Satyam','Bangladesh',301551)
insert into client values(211,'Onkita Prasad','borivali',101,'F',
'Mumbai','r','1920-10-23','2024-12-2','p')
insert into client values(212,'Moumita Prasad','Kandivali',102,'F',
'Mumbai','r','1921-10-23','2024-12-2','p')
insert into client values(213,'Satyam Prasad','Andheri',103,'M',
'Bangladesh','r','1921-10-23','2024-12-2','p')
insert into client values(214,'Jiya Kashyap','Nalasopara',101,'F',
'Mumbai','r','2023-10-23','2024-12-2','p')
insert into client values(215,'Sachin Shrivastava','Bhayandar',102,'M',
'USA','r','2021-10-23','2024-12-2','p')
insert into client values(216,'Aniket Modanwal','Goregaon',103,'M',
'Mumbai','r','1921-10-23','2024-12-2','p')
insert into client values(217,'Neha Prasad','Kandivali',101,'F',
'Mumbai','r','2021-10-23','2024-12-2','p')
insert into client values(218,'Nisha Sheikh','Goregaon',103,'F',
'USA','r','1921-10-23','2024-12-2','p')
insert into client values(219,'Nilam Prasad','Kandivali',102,'F',
'USA','r','1921-10-23','2024-12-2','p')
insert into client values(220,'Naresh Prasad','Bhayandar',103,'M',
'Mumbai','r','1921-10-23','2024-12-2','p')
insert into client values(221,'Dinesh Prasad','Bhayandar',103,'M',
'Mumbai','r','2024-12-02','2024-12-2','p')
select full_name from client where city like 'usa%';
select full_name gender,open_date from Client where gender='M' and open_date< '2024-11-01'