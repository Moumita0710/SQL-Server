use Moumita


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

-----group by assignment-----
select * from emp1

select empno,':',ename,job,hiredate from emp1;
select distinct deptno from emp1
select ename,job from emp1
select ename,job as Information from emp1
select ename,sal from emp1 where sal>2850
select ename,deptno from emp1 where empno=7844
select ename,sal from emp1 where sal not between 1500 and 2850
select ename,deptno from emp1 where deptno=10 or deptno=30 order by ename
select ename,hiredate from emp1 where year(hiredate) like 1981
select ename,job from emp1 where job like '[^Manager]%'
select ename,sal,comm from emp1 where comm>0
select ename,sal,comm from emp1 where comm>sal
select ename from emp1 where ename like '__A%'
select ename from emp1 where ename like 'r%' or deptno=30 or empno like '[Manager]%'

select ename,sal,(3*sal)as Dream_Salary from emp1;
select ename,hiredate  from emp1 where week(hiredate)

select job as Information from emp1 where deptno=30
select ename from emp1 where ename like 'a%' or ename like 'k%'
select ename from emp1 where ename like '_u_n%' 
select ename from emp1 where ename like 's-z%' 

