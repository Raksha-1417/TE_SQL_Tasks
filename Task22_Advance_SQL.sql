USE ORG
create table salary(
sid int Primary Key,
sname varchar(20),
months int,
monthsalary bigint
);
insert into salary values(1,'Siya',2,30000)
insert into salary values(2,'Arman',8,30000)
insert into salary values(3,'Arya',10,30000)
insert into salary values(4,'Mike',12,30000)

select * from salary
----ex 1 scalar function with two parameters as month and monthsalary
create function fn_totalsalary(@month as int, @monthsalary as bigint)
returns bigint as
begin
	return @month * @monthsalary
end

----call the function 
select dbo.fn_totalsalary(2,50000) as totsalary

select * from salary
---call the function in table
select dbo.fn_totalsalary(months,monthsalary)as totalsalary, sname from salary

---  create function for bonus
create function fn_pfcalculation(
@salary decimal(7,2),
@pfpercentage decimal(5,2)
)
RETURNS decimal(7,2)
AS begin
declare @CTC decimal(7,2) = @salary
if(@salary>15000)
set @CTC=@salary-(@salary*@pfpercentage)/100
return @CTC
END
GO
select dbo.fn_pfcalculation(20000,10.5) as BasicSalary


---2.Procedure with Output Parameter 

create procedure sp_Total(@totalsalemployee int OUTPUT)
as 
Begin
	Select @totalsalemployee=count(sid) from salary
End

Declare @Final int
exec sp_Total @Final OUTPUT
Print @Final

---3.Trigger to restrict DML access between 6:00PM to 10.00AM
--Restrict the user to access for DML in specific time

create trigger trg_salary_demo
on salary
FOR INSERT,UPDATE, DELETE

as
begin
	if (DATEPART(HH,GETDATE())>18 or DATEPART(HH,GETDATE())<10)
	BEGIN
		print 'You cannot insert the details between 6:00PM and 10AM'
		Rollback transaction
	END
end

select * from salary
update salary set sname='Yukta' where sid=4

-- insert values
insert into salary values(5,'Jivika',14,30000)
---delete values
delete from salary where sid=5

----3. Server scope triggers
create trigger T_DDL_DB
on ALL Server
For Create_Table, Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on any Database'
	Rollback Transaction
End

use SQL_Training

create table example
(id int
)
use TE
create table example2
(
id int,
name varchar(20),
age int
)

---5. Working of explicit transaction with Save transaction
use ORG
select * from employee1

begin transaction
	insert into employee1 values(5,'Yuvika',988777890,30000,'2000-6-5');
	update employee1 set EName='Jeevana' where EID=3;
	--Save
	SAVE TRANSACTION new_update_val
	delete from employee1 where EID=4;
	ROLLBACK TRANSACTION new_update_val
COMMIT TRANSACTION

--Difference between throw and Raiserror in exception handling

alter procedure sp_multiply
@a int,
@b int
as
BEGIN
	DECLARE @mul int
	BEGIN TRY
		BEGIN	
			IF(@b=0)
			--RAISERROR('Number cannont be zero',15,34)
			THROW 50001,'Number cannot be zero',12;
			SET @mul=@a*@b
			PRINT 'Multiplication is ' + CAST(@mul as varchar)
		END
		END TRY
		BEGIN CATCH 
			PRINT ERROR_NUMBER()
			PRINT ERROR_MESSAGE()
			PRINT ERROR_SEVERITY()
		    PRINT ERROR_STATE()	
		END CATCH
	END

	execute sp_multiply 7,2
	execute sp_multiply 8,0

--- In throw There is no severity parameter. The exception severity is always set to 16 until re-throwing from a CATCH block	
---In RaiseError The Severity parameter specified the severity of the exception.









