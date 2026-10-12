create database company;

use company;

-- create table

create  table customerr(
  customer_id int ,
  customer_name varchar (40),
  city varchar(30),
  segment varchar(60));
  
  -- insert data
  
  insert into customerr
  values
(101,"Rahul","Pune"	,"Consumer"),
(102,"Priya","Mumbai","Corporate"),
(103,"Amit","Delhi"	,"Consumer"),
(104,"Sneha","Pune","HomeOffice"),
(105,"Rohan","Bangalore","Corporate"),
(106,"Neha","Mumbai","Consumer"),
(107,"Karan","Delhi","HomeOffice"),
(108,"Pooja","Pune"	,"Corporate");
select * from  customerr;

create table products(
product_id int,
product_name varchar(30),
category varchar(30),
price int);

insert into products
values
(201 ,"Laptop",	"Technology",	60000),
(202,	"Mouse",	"Technology",	800),
(203,	"Keyboard",	"Technology",	1500),
(204,	"Chair"	,"Furniture"	,7000),
(205,	"Table",	"Furniture",	12000),
(206	,"Notebook"	,"OfficeSupplies"	,300),
(207,	"Printer",	"Technology",	15000),
(208,	"Pen",	"OfficeSupplies"	,5);

create table orders(
order_id int,
customer_id int,
product_id int,
order_date int,
quantity int,
sales int);

insert into orders
values
(1001	,101,	201,	2026-01-05,	1	,60000),
(1002,	102	,204,	2026-01-08	,2	,14000),
(1003,	103,	200,	2026-01-12,	1,	800),
(1004	,101 ,202,	2026-02-03,	3,	2400),
(1005,	104,	205,	2026-02-10,	1,	12000),
(1006,	105,	207	,2026-02-15	,2	,30000),
(1007,	106	,206,	2026-03-01,	5,	1500),
(1008	,07,	201,	2026-03-05,	1,	60000),
(1009,	108,	203,	2026-03-10,	4,	6000),
(1010,	102,	208,	2026-03-15,	10	,500),
(1011	,103,	204,	2026-04-02,	1,	7000),
(1012	,105,	201,	2026-04-10,	1,	60000),
(1013,	101,	207,	2026-04-15	,1,	15000),
(1014,	106,	202,	2026-05-01,	5,	4000),
(1015	,108,	205,	2026-05-10	,2,	24000);

-- Q1 . find all orders where salesare greater than 10000?
select * from orders where sales >10000;

-- Q2 find total sales of all orders?
select sum(sales)as total_sales from orders;

-- Q3 display customerr who belong to pune mumbai?
select * from customerr where city in("mumbai","pune");

-- Q4.find highest and  lowest sales values ?
select max(sales) as highest_sales,
min(sales)as lowest_sales from orders;

-- Q5. find total sales for each customerr?
select customer_id ,sum(sales) as total_sales from orders
group by customer_id 
order by total_sales desc; 

-- Q6. find customerr whose sales are greater than 20000?
select 
customer_id,
sum(sales) as total_sales
from orders
group by customer_id
having sum(sales)> 20000;

-- Q7. count the number of customerr in each  city?
select
city,count(*) as total_customer
from customerr
group by city
order by total_customer desc;


-- Q8. display each order with customerr's name ?
select 
o.order_id,
c.customer_name,
o.order_date,
o.sales
from orders o
 inner join customerr c
on o.customer_id= c. customer_id;


-- Q9.display products names and their total sales?
select 
p.product_name,
sum(o.sales)as total_sales
from products p
inner join orders o
on p.product_id =o.product_id
group by p.product_id, p. product_name
order by total_sales desc;


-- Q10. find products that have never been recorded?
select
p.product_id,
p.product_name
from products p 
left join orders o 
on p. product_id = o.product_id
where o.order_id is null;
