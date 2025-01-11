# Before Insert Trigger

CREATE TABLE employee(  
    name VARCHAR(45) NOT NULL,    
    occupation VARCHAR(35) NOT NULL,    
    working_date DATE,  
    working_hours INT
);  

INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

SELECT * FROM employee;

DELIMITER &&
CREATE TRIGGER before_insert_empworkinghours   
BEFORE INSERT ON employee FOR EACH ROW  
BEGIN  
IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;  
END IF;  
END &&


INSERT INTO employee VALUES    
('Markus', 'Farmer', '2020-10-08', 14);  

INSERT INTO employee VALUES    
('Alexander', 'Actor', '2020-10-12', -13);  

SELECT * FROM employee;

SHOW TRIGGERS;

DROP TRIGGER before_insert_empworkinghours;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# After Insert Trigger 

CREATE TABLE emp(
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(20),
Age INT
);

CREATE TABLE Emp_Audit(
ID INT PRIMARY KEY AUTO_INCREMENT,
Audit_Description VARCHAR(500)
);

DELIMITER //
CREATE TRIGGER AfterInsertEmp
AFTER INSERT ON emp
FOR EACH ROW
BEGIN
INSERT INTO emp_audit VALUES
(NULL, CONCAT('A row has been inserted in Employee table at ', DATE_FORMAT(NOW(), '%d-%m-%Y %h:%i:%s %p')));
END //

SELECT * FROM EMP;
SELECT * FROM EMP_AUDIT;

INSERT INTO EMP VALUES(NULL, 'Anil', 32);

INSERT INTO EMP VALUES(NULL, 'Kedar', 25);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Before Update Trigger 

CREATE TABLE sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2003 Harley-Davidson Eagle Drag Bike',120, 2020,1),
    ('1969 Corvair Monza', 150,2020,1),
    ('1970 Plymouth Hemi Cuda', 200,2020,1);

DELIMITER $$

CREATE TRIGGER before_sales_update
BEFORE UPDATE
ON sales FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new quantity ',
                        NEW.quantity,
                        ' cannot be 3 times greater than the current quantity ',
                        OLD.quantity);
                        
    IF new.quantity > old.quantity * 3 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$

DELIMITER ;


UPDATE sales 
SET quantity = 150
WHERE id = 1;

UPDATE sales 
SET quantity = 500
WHERE id = 1;

-----------------------------------------------------------------------------------------------------------------------------------------
# After Update Trigger

CREATE TABLE Sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);

SELECT * FROM Sales;

CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_sales_update
AFTER UPDATE
ON sales FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$

DELIMITER ;


UPDATE Sales 
SET quantity = 350
WHERE id = 1;

SELECT * FROM SalesChanges;

SET SQL_SAFE_UPDATES=0;


UPDATE Sales 
SET quantity = CAST(quantity * 1.1 AS UNSIGNED);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Before Delete Trigger

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);


INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (1002,'2000-01-01',50000),
    (1056,'2000-01-01',60000),
    (1076,'2000-01-01',70000);


CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);

DELIMITER $$
CREATE TRIGGER before_salaries_delete
BEFORE DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    

DELIMITER ;



DELETE FROM salaries WHERE employeeNumber = 1002;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# After Delete Trigger 

# After Delete Trigger

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);

INSERT INTO Salaries(employeeNumber,salary)
VALUES (1002,5000), (1056,7000), (1076,8000);

CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);

INSERT INTO SalaryBudgets(total)
	SELECT SUM(salary)  FROM Salaries;


DELIMITER //
CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON Salaries FOR EACH ROW
BEGIN
UPDATE SalaryBudgets 
SET total = total - old.salary;
END //

DELIMITER ;

DELETE FROM Salaries WHERE employeeNumber = 1002;

-----------------------------------------------------------------------------------------------------------------------------------------------


