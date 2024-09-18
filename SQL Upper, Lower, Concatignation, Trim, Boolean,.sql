select * 
From employees


Select Upper(first_name)
From employees 

select lower(department)
from employees

select length(first_name)
from employees

Select ('   Hello there   ')

Select Trim ('   Hello there   ')


Select Length(trim ('   Hello there   '))


Select first_name ||' '|| last_name as full_name 
from employees 


Select first_name ||' '|| last_name as full_name, department
from employees


Select first_name ||' '|| last_name as full_name, (salary > 140000)
from employees

Select first_name ||' '|| last_name as full_name, (salary > 140000)
from employees
order by salary desc
















