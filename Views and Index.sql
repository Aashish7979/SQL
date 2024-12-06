--Views
--Create Views
CREATE VIEW USACustomers AS
	SELECT customerNumber, customerName, country
    FROM Customers
    WHERE country = "USA"; 

SELECT * FROM USACustomers; 

-----------------------------------------------------------------------------------
--Alter Views

ALTER VIEW USACustomers AS 
	SELECT customerNumber, customerName, country
    FROM Customers
    WHERE country IN ("USA", "UK") 
    ORDER BY country; 
    
SELECT * FROM USACustomers; 
----------------------------------------------------------------------------------
--Drop Views 

DROP VIEW USACustomers; 

-------------------------------------------------------------------------------------
--Indexes 

SELECT COUNT(*) FROM Customers; #122 rows

SELECT COUNT(*) FROM customers WHERE country="USA"; #36 rows

EXPLAIN SELECT * FROM Customers WHERE country="USA";

SHOW INDEXES FROM Customers; 

CREATE INDEX country_index ON Customers(country); 

EXPLAIN SELECT * FROM Customers WHERE country="USA";

DROP INDEX country_index ON Customers; 

