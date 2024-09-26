--Excersices- Write a quesrry resulting in the first_name, department, hire_date and country
--of the first employee hired in the company as well as last hired employee 

(Select first_name, department, hire_date, country 
from employees e Inner join regions r
on e.region_id = r.region_id
Where hire_date = (select min(hire_date) from employees e)
limit 1)
union
Select first_name, department, hire_date, country 
from employees e Inner join regions r
on e.region_id = r.region_id
Where hire_date = (select max(hire_date) from employees e)
order by hire_date


------------------------------------------------------------------------------------------

--report Showing how the spending of salary budget. How does it fluctuate for every 90 days 
--Solve using, Co related sub-querry


select hire_date, salary,
(select sum(salary) from employees e2
	where e2.hire_date between e.hire_date - 90 and e.hire_date) as spending_pattern
from employees e
order by hire_date










