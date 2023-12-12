--Module-4 Assignment
--Problem Statement:
--You have successfully cleared your 3rd semester. In the 4th semester, you will work with inbuilt functions and user-defined functions
--Tasks to be done:
--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
--2. Create a user-defined function, which will multiply the given number with 10
--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value

--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

create database assignment4
use assignment4

Create table orders(order_id int, order_date date, amount int, customer_id int);

select * from orders

insert into Orders values(10,'2020-12-26',10000,50);
insert into Orders values(20,'2021-11-27',20000,40)
insert into Orders values(30,'2022-10-28',30000,30)
insert into Orders values(40,'2019-09-29',40000,20)
insert into Orders values(50,'2018-08-30',50000,90)
Select * from Orders;

select max(amount) as max_amount from orders
select min(amount) as min_amount from orders
select avg(amount) as avg_amount from orders

--2. Create a user-defined function, which will multiply the given number with 10

create function multiply(@num int)
returns int
as begin
return(@num *10)
end

select dbo.multiply(10)

select*,dbo.multiply(amount) from orders

--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value

select
case
when 100<200 then 'SMALLER'
when 100>200 then 'GREATER'
else 'EQUAL'
end

--OR

SELECT IIF (100<200, 'SMALLER', 'GREATER')