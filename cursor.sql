use moumita
----cursor----
declare @emp_id int,@emp_name varchar(20),@sal int;
print '--------Employee Details---------'
Declare  emp_cursor Cursor for 
select empno,ename,sal from emp1 order by empno
open emp_cursor
fetch next from emp_cursor into @emp_id,@emp_name,@sal
print 'Employee_ID Employee_Name Salary'
while @@fetch_status=0
Begin
if @sal>=10000
  print '   '+cast(@emp_id as varchar(10))+'    '+
cast(@emp_name as varchar(20))+'   '+cast(@sal as varchar(10))+'      '+
'Grade A'
else
   print '   '+cast(@emp_id as varchar(10))+'    '+
       cast(@emp_name as varchar(20))+'  '+cast(@sal as varchar(10))
fetch next from emp_cursor
into @emp_id,@emp_name,@sal
end
close emp_cursor
deallocate emp_cursor
---Assignment---
---1) create cursor to display emp name from emp table if emp name starts with 's'. the name should be concatenated with 'have a nice day' and for all other name display msg welcome

declare @name varchar(20)
declare emp_cursor2 cursor for select ename from emp1
open emp_cursor2
fetch next from emp_cursor2 into @name
while @@FETCH_STATUS=0
begin
if @name like 's%'
 print @name+' have a nice day'
else
 print 'Welcome '+@name
fetch next from emp_cursor2 into @name
end
close emp_cursor2
deallocate emp_cursor2

---2) create student table with name,rollno and percentage then create cursor to display grading on percentage

create table student(rollno int primary key,name varchar(10), percentage float)
 insert into student values(1,'Nisha',55.4),
                           (2,'Rajesh',60),
						   (3,'Mahesh',64.56),
						   (4,'Jiya',76.60),
						   (5,'Onkita',95.00),
						   (6,'Moumita',87.00),
						   (7,'Suresh',88),
						   (8,'Ahana',90),
						   (9,'Shaheer',44.40)
						   select * from student

declare @roll int, @sname varchar(10),@grade float
declare stud_cursor cursor for select rollno,name,percentage from student
open stud_cursor
fetch next from stud_cursor into @roll,@sname,@grade
while @@FETCH_STATUS=0
begin 
if @grade>80
    print '   '+cast(@roll as varchar(10))+'    '+
   cast(@sname as varchar(10))+'   '+cast(@grade as varchar(10))+'      '+
   'Grade A'
else if @grade>60
   print '   '+cast(@roll as varchar(10))+'    '+
   cast(@sname as varchar(10))+'   '+cast(@grade as varchar(10))+'      '+
   'Grade B'
else
   print '   '+cast(@roll as varchar(10))+'    '+
   cast(@sname as varchar(10))+'   '+cast(@grade as varchar(10))+'      '+
   'Grade C'
fetch next from stud_cursor
into @roll,@sname,@grade
end
close stud_cursor
deallocate stud_cursor