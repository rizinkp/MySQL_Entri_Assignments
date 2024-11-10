# Create a database called “Sales” 
create database Sales;

use Sales;

create table Orders 
(
Order_Id int primary key auto_increment, 
Customer_name varchar(50) not null, 
Product_Category varchar(100) not null, 
Ordered_item varchar(100) not null, 
Contact_No varchar(12) unique not null
);

desc Orders;

#1. Add a new column named “order_quantity” to the orders table
ALTER TABLE Orders ADD column Order_Quantity int not null;

desc Orders;

#2. Rename the orders table to the sales_orders table. 
rename table Orders to Sales_Order;

desc Sales_Order;

#3. Insert 10 rows into the sales_orders table. 
INSERT INTO Sales_Order (Customer_name, Product_Category, Ordered_item, Contact_No, Order_Quantity) VALUES
('Alice Smith', 'Electronics', 'Smartphone', '1234567890', 1),
('Bob Johnson', 'Home Appliances', 'Microwave', '0987654321', 2),
('Charlie Davis', 'Furniture', 'Dining Table', '1122334455', 1),
('Diana Evans', 'Books', 'Science Fiction Novel', '2233445566', 3),
('Evan Foster', 'Groceries', 'Organic Vegetables', '3344556677', 5),
('Fiona Green', 'Fashion', 'Leather Jacket', '4455667788', 1),
('George Harris', 'Sports', 'Basketball', '5566778899', 2),
('Holly White', 'Toys', 'Lego Set', '6677889900', 4),
('Ian Black', 'Beauty', 'Skincare Kit', '7788990011', 1),
('Julia Brown', 'Automotive', 'Car Tyres', '8899001122', 2);

select * from Sales_order;

#4. Retrieve customer_name and Ordered_Item from the sales_orders table. 
Select Customer_name, Ordered_Item from Sales_order;

#5. Use the update command to change the name of the product for any row. 
Update Sales_order set  Ordered_Item = 'Basket Ball' where Order_Id = 7;

select * from Sales_order;

#6. Delete the sales_orders table from the database.
drop table Sales_Order;

