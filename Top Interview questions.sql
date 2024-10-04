--TOP 9 SQL querries for interview (https://www.youtube.com/watch?v=UlXtfq-kuF4)

--Fetch the 3rd highest salary
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 2,1;

--Fetch 2nd Highest salary
SELECT MAX(salary) FROM employees
WHERE salary<(SELECT MAX(SALARY) FROM employees)

----------------------------------------------------------------------------------------------------------
--Write a querry to find the Nth highest salary from the table without using Limi/Top keyword 

SELECT salary 
FROM employees e1
WHERE (N-1) = 
(SELECT COUNT(DISTINCT salary)
FROM employee e2 
WHERE e2.salary>e1.salary) 


WITH RankedSalaries AS (
    SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT salary
FROM RankedSalaries
WHERE rank = N;

-------------------------------------------------------------------------------------------
--Write SQL querry to find duplicate rows in a table 

SELECT *, COUNT(employee_id)
FROM employees 
GROUP BY employee_id
HAVING COUNT(employee_id) > 1

------------------------------------------------------------------------------------------------------

--Write a querry to calculate the even and odd records from a table. 

--EVEN
SELECT * from employees
WHERE MOD(employees, 2) = 0;

--ODD
SELECT * from employees 
WHERE MOD(employees, 2) = 1; 

-----------------------------------------------------------------------------------------------------------

--Write a querry to display the first and the last record from the Employee table 

--For first record 
SELECT * FROM employees
WHERE employee_id = (SELECT MIN(employee_id)
FROM employees); 

--For last record 
SELECT * FROM employees
WHERE employee_id = (SELECT MAX(employee_id)
FROM employees);

------------------------------------------------------------------------------------------------

--How do you copy all rows of a table using SQL querry? 

CREATE TABLE EmpDetail AS SELECT * FROM employees; --For copying all the data

CREATE TABLE EmpSalary AS SELECT employee_id, salary 
FROM employees; -- For copying only specific columns  

Select * FROM EmpDetail; 
DROP table EmpDetail; 

CREATE TABLE EmpDetail AS 
SELECT * FROM employees
WHERE 3=4; --For copying only schema 
---------------------------------------------------------------------------------------------
--Write a querry to retrive the list of employees working in the same department 

SELECT DISTINCT e.employee_id, e.first_name, e.department
FROM employees e, employees e1
WHERE e.department = e1.department 
AND e.employee_id = e1.employee_id 

---------------------------------------------------------------------------------------------------------

--Write a querry to retrive the last 3 records from the employees table

SELECT * FROM(SELECT * FROM employees
ORDER BY employee_id DESC 
LIMIT 3) temp ORDER BY employee_id ASC;  

SELECT * FROM temp ORDER BY employee_id ASC; 

--------------------------------------------------------------------------------------------------------------------

-- Write a querry to fetch details of employees whose last_name ends with an alphabet 'A' 
-- And contains five alphabets. 

SELECT * FROM employees
WHERE last_name like '____a'; 

------------------------------------------------------------------------------------------------------

--Top 10 SQL interview Questions and Answers (https://www.youtube.com/watch?v=Iv9qBz-cyVA )

--How to find duplicates in a given table 
SELECT *, COUNT(employee_id)
FROM employees 
GROUP BY employee_id
HAVING COUNT(employee_id) > 1

--How to delete the duplicates in a given table 
WITH CTE AS 
(SELECT *, row_number() 
			OVER (PARTITION BY employee_id 
			ORDER BY employee_id) 
			AS rn FROM employees)
DELETE FROM CTE WHERE rn > 1

--Difference between UNION and UNION ALL
--UNION ALL (returns all records even the duplicates) - merges table 
SELECT manager_id FROM emp
UNION ALL 
SELECT manager_id FROM empl1 

--UNION (returns only unique records) - merges table 
SELECT manager_id FROM emp
UNION  
SELECT manager_id FROM empl1 

-- Differnce berween rank, row_number and dense_rank

-- employees who are not present in the department table
SELECT * FROM EMPLOYEES 
WHERE department_id 
NOT IN (SELECT department_id FROM department) 

or 

SELECT employees*, departments.dept_name FROM EMPLOYEES
LEFT JOIN department 
ON employees.department_id = departments.department_id
WHERE departments.dep_name IS NULL 

--Second highest salary in each department 

SELECT * FROM
(SELECT employees.* , 
DENSE_RANK() OVER(PARTITION BY dept_id 
			ORDER BY salary DESC) as rn 
FROM employees) a 
WHERE rn=2

--Find all transactions done by Shilpa 
SELECT * 
FROM orders 
WHERE customer_name = 'Shilpa'

or 

SELECT * 
FROM orders 
WHERE UPPER(customer_name) = 'SHILPA'

--SELF JOIN, manager salary > emp salary

--JOIN LEFT/ INNER JOIN

--Update querry to swap gender 

UPDATE orders 
SET customer_gender= 
	CASE 
		WHEN customer_gender ='Male' THEN 'Female'
		WHEN customer_gender ='Female' THEN 'MALE' 
	END

-------------------------------------------------------------------------------------------------

--Top SQL interview Questions and Answers (https://www.youtube.com/watch?v=AZzTHWF7tEc) 

--What is the Order of Execution in SQL?
FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT 

--FIND Monthly sales and SORT it by desc order  
SELECT EXTRACT(year from order_date) as years, to_char(order_date, 'Mon') AS months,
SUM(Sales) AS TotalSales
FROM products
GROUP BY 1, 2
ORDER BY 3 DESC 

--Find the candidates best suited for an open Data Science job. Find candidates who are proefficient 
--in Python, SQL, and Power Bi
--Write a querry to list the candidates whoe possess all of the required skills
--for the job. sort the output by candidate id in asc order 

SELECT candidate_id, COUNT(skills) as skillcount
FROM Applications
WHERE skills IN ('Python', 'SQL', 'Power BI')
GROUP BY candidate_id
HAVING COUNT(skills) = 3
ORDER BY candiate_id ASC  

--(https://www.youtube.com/watch?v=OddSz0T85nc&list=PLqM7alHXFySGweLxxAdBDK1CcDEgF-Kwx&index=2)
--Department wise highest Salary 

SELECT MAX(salary), dept_no
FROM employees 
GROUP BY dept_no

SELECT COUNT(*), dept_no
FROM employees
GROUP BY dept_no

--Display Alternate Records 
SELECT row_number(), employee_no, first_name 
