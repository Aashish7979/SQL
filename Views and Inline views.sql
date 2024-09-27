----Views 
--You cannot insert data into the view
--You cannot delete the data 
--It is a virtual table 
--Its a querry not a actual table 
--It acts as a data source 

create view v_employee_information as 
Select first_name, e.department, salary, division, region, country 
from employees e, departments d, regions r
Where e.department = d.department
And e.region_id = r.region_id

Select * from v_employee_information

---------------------------------------------------------------------------------

--Inline View
--Is a subquerry or corelated querry

select * 
from (select * from departments)



----------------------------------------------------------------------------------------------


