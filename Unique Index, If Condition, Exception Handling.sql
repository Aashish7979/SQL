# UNIQUE Index

CREATE TABLE Employee_Detail(    
    ID int AUTO_INCREMENT PRIMARY KEY,     
    Name varchar(45),     
    Email varchar(45),    
    Phone varchar(15),     
    City varchar(25),  
    UNIQUE KEY unique_email (Email)  
);  

SHOW INDEXES FROM Employee_Detail;  

INSERT INTO Employee_Detail(ID, Name, Email, Phone, City)    
VALUES (1, 'Peter', 'peter@gmail.com', '49562959223', 'Texas'),    
			  (2, 'Suzi', 'suzi@gmail.com', '70679834522', 'California'),    
              (3, 'Joseph', 'joseph@gmail.com', '09896765374', 'Alaska');  

EXPLAIN SELECT * FROM EMPLOYEE_DETAIL WHERE Name = 'Suzi';

INSERT INTO Employee_Detail 
VALUES (4, 'Suzi', 'suzi@yahoo.com', '70679834522', 'Texas'); 

CREATE UNIQUE INDEX index_name_phone ON Employee_Detail (Name, Phone);    
SHOW INDEXES FROM Employee_Detail;  


INSERT INTO Employee_Detail(ID, Name, Email, Phone, City)   
VALUES (4, 'Joseph', 'joseph123@gmail.com', '09896765374', 'Texas');    

-------------------------------------------------------------------------------------------------------------------------------
#If condition in Stored procedures

DELIMITER //

CREATE PROCEDURE GetCustomerLevel( IN  pCustomerNumber INT,  OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
        
    ELSEIF credit > 10000 AND credit <= 50000 THEN
        SET pCustomerLevel = 'GOLD';
        
    ELSE
        SET pCustomerLevel = 'SILVER';
        
    END IF;
END //

DELIMITER ;

CALL GetCustomerLevel(447, @level); 
SELECT @level As Customer_Type;

-------------------------------------------------------------------------------------------------------------------------------------------
# Exception Handling with CONTINUE Handler

CREATE TABLE Employee 
(
     EmpID INT PRIMARY KEY,
     EmpName VARCHAR(50),
     EmailAddress VARCHAR(50)    
);


DELIMITER //
CREATE PROCEDURE InsertEmployeeDetails
(
     InputEmpID INTEGER,
     InputEmpName VARCHAR(50),
     InputEmailAddress VARCHAR(50)    
)

BEGIN 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 'Error occured';
	INSERT INTO Employee (EmpID, EmpName, EmailAddress)
	VALUES
	(InputEmpID, InputEmpName, InputEmailAddress);    
 
 SELECT *FROM Employee;
 
END // 

DELIMITER ;


CALL InsertEmployeeDetails (1,'Anvesh','anvesh@gmail.com');
CALL InsertEmployeeDetails (1,'Roy','Roy@gmail.com');

  

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Exception Handling with EXIT Handler
CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);

DELIMITER //
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
 	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred !!!') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END //

DELIMITER ;

CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);

CALL InsertSupplierProduct(1,3);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Exception Handling for NOT FOUND

CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);

DELIMITER //
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
 	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred !!!') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END //

DELIMITER ;

CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);

CALL InsertSupplierProduct(1,3);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Exception Handling with SET IsError=1

# Exception Handling with SET IsError=1

CREATE TABLE Employee 
(
     EmpID INT PRIMARY KEY,
     EmpName VARCHAR(50),
     EmailAddress VARCHAR(50)    
);

DELIMITER //
CREATE PROCEDURE InsertEmployeeDetails
(
     InputEmpID INTEGER,
    InputEmpName VARCHAR(50),
    InputEmailAddress VARCHAR(50),
    OUT IsError INT
)

BEGIN 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET IsError=1;
	INSERT INTO Employees (EmpID, EmpName, EmailAddress)
	VALUES
	(InputEmpID, InputEmpName, InputEmailAddress);    
 
 SELECT *FROM Employee;
END 
// DELIMITER ;


CALL InsertEmployeeDetails (1,'Anvesh','anvesh@gmail.com',@IsError);
SELECT @IsError;



