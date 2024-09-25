
--Using Union, Union all and Except clauses + excercises 


-- Union -- shows only Unique value -- stack data on each other 

select department 
from employees 
Union
select distinct department
from departments

--- union all --- shows even duplicate --- stack data on each other 

select distinct department 
from employees 
Union all
select distinct department
from departments 

---Datatypes and no. of columns should match while using Union operator 



---example of Except (Removes the results of first set of querry from the second set of querry)
---In oracle DB use Minus instead of Except 
select distinct department 
from employees 
Except
select distinct department
from departments 


------Assignment 
--Generate a report that shows the breakdown by department and total no. of employees working in those departments and total of all the employees 


Select department, count(*)
from employees
Group by department
Union all  
Select 'TOTAL', count(*)
from employees 