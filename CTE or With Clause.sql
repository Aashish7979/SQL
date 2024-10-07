--SQL WITH Clause | How to write SQL --Queries using WITH Clause | SQL CTE (Common Table Expression)
--Fetch employees who earn more than average salary of all employees 
--(https://www.youtube.com/watch?v=QNfnuK-1YYY&list=PLavw5C92dz9Ef4E-1Zi9KfCTXS_IN8gXZ&index=13)

-- using subquerries 

SELECT * 
FROM employee 
Where salary > (SELECT ROUND(AVG(salary)) FROM employee)

--using with clause 


WITH average_salary (avg_sal) as
		(SELECT CAST(AVG(salary) as INT) FROM employee)
SELECT * 
FROM employee e, average_salary av
Where e.salary > av.avg_sal

----------------------------------------------------------------------------------------------------------------------

--Find stores who's sales where better than the average sales accorss all stores

SELECT * from sales 

Create table sales 

	(store_id int, store_name varchar(50), product varchar(50), quantity int, cost int)

Insert into sales Values
	(1, 'Apple Originals 1', 'iPhone 12 Pro', 1, 1000),
	(1, 'Apple Originals 1', 'MacBook pro 13', 3, 2000),
	(1, 'Apple Originals 1', 'Airpods Pro', 2, 280),
	(2, 'Apple Originals 1', 'iPhone 12 Pro', 2, 1000),
	(3, 'Apple Originals 1', 'iPhone 12 Pro', 1, 1000),
	(3, 'Apple Originals 1', 'MacBook Pro 13', 1, 2000),
	(3, 'Apple Originals 1', 'MacBook Air', 4, 1100),
	(3, 'Apple Originals 1', 'iPhone 12', 2, 1000),
	(3, 'Apple Originals 1', 'Airpods Pro', 3, 280),
	(4, 'Apple Originals 1', 'iPhone 12 Pro', 2, 1000),
	(4, 'Apple Originals 1', 'MacBook Pro 13', 1, 2500);

-- using subquerries

Select *
from (select s.store_id, sum(cost) as total_sales_per_store
	from sales s
	group by s.store_id) total_sales
Join  (select round(avg(total_sales_per_store)) as avg_sales_for_all_stores
	  from (select s.store_id, sum(cost) as total_sales_per_store
	   from sales s
	   group by s.store_id) x) avg_sales 
	 on total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_stores

--Using with clause 

with Total_sales (store_id, total_sales_per_store) as
		(select s.store_id, sum(cost) as total_sales_per_store
		from sales s
		group by s.store_id),
	avg_sales (avg_sales_for_all_stores) as 
		(select round(avg(total_sales_per_store)) as avg_sales_for_all_stores
	  	from Total_sales)
select *
from Total_sales ts
join avg_sales av
on ts.total_sales_per_store > av.avg_sales_for_all_stores































