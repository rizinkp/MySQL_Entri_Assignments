#Consider the Country table and Persons table that you created earlier and perform the following: 
use Sales;

#1. Find the number of persons in each country. 
select Country_name, count(Id) as 'number of persons' from Persons group by Country_name;

#2. Find the number of persons in each country sorted from high to low. 
select Country_name, count(Id) as 'number of persons' from Persons group by Country_name order by count(Id) desc;

#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select Id, First_name, last_name, Rating, country_name from persons group by Id, First_name, last_name, Rating, country_name having avg(rating) > 3.0;

#4. Find the countries with the same rating as the USA. (Use Subqueries) 
select country_name 'Country same rating as the USA' from persons where rating = (select rating from persons where country_name = 'USA' limit 1);

#5. Select all countries whose population is greater than the average population of all nations. 
select * from country where population > (select avg(population) from country); 

#Create a database named Product and create a table called Customer with the following fields in the 
#Product database: Customer_Id - Make PRIMARY KEY First_name not null, Last_name, Email, Phone_no unique not null, Address, City, State, Zip_code, Country 

create database Product;

create table Customer
(
Customer_Id int primary key auto_increment,
First_Name varchar(20) not null,
Last_Name varchar(20),
Email varchar(50),
Phone_no varchar(15) unique not null,
Address varchar(100),
City varchar(20),
State varchar(20),
Zip_Code int,
Country varchar(20)
);
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '3456789012', '789 Pine St', 'London', 'Greater London', '696563', 'United Kingdom'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '4567890123', '321 Maple St', 'Toronto', 'Ontario', '5865236', 'Canada'),
(5, 'Chris', 'Johnson', 'chris.johnson@example.com', '5678901234', '654 Oak St', 'Sydney', 'New South Wales', '2000', 'Australia'),
(6, 'Patricia', 'Williams', 'patricia.williams@example.com', '6789012345', '987 Birch St', 'Berlin', 'Berlin', '10115', 'Germany'),
(7, 'Robert', 'Jones', 'robert.jones@example.com', '7890123456', '159 Cedar St', 'Paris', 'Île-de-France', '75001', 'France'),
(8, 'Linda', 'Miller', 'linda.miller@example.com', '8901234567', '753 Spruce St', 'Mumbai', 'Maharashtra', '400001', 'India'),
(9, 'James', 'Wilson', 'james.wilson@example.com', '9012345678', '951 Willow St', 'Cape Town', 'Western Cape', '8001', 'South Africa'),
(10, 'Barbara', 'Moore', 'barbara.moore@example.com', '0123456789', '369 Redwood St', 'Tokyo', 'Tokyo', '1005001', 'Japan'),
(11, 'Thomas', 'Taylor', 'thomas.taylor@example.com', '1023456789', '741 Aspen St', 'Auckland', 'Auckland', '1010', 'New Zealand'),
(12, 'Mary', 'Anderson', 'mary.anderson@example.com', '1123456789', '852 Fir St', 'Dubai', 'Dubai', '452965', 'United Arab Emirates'),
(13, 'Daniel', 'Thomas', 'daniel.thomas@example.com', '1223456789', '963 Hickory St', 'São Paulo', 'São Paulo', '01045000', 'Brazil'),
(14, 'Elizabeth', 'Martinez', 'elizabeth.martinez@example.com', '1323456789', '147 Walnut St', 'Mexico City', 'Mexico City', '01000', 'Mexico'),
(15, 'Matthew', 'Hernandez', 'matthew.hernandez@example.com', '1423456789', '258 Cypress St', 'Singapore', 'Central Region', '018983', 'Singapore'),
(16, 'Jennifer', 'Lopez', 'jennifer.lopez@example.com', '1523456789', '369 Ash St', 'Madrid', 'Madrid', '28001', 'Spain'),
(17, 'Joshua', 'Clark', 'joshua.clark@example.com', '1623456789', '471 Poplar St', 'Rome', 'Lazio', '00100', 'Italy'),
(18, 'Ashley', 'Gonzalez', 'ashley.gonzalez@example.com', '1723456789', '582 Cherry St', 'Seoul', 'Seoul', '04524', 'South Korea'),
(19, 'Andrew', 'Hall', 'andrew.hall@example.com', '1823456789', '693 Magnolia St', 'Beijing', 'Beijing', '100000', 'China'),
(20, 'Sarah', 'Adams', 'sarah.adams@example.com', '1923456789', '147 Palm St', 'Moscow', 'Moscow', '101000', 'Russia'),
(21, 'Brindo', 'James', 'brindo.james@example.com', '445825648513', '136 glowe St', 'California', 'California', '201000', 'USA');

select * from customer;


INSERT INTO Customer (First_Name, Last_Name, Email, Phone_No, Address, City, State, Zip_Code, Country)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Priya', 'Singh', 'priya.singh@example.com', '9876543211', '456 Residency Road', 'Bengaluru', 'Karnataka', '560001', 'India'),
('Arjun', 'Kumar', 'arjun.kumar@example.com', '9876543212', '789 Park Street', 'Kochi', 'Kerala', '682001', 'India'),
('Anjali', 'Das', 'anjali.das@example.com', '9876543213', '101 Salt Lake', 'Kolkata', 'West Bengal', '700001', 'India'),
('Ravi', 'Patel', 'ravi.patel@example.com', '9876543214', '55 Nehru Street', 'Ahmedabad', 'Gujarat', '380001', 'India'),
('John', 'Doe', 'john.doe@example.com', '9876543215', '123 Elm Street', 'Los Angeles', 'California', '90001', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543216', '456 Maple Avenue', 'Austin', 'Texas', '73301', 'USA'),
('Michael', 'Brown', 'michael.brown@example.com', '9876543217', '789 Pine Lane', 'New York', 'New York', '10001', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '9876543218', '101 Ocean Drive', 'Miami', 'Florida', '33101', 'USA'),
('Chris', 'Johnson', 'chris.johnson@example.com', '9876543219', '55 River Street', 'Chicago', 'Illinois', '60601', 'USA');

select * from customer;

#1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
#Then perform the SELECT operation for the customer_info view. 

create view Customer_Info 
as
select concat(First_name, ' ', Last_name) as 'Full name', Email  from customer;

select * from customer_info;

#2. Create a view named US_Customers that displays customers located in the US. 
create view US_Customer 
as
select * from customer where country = 'USA';

select * from US_Customer;

#3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
create view Customer_details
as
select concat(first_name, ' ', last_name) as 'full name', email, phone_no, state from customer;

select * from Customer_details;

#4. Update phone numbers of customers who live in California for Customer_details view. 
update customer set phone_no = '448562367856' where state = 'California';

select * from Customer_details where state = 'California';

#5. Count the number of customers in each state and show only states with more than 5 customers. 
select State, count(customer_id)  from customer group by state having count(customer_id) > 5;

#6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
select State, count('full name') from Customer_details group by state;

#7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state;