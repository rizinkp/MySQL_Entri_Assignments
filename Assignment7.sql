#Consider the Country table and Persons table that you created earlier and perform the following: 
use Sales;

select * from Country;
select * from persons;

#1. Add a new column called DOB in Persons table with data type as Date. 
Alter table persons add column DOB date;

select * from persons;

UPDATE Persons
SET DOB = CASE Id
    WHEN 1 THEN '1990-01-01'
    WHEN 2 THEN '1983-03-15'
    WHEN 3 THEN '1992-07-20'
    WHEN 4 THEN '1988-11-05'
    WHEN 5 THEN '1995-09-10'
    WHEN 6 THEN '2000-02-28'
    WHEN 7 THEN '1987-04-12'
    WHEN 8 THEN '1991-06-25'
    WHEN 9 THEN '1985-10-30'
    WHEN 10 THEN '1993-12-18'
    WHEN 11 THEN '1989-08-14'
    WHEN 12 THEN '1994-05-22'
    WHEN 13 THEN '1998-03-09'
    ELSE DOB
END
WHERE Id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);

#2. Write a user-defined function to calculate age using DOB. 
delimiter $$
CREATE FUNCTION CalculateAge(DOB date)
returns int
deterministic
begin
#TIMESTAMPDIFF(YEAR, DOB, CURDATE()): Calculates the difference in years. DATE_FORMAT: Checks if today's month and day are before the DOB's month and day.
#Subtracts 1 if the birthday hasn't occurred this year.
return TIMESTAMPDIFF(YEAR, DOB, CURDATE()) - (DATE_FORMAT(CURDATE(), '%m-%d') < DATE_FORMAT(DOB, '%m-%d'));
end $$

#3. Write a select query to fetch the Age of all persons using the function that has been created. 
select *, CalculateAge(DOB) as Age from persons;

#4. Find the length of each country name in the Country table. 
select length(country_name) as 'Country Name Length', country_name from country;

#5. Extract the first three characters of each country's name in the Country table. 
select left(country_name, 3) as 'Country Name First 3 Character', country_name from country;

#6. Convert all country names to uppercase and lowercase in the Country table.
select upper(country_name) as 'Country Name Upper Case', lower(country_name) as 'Country Name Lower Case', country_name from country;

