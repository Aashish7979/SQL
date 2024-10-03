--Subquerries and correlated subquerries 

--Subquerry or inner querry
--Find the employees who's salary is more than the average salary earned by all employees 
--1. Find the avg salary
--2. Filter the employees who's salary is more than the average salary

select * from employee; 
select * from department; 

Select * 
from employee 
where salary > (select avg(salary) from employee); 

--Differnet types of subquerries
--3 types
-- Scalar subquerry
--Multiple row subquerry
--Correlated subquerry 

-------------------------------------------------------------------------------------------

-- Scalar subquerry
--It always returns 1 row and 1 column. 

--Subquerry in a Where clause 

Select * 
from employee 
where salary > (select avg(salary) from employee); 

--Subquerry in a From clause

Select e.* 
from employee e
JOIN (select avg(salary) sal from employee) avg_sal
	ON e.salary > avg_sal.sal  

-----------------------------------------------------------------------------------------

--Multiple row subquerry  - 2 types
-- subquerry which returns Multiple Column and Multiple Row 
-- subquerry which returns only 1 column and multiple rows 

--Find the employee who earn the highest salary in each department

-- subquerry which returns Multiple Column and Multiple Row
select * 
from employee
where (dept_name, salary) in (select dept_name, max(salary)
								from employee 
								group by dept_name); 


-- subquerry which returns only 1 column and multiple rows 
--Find department who do not have any employees 

select *
from department
where dept_name NOT IN (select distinct dept_name from employee)

-------------------------------------------------------------------------------------------------------------------------------

--Correlated subquerry 
--A subquerry which is related to the outer querry 
--Correlated subquerries are slow 
--Find the employees in each department who earn more than the average salary in that department  


select *
from employee e1
where salary > (select avg(salary)
				from employee e2 
				where e2.dept_name = e1.dept_name); 

--Find department who do not have any employees 

select *
from department d
where not exists (select 1 from employee e 
				  Where e.dept_name = d.dept_name) 


--------------------------------------------------------------------------------

--Nested Subquerry 
--Find stores who's sales where better than the average sales accross all stores 

select * 
from (select store_name, sum(price) as total_sales
	  from sales
	  group by store_name) sales 
join(select avg(total_sales) as sales 
	from (select store_name, sum(price) as total_sales
		  from sales
		  group by store_name) x) avg_sales 
	on sales.total_sales > avg_sales.sales; 


--Using with clause

with sales as 
	(select store_name, sum(price) as total_sales
		  from sales
		  group by store_name)
Select *
from sales
join (select avg(total_sales) as sales 
	from sales x) avg_sales
	on sales.total_sales > avg_sales.sales;
	

---------------------------------------------------------------------

-- 4 different types of clauses where subquerry can be used 

--Select, From, Where and Having 

-------------------------------------------------------------------------

--Subquerries can be used in different commands 
--Insert, Update, Delete and SQL querry

------------------------------------------------------------------







