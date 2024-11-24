#(1)Perform inner join, Left join, and Right join on the tables. 
#Inner join
select * from Country c inner join Persons p on p.country_id = c.country_id;
#Left join
select * from Country c left join Persons p on p.country_id = c.country_id;
#Right join
select * from Country c right join Persons p on p.country_id = c.country_id;

#(2)List all distinct country names from both the Country and Persons tables. 
select distinct Country_name from Country
union
select distinct Country_name from Persons;


#(3)List all country names from both the Country and Persons tables, including duplicates. 
select Country_name from Country
union all
select Country_name from Persons;

#(4)Round the ratings of all persons to the nearest integer in the Persons table.
select round(Rating) from persons;