--Table Joins

select first_name, country
from employees, regions
where employees.region_id = regions.region_id

--Without Alias

select first_name, email, employees.department, division, country
from employees, departments, regions
where employees.department = departments.department
And employees.region_id = regions.region_id
And email is not null

--with alias 

select first_name, email, e.department, division, country
from employees e, departments d, regions r
where e.department = d.department
And e.region_id = r.region_id
And email is not null


--- Table with country and total count of employees assigned to that country

Select country, count(employee_id)
From employees e, regions r
Where e.region_id = r.region_id
group by country


------------------------------------------------------------------------------------------------

--Inner Joins with Syntax 

select first_name, country
from employees inner join regions
On employees.region_id = regions.region_id

select first_name, email, division
from employees inner join departments
on employees.department = departments.department
Where email is not null

select first_name, email, division, country
from employees inner join departments
on employees.department = departments.department
inner join regions on employees.region_id = regions.region_id
Where email is not null

-------------------------------------------------------------------------------

--Outer join 

Select distinct department from employees
-- 27 departments

Select distinct department from employees 
-- 24 departments 

-- example of left outer join (Priority to left side of the table)

select distinct e.department as empl_dept, d.department as dep_deprt
from employees e left join departments d
on e.department = d.department 

-- example of right outer join (Priority to right side of the table)

select distinct e.department as empl_dept, 
				d.department as dep_deprt
from employees e right join departments d
on e.department = d.department 

----- Assignment - Show only those depts that exist in the employees table but do not exist in the dept table 

select distinct e.department as empl_dept
from employees e left join departments d
on e.department = d.department 
where d.department is null

----example of Full outer join 

Select distinct e.department as empl_dept, 
				d.department as dep_dept
from employees e Full outer join departments d
on e.department = d.department






























