select department 
from departments
where 38 < (select count (*)
			from employees e
			where e.department = departments.department)


select department 
from departments d 
where 38 < (select count (*)
			from employees e
			where e.department = d.department)

select department 
from employees e1
where 38 < (select count (*)
			from employees e2
			where e1.department = e2.department)




select Distinct department 
from employees e1
where 38 < (select count (*)
			from employees e2
			where e1.department = e2.department)



select department 
from employees e1
where 38 < (select count (*)
			from employees e2
			where e1.department = e2.department)
Group by department


select department, (Select max(salary) from employees where department = d.department) 
from employees d
where 38 < (select count (*)
			from employees e2
			where d.department = e2.department)




--------------------------------------------------------------------


Select first_name, salary
from employees e1
where salary > (select round(avg(salary)) 
				from employees e2 where e1.department = e2.department)



Select first_name, salary
from employees e1
where salary > (select round(avg(salary)) 
				from employees e2 where e1.region_id = e2.region_id)



Select first_name, department, salary,
(select round(avg(salary)) 
				from employees e2 where e1.department = e2.department) as avg_dep_sal
from employees e1


----------------------------------------------------------------------------------------------------------------------------


Select department, first_name, salary,
Case when salary = max_by_dept then 'Highest salary'
	When salary = min_by_dept then 'Lowest salary'
End as salary_in_dept
from (
Select department, first_name, salary,
		(select max(salary) from employees e2 
		where e1.department = e2.department) as max_by_dept,
		(select min(salary) from employees e2 
		where e1.department = e2.department) as min_by_dept
From employees e1 
) a 
where salary = max_by_dept 
	or salary = min_by_dept
order by department 






































































				