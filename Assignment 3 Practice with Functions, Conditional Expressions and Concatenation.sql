create table professors (last_name varchar(20), department varchar(12), salary int, hire_date date)

Insert into professors (last_name, department, salary, hire_date)
Values ('Chong', 'Science', '88000', '2006-04-18'), 
('Brown', 'Math', '97000', '2002-08-22'), 
('Jones', 'History', '67000', '2009-11-17'), 
('Wilson', 'Astronomy', '110000', '2005-01-15'),
('Miller', 'Agriculture', '82000', '2008-05-08'),
('Williams', 'Law', '105000', '2001-06-05'); 

Select last_name || ' works in the ' || department || ' department' 
from professors


Select 'it is ' || (salary > 95000) || ' that professor ' || last_name || ' is higly paid'
from professors


Select last_name,Upper (substring(department,1, 3)) as department, salary, hire_date 
from professors


Select Max(salary) as highest_salary, 
Min(Salary) as lowest_salary
from professors
where last_name != 'Wilson'


Select min(hire_date) from professors

