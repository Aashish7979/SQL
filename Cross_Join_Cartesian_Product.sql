--Cartesian Join - the cartesian product is really a cross-join 
--which returns all the rows in all the tables listed in a query: 
--each row in the first table is paired with all the rows in the second table. 
--This happens when there is no relationship defined between the two tables.
-- Multiplies the First table with the Second table 
-- It gives all the combinations 

Select *
from employees Cross join departments 