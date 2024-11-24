#Create a table named Country with fields: Id Country_name Population Area
create table Country
(
Country_Id int primary key auto_increment,
Country_name varchar(20) not null,
Population int not null,
Area varchar(20) not null
);
 
desc Country;



#Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
create table Persons
(
Id int primary key auto_increment,
First_Name varchar(20) not null,
Last_Name varchar(20) null,
Population int,
Rating int,
Country_Id int,
Country_name varchar(20),
foreign key(Country_Id) references Country(Country_Id)
);

desc Persons;
truncate table Country;
drop table country;
drop table persons;
truncate table persons;
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


select * from Country;
select * from Persons;

#1. Write an SQL query to print the first three characters of Country_name from the Country table. 
select left(country_name, 3) as "first three characters of Country_name" from country;
#2. Write an SQL query to concatenate first name and last name from Persons table. 
select concat(First_Name, ' ', Last_name) AS ConcatenatedString from Persons;
#3. Write an SQL query to count the number of unique country names from Persons table. 
select count(distinct country_name) as "number of unique country names" from country;
#4. Write a query to print the maximum population from the Country table. 
select max(population) as "maximum population" from country;
#5. Write a query to print the minimum population from Persons table. 
select min(population) as "minimum population" from persons;
#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
INSERT INTO Persons (First_Name, Last_Name, Population, Rating, Country_Id, Country_name)
VALUES 
('Nazal', NULL, 6500000, 3.5, 1, 'India'),
('Marco', NULL, 4200000, 4.2, 2, 'USA');
select count(Last_name) "last name count" from Persons;
#7. Write a query to find the number of rows in the Persons table. 
select count(*) as "number of rows" from persons;
#8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
select country_id, population from country limit 3;
#9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
select * from country order by rand() limit 3;
#10. List all persons ordered by their rating in descending order. 
select * from persons order by rating desc;
#11. Find the total population for each country in the Persons table. 
select country_name, sum(population) as "total population" from persons group by country_name;
#12. Find countries in the Persons table with a total population greater than 50,000 
select country_name, sum(population) as "total population" from persons group by country_name having sum(population) > 50000;
#13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
select count(first_name) as "total number of persons", country_name, avg(rating) from persons group by country_name having count(first_name) >= 2 order by avg(rating);







