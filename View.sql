use moumita;
create table dept1(deptno int primary key,
dname varchar(14) default null,
loc varchar(13) default null);
create table emp1(empno int primary key,
ename varchar(10) default NUll,job varchar(9) default null,
mgr decimal(4,0) default null,hiredate date default null,
sal decimal(7,2) default null,
comm decimal(7,2) default null,
deptno int not null,
foreign key(deptno)references dept1(deptno));
insert into dept1 values(10,'Accounting','New York');
insert into dept1 values(20,'Research','Dallas');
insert into dept1 values(30,'Sales','Chicago');
insert into dept1 values(40,'Operation','Boston');
insert into emp1 values(7369,'Smith','Clerk',7902,'1980-12-17',800.00,null,20);
insert into emp1 values(7499,'Allen','Salesman',7698,'1981-02-20',1600.00,300.00,30);
insert into emp1 values(7521,'Ward','Salesman',7698,'1981-02-22',1250.00,500.00,30);
insert into emp1 values(7566,'Jones','Manager',7839,'1981-04-02',2975.00,null,20);
insert into emp1 values(7654,'Martin','Salesman',7698,'1981-09-28',1250.00,1400.00,30);
insert into emp1 values(7698,'Blake','Manager',7839,'1981-05-01',2850.00,null,30);
insert into emp1 values(7782,'Clark','Manager',7839,'1981-06-09',2450.00,null,10);
insert into emp1 values(7788,'Scott','Analyst',7566,'1982-12-09',3000.00,null,20);
insert into emp1 values(7839,'King','President',null,'1981-11-17',5000.00,300.00,10);
insert into emp1 values(7844,'Turner','Salesman',7698,'1981-09-08',1500.00,0.00,30);
insert into emp1 values(7876,'Adams','Clerk',7788,'1983-01-12',1100.00,null,20);
insert into emp1 values(7900,'James','Clerk',7698,'1981-12-03',950.00,null,30);
insert into emp1 values(7902,'Ford','Analyst',7566,'1981-12-03',3000.00,null,20);
insert into emp1 values(7934,'Miller','Clerk',7782,'1982-01-23',1300.00,null,10);
select * from emp1
create view colview as select empno,deptno,ename,job,sal from emp1;
select * from colview
insert into colview values(1111,10,'aaa','aaa',9000);
update colview set ename='Santosh' where empno=1111
delete from colview where empno=1111
select * from colview
delete from colview where empno=7902
sp_helptext colview
insert into colview values(7778,20,'Sita','Manager',20000)
create view allview as select * from emp1
select * from allview
insert into allview(deptno,empno,ename,job,sal)values(10,7779,'Gita','Manager',20000)
update allview set ename='Ram' where empno=7779
delete from allview where empno=7778
alter view allview as select empno,ename,sal,job,comm,deptno from emp1
create view checkview as select * from emp1 where sal>2500
select * from checkview
insert into checkview(empno,ename,deptno,sal)values(1125,'Shyam',10,1000)
alter view checkview as select * from emp1 where sal>2500 with check option
create view checkviewdemo as select * from emp1 where sal>2500
insert into checkviewdemo(empno,ename,deptno,sal)values(89757,'ram',10,1000)
drop view checkviewdemo
