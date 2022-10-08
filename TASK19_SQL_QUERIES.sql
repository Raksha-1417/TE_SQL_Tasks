	CREATE DATABASE ORG;
	USE ORG;
 	create table Worker(
	WORKER_ID int  Primary Key IDENTITY(1,1),
	FIRST_NAME char(25),
	LAST_NAME char(25),
	SALARY int,
	JOINING_DATE DATETIME,
	DEPARTMENT char(25)
	);
	create table Bonus(
	WORKER_REF_ID int,
	BONUS_AMOUNT int,
	BONUS_DATE DATETIME,
	FOREIGN KEY(WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
	);


	insert into Worker values('Monika','Arora',100000,'2020-02-14 09:06','HR')
	insert into Worker values('Niharika','Verma',80000,'2011-06-14 09:10','Admin');
	insert into Worker values('Vishal','Singhal',300000,'2020-02-14 09:10','HR');
	insert into Worker values('Amitabh','Singh',500000,'2020-02-14 09:06','Admin');
	insert into Worker values('Vivek','Bhati',500000,'2011-06-14 09:10','Admin');
	insert into Worker values('Vipul','Diwan',200000,'2011-06-14 09:06','Account');
	insert into Worker values('Satish','Kumar',75000,'2020-01-14 09:10','Account');
	insert into Worker values('Geetika','Chauhan',90000,'2011-04-14 09:06','Admin');



	select * from Worker
    Insert into Bonus values(001,5000,'2000-02-16')
    Insert into Bonus values(002,3000,'2011-06-16')
    Insert into Bonus values(003,4000,'2020-02-16')
    Insert into Bonus values(001,4500,'2020-02-16')
    Insert into Bonus values(002,3500,'2020-06-16')

	select * from Bonus;
	Create table Title(
	Worker_Ref_ID int,
	Worker_Title varchar(25),
	Affected_From Datetime,
	Foreign key(Worker_Ref_ID) references worker(Worker_ID) on delete cascade
	)

	Insert into Title values(001,'Manager','2016-02-20')
	Insert into Title values(002,'Executive','2016-06-11')
	Insert into Title values(008,'Executive','2016-06-11')
	Insert into Title values(005,'Manager','2016-06-11')
	Insert into Title values(004,'Asst. Manager','2016-06-11')
	Insert into Title values(007,'Executive','2016-06-11')
	Insert into Title values(006,'Lead','2016-06-11')
	Insert into Title values(003,'Lead','2016-06-11')
	select * from Worker
	select * from Bonus
	select * from Title

	--Q-1---
	select First_Name as WORKER_NAME from Worker

	--Q2---
	select UPPER(First_Name) as WORKER_NAME from Worker

	--Q3----
	select DISTINCT department as DEPARTMENT from Worker

	---Q4-----

	select SUBSTRING(First_Name,1,3) as FIRST_NAME from Worker

	---Q5----
	select DISTINCT department,LEN(department) AS lengthofdepartment FROM Worker

	--Q6--
	select CONCAT(First_Name,' ',Last_Name) as COMPLETE_NAME FROM Worker

	--Q7--
	select * from Worker where First_Name IN('Vipul','Satish')

	
	--Q8--
	select * from Worker where department='Admin'

	--Q9--
	select * from Worker where First_Name Like '%a'

	--Q10--
	select * from Worker where First_Name Like '%a%'