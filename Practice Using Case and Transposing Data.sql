Select a.category, count(*) from 
(Select first_name, salary,
CASE
	When salary < 100000 then 'under paid'
	When salary > 100000 AND salary < 160000 then 'well paid'
	When salary > 160000 then 'Executive'
	ELSE 'Unpaid' 
END as category
from employees 
order by salary desc) a
group by a.category

-------------------------------------------------------------------------------------------------------------------

select sum(CASE when salary < 100000 then 1 else 0 end) as under_paid,
sum(CASE when salary > 100000 AND salary < 150000 then 1 else 0 end) as well_paid,
sum(CASE when salary > 150000 then 1 else 0 end) as Executive 
from employees

---------------------------------------------------------------------------------------------------

Select sum(case when department = 'Sports' then 1 else 0 end) as sports_dep,
sum(case when department = 'Tools' then 1 else 0 end) as tools_dep,
sum(case when department = 'Clothing' then 1 else 0 end) as clothing_dep,
sum(case when department = 'Computers' then 1 else 0 end) as Computer_dep
from employees
-------------------------------------------------------------------------------------------------

Select department, count(*)
from employees 
where department in('Sports', 'Tools', 'Clothing', 'Computers')
Group by department



-----------------------------------------------------------------------------------------------------------

Select united_states + Asia + Canada from (
Select Count(a.region_1) + count(a.region_2) + count(a.region_3) as united_states,
Count(a.region_4) + count(a.region_5) as Asia,
Count(a.region_6) + count(a.region_7) as Canada from (
select first_name,
CASE when region_id = 1 then (select country from regions where region_id = 1) end region_1,
CASE when region_id = 2 then (select country from regions where region_id = 2) end region_2,
CASE when region_id = 3 then (select country from regions where region_id = 3) end region_3,
CASE when region_id = 4 then (select country from regions where region_id = 4) end region_4,
CASE when region_id = 5 then (select country from regions where region_id = 5) end region_5,
CASE when region_id = 6 then (select country from regions where region_id = 6) end region_6,
CASE when region_id = 7 then (select country from regions where region_id = 7) end region_7
from employees 
) a 
) b


----------------------------------------------------------------------------------------------------------









