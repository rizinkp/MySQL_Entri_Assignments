#Using Sales database
use Sales;

#Create a table named Country with fields: Id Country_name Population Area
create table Country
(
Country_Id int primary key auto_increment,
Country_name varchar(20) not null,
Population int not null,
Area varchar(20) not null
);
 
#Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
create table Persons
(
Id int primary key auto_increment,
First_Name varchar(20) not null,
Last_Name varchar(20) not null,
Population int,
Rating int,
Country_Id int,
Country_name varchar(20),
foreign key(Country_Id) references Country(Country_Id)
);


#Insert 10 rows into both tables, as given below.
-- Insert data into Country table
INSERT INTO Country (Country_name, Population, Area)
VALUES 
('India', 1400000000, '3,287,263 sq km'),
('USA', 2000000, '9,834,000 sq km'),
('China', 1440000000, '9,597,000 sq km'),
('Brazil', 213000000, '8,515,767 sq km'),
('Canada', 38000000, '9,984,670 sq km'),
('Australia', 26000000, '7,692,024 sq km'),
('UK', 600000, '243,610 sq km'),
('Germany', 83000000, '357,022 sq km'),
('Japan', 125000000, '377,975 sq km'),
('France', 1700000, '551,695 sq km');

-- Insert data into Persons table
INSERT INTO Persons (First_Name, Last_Name, Population, Rating, Country_Id, Country_name)
VALUES 
('John', 'Doe', 2000000, 5, 2, 'USA'),
('Jane', 'Smith', 1500000, 4, 1, 'India'),
('Wei', 'Chen', 2400000, 5, 3, 'China'),
('Carlos', 'Silva', 2100000, 3, 4, 'Brazil'),
('Emily', 'Johnson', 1800000, 4, 5, 'Canada'),
('Liam', 'Brown', 500000, 2, 6, 'Australia'),
('Oliver', 'Jones', 600000, 5, 7, 'UK'),
('Sophia', 'Garcia', 700000, 4, 8, 'Germany'),
('Ethan', 'Martinez', 800000, 3, 9, 'Japan'),
('Charlotte', 'Davis', 900000, 5, 10, 'France'),
('Alex', 'Taylor', 750000, 4, 2, NULL);

#(1)List the distinct country names from the Persons table 
select distinct country_name from Persons;
#(2)Select first names and last names from the Persons table with aliases. 
select First_name as FName, Last_Name as LName from Persons;
#(3)Find all persons with a rating greater than 4.0. 
select * from Persons where Rating > 4.0;
#(4)Find countries with a population greater than 10 lakhs. 
select * from Country where Population > 1000000;
#(5)Find persons who are from 'USA' or have a rating greater than 4.5. 
select * from Persons where Country_name = 'USA' OR Rating > 4.5;
#(6)Find all persons where the country name is NULL.
select * from Persons where Country_name is null;
#(7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
select * from Persons where country_name in ('USA', 'Canada', 'UK');
#(8)Find all persons not from the countries 'India' and 'Australia'.
select * from Persons where country_name not in ('India', 'Australia'); 
#(9)Find all countries with a population between 5 lakhs and 20 lakhs. 
select * from Country where Population between 500000 and 2000000;
#(10)Find all countries whose names do not start with 'C'.
select * from Country where Country_name like 'C%';

