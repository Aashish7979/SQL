CREATE TABLE IF NOT EXISTS family
(
    member_id       VARCHAR(10) PRIMARY KEY
  , name     VARCHAR(50)
  , age			INTEGER
  , parent_id		  VARCHAR(20)
);

--------------------------------------------

INSERT INTO family VALUES
('F1','David', 4, 'F5'),
('F2','Carol', 10, 'F5'),
('F3','Michael', 12, 'F5'),
('F4','Johnson', 36, ' '),
('F5','Maryam', 40, 'F6'),
('F6','Stewart', 70, ' '),
('F7','Rohan', 6, 'F4'),
('F8','Asha', 8, 'F4')
;


-----------------------------------------------------
-- Inner Join
--Fetch employees and their departments 

Select * from employee

Select * from department

select emp_name, d.dept_name
from employee e JOIN department d
ON e.dept_id = d.dept_id; 

-------------------------------------------------------
--Left Outer Join 
--Fetch all the employees and their departments 

Select * from employee

Select * from department

select emp_name, d.dept_name
from employee e LEFT JOIN department d
ON e.dept_id = d.dept_id; 

----------------------------------------------------------
--Right Join
--Fetch all the depatments and the employees who work in depat. 

Select * from employee
Select * from department

select emp_name, d.dept_name
from employee e Right JOIN department d
ON e.dept_id = d.dept_id; 


---------------------------------------------------------------------------

--Fetch details of all emp, their manager, their department and the projects they work on. 

Select * from employee;
select * from department;
select * from manager; 
select * from project; 

select emp_name, d.dept_name, m.manager_name, p.project_name
from employee e LEFT JOIN department d
ON e.dept_id = d.dept_id 
JOIN manager m ON m.manager_id = e.manager_id
LEFT JOIN project p ON e.emp_id = p.team_member_id 


---------------------------------------------------------------------------------------------------------
--Full outer Join

Select * from employee;
select * from department;

select emp_name, d.dept_name
from employee e Full JOIN department d
ON e.dept_id = d.dept_id; 

-----------------------------------------------------------------------------------------------

--CROSS Join
--Cartesian Product 


Select * from employee;
select * from department;

select emp_name, d.dept_name
from employee e CROSS JOIN department d


------------------------------------------------------------------------------------------------
--Natural Join
--SQL will decide what is the join condition and not by the user. 

Select * from employee;
select * from department;

select e.emp_name, d.dept_name
from employee e Natural JOIN department d ;


-------------------------------------------------------------------------------------------
--Self join 
--Write a querry to fetch the child name and their age corresponding to their parent name and parent age 

Select * from family 

Select child.name as child_name, 
child.age as child_age,
parent.name as parent_name,
parent.age as parent_age
from family as child join family as parent 
on child.parent_id = parent.member_id

---------------------------------------------------------------------------------------------------------------













