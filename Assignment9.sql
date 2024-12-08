#Consider the Worker table with following fields: 
#Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) 

create database Company;

use Company;
truncate table Worker;
CREATE TABLE Worker
(
Worker_Id INT auto_increment primary key, 
FirstName CHAR(25), 
LastName CHAR(25), 
Salary INT, 
JoiningDate DATETIME, 
Department CHAR(25)
);

INSERT INTO Worker (FirstName, LastName, Salary, JoiningDate, Department) VALUES
('John', 'Doe', 50000, '2021-01-15 09:00:00', 'IT'),
('Jane', 'Smith', 60000, '2020-05-20 09:00:00', 'HR'),
('Robert', 'Brown', 55000, '2019-11-10 09:00:00', 'Finance'),
('Emily', 'Davis', 62000, '2022-03-01 09:00:00', 'Marketing'),
('Michael', 'Wilson', 58000, '2020-06-15 09:00:00', 'IT'),
('Sarah', 'Miller', 52000, '2021-04-10 09:00:00', 'Finance'),
('James', 'Moore', 48000, '2019-09-25 09:00:00', 'IT'),
('Emma', 'Taylor', 45000, '2022-01-18 09:00:00', 'HR'),
('Daniel', 'Anderson', 70000, '2018-12-05 09:00:00', 'Marketing'),
('Sophia', 'Thomas', 53000, '2021-08-30 09:00:00', 'Finance'),
('David', 'Jackson', 49000, '2019-03-15 09:00:00', 'IT'),
('Olivia', 'White', 61000, '2020-07-12 09:00:00', 'HR'),
('Lucas', 'Harris', 55000, '2021-11-20 09:00:00', 'Finance'),
('Isabella', 'Martin', 64000, '2018-10-30 09:00:00', 'Marketing'),
('Ethan', 'Thompson', 53000, '2019-01-25 09:00:00', 'IT'),
('Mia', 'Garcia', 50000, '2020-09-15 09:00:00', 'HR'),
('Alexander', 'Martinez', 72000, '2021-12-10 09:00:00', 'Marketing'),
('Charlotte', 'Rodriguez', 47000, '2019-06-22 09:00:00', 'Finance'),
('William', 'Lee', 51000, '2020-03-18 09:00:00', 'IT'),
('Amelia', 'Walker', 49000, '2018-07-14 09:00:00', 'HR'),
('Benjamin', 'Hall', 75000, '2022-04-01 09:00:00', 'Marketing'),
('Ava', 'Young', 46000, '2019-08-27 09:00:00', 'Finance'),
('Henry', 'King', 53000, '2021-10-05 09:00:00', 'IT'),
('Harper', 'Scott', 62000, '2022-02-25 09:00:00', 'HR'),
('Sebastian', 'Adams', 67000, '2020-05-11 09:00:00', 'Marketing');


select * from worker

#1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 
delimiter  $$
create procedure sp_Insert_Worker
(
FirstName CHAR(25), 
LastName CHAR(25), 
Salary INT, 
JoiningDate DATETIME, 
Department CHAR(25)
)
begin
INSERT INTO Worker(FirstName, LastName, Salary, JoiningDate, Department) values(FirstName, LastName, Salary, JoiningDate, Department);
end$$
delimiter ;

CALL sp_Insert_Worker('Allu', 'Philips', 125000, '2020-05-15', 'Accounts');

select * from Worker;

#2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 
delimiter $$
create procedure sp_get_salary
(
W_Id int,
out p_salary int
)
begin
select Salary into p_salary from Worker where Worker_Id = W_Id;
end$$
delimiter ;

call sp_get_salary(1, @p_salary);
select @p_salary as Salary;

#3. Create a stored procedure that takuees in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 
delimiter $$
create procedure sp_update_department
(
W_Id int,
Department CHAR(25)
)
begin
update Worker set Department = Department where Worker_Id = W_Id;
select * from Worker where Worker_Id = W_Id;
end $$
delimiter ;

call sp_update_department(26, 'Finance');

#4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
delimiter $$
create procedure sp_GetDepartmentWorkerCount
(
Department varchar(25),
out p_workerCount int
)
begin 
select count(*) into p_workerCount from Worker where Department = Department;
end$$
delimiter ;

call sp_GetDepartmentWorkerCount('Finance', @p_workerCount);
select @p_workerCount as Dept_WorkerCount;

#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
delimiter $$
create procedure sp_GetAvgSalary_ForDept
(
Department varchar(25),
out p_avgSalary decimal
)
begin
select avg(Salary) into p_avgSalary from Worker where Department = Department;
end$$
delimiter ;

call sp_GetAvgSalary_ForDept('Finance', @p_avgSalary);
select @p_avgSalary;
