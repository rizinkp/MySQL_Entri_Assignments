#Create a database named School;
create database School;

#Select Database
use School;

#Create Student table
CREATE TABLE Student
(
Roll_No int auto_increment primary key,
Name varchar(50) not null,
Marks int not null,
Grade varchar(20) not null
);

#View Table defenition
desc Student;

#Insert sample records to the Student table
INSERT INTO Student (Name, Marks, Grade) VALUES
('Aditi Singh', 95, 'A'),
('Rahul Mehta', 88, 'B'),
('Priya Sharma', 76, 'C'),
('Arjun Patel', 92, 'A'),
('Neha Desai', 64, 'D'),
('Karan Kumar', 85, 'B'),
('Ananya Joshi', 90, 'A'),
('Rohan Gupta', 73, 'C'),
('Simran Kaur', 68, 'D'),
('Dev Mishra', 80, 'B'),
('Nisha Reddy', 78, 'C'),
('Varun Verma', 94, 'A'),
('Kavya Nair', 62, 'D'),
('Tarun Singh', 89, 'B'),
('Sneha Roy', 71, 'C'),
('Aditya Shah', 86, 'B'),
('Pooja Goel', 99, 'A'),
('Ajay Menon', 83, 'B'),
('Ria Saxena', 67, 'D'),
('Vivek Yadav', 75, 'C');

#1. Use the select command to display the STUDENT table.
select * from Student;

#2. Add a column named Contact to the STUDENT table.
Alter Table Student Add Column Contact varchar(10); 

SELECT * FROM Student;

#3. Remove the Grade column from the STUDENT table.
ALTER TABLE Student DROP COLUMN Grade;

SELECT * FROM Student;

#4. Rename the STUDENT table to CLASSTEN.
Rename table Student TO CLASSTEN;

desc CLASSTEN;

#5. Delete all rows from the CLASSTEN table.
DELETE FROM CLASSTEN;
#OR
TRUNCATE TABLE CLASSTEN;

SELECT * FROM CLASSTEN;

#6. Remove the CLASSTEN table from the database.
DROP TABLE CLASSTEN;