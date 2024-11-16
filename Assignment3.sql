#Using Sales database
use Sales;

#Create a table named Managers with fields : Manager_Id First_name Last_Name DOB Age ->Use check constraint Last_update Gender Department Salary -> NOT NULL 

create table Managers
(
Manager_Id int primary key auto_increment, 
First_name varchar(50) not null, 
Last_Name varchar(50) not null, 
DOB date not null, 
Age int not null check(Age > 30),
Last_update datetime,
Gender varchar(20)  not null,
Department varchar(20) not null,
Salary int not null
);

desc Managers;

#1. Insert 10 rows.
INSERT INTO Managers (First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary)
VALUES
    ('John', 'Doe', '1980-05-15', 44, NOW(), 'Male', 'IT', 90000),
    ('Jane', 'Smith', '1985-02-20', 39, NOW(), 'Female', 'HR', 85000),
    ('Robert', 'Brown', '1975-11-10', 49, NOW(), 'Male', 'Finance', 95000),
    ('Emily', 'Davis', '1988-01-01', 36, NOW(), 'Female', 'Marketing', 80000),
    ('Michael', 'Wilson', '1982-06-25', 42, NOW(), 'Male', 'Operations', 87000),
    ('Linda', 'Johnson', '1981-03-30', 43, NOW(), 'Female', 'IT', 88000),
    ('David', 'Martinez', '1979-12-05', 45, NOW(), 'Male', 'Finance', 91000),
    ('Sarah', 'Lee', '1984-08-17', 40, NOW(), 'Female', 'Marketing', 86000),
    ('James', 'Garcia', '1981-04-13', 43, NOW(), 'Male', 'HR', 84000),
    ('Laura', 'Clark', '1986-07-22', 38, NOW(), 'Female', 'Operations', 83000),
	('Aaliya', 'Khan', '1987-03-15', 37, NOW(), 'Female', 'Finance', 89000),
	('Rahul', 'Sharma', '1989-10-12', 35, NOW(), 'Male', 'Operations', 32000);

select * from Managers;


#2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.

SELECT * FROM Managers WHERE Manager_Id = 1;


#3. Write a query to display the annual income of all managers.

SELECT First_Name, Last_Name, Salary FROM Managers;


#4. Write a query to display records of all managers except ‘Aaliya’

select * from Managers where First_Name <> 'Aaliya';

#5. Write a query to display details of managers whose department is IT and earns more than 25000 per month.

select * from Managers where Department = 'IT' and Salary > 25000;

#6. Write a query to display details of managers whose salary is between 10000 and 35000.

select * from Managers where Salary between 10000 and 35000;