# Stored Procedure - Without Parameters

DELIMITER //

CREATE PROCEDURE CustomersWithOrders ()
BEGIN

	SELECT DISTINCT(customerNumber), customerName, country
    FROM Customers
    JOIN Orders
    USING (customerNumber);
    
END //

DELIMITER //

CALL CustomersWithOrders();

---------------------------------------------------------------------------------------------------------------------
# Stored Procedure - With (IN) Parameter
DELIMITER // 
CREATE PROCEDURE CustomersWithOrdersInParam(IN param_country1 VARCHAR(50),
											IN param_country2 VARCHAR(50),
                                            IN param_country3 VARCHAR(50)
                                            )
BEGIN
SELECT DISTINCT(customerNumber), customerName, country
    FROM Customers
    JOIN Orders 
    USING (customerNumber)
    WHERE country IN(param_country1, param_country2, param_country3)
    ORDER BY country; 

END // 

CALL CustomersWithOrdersInParam("Australia", "Canada", "UK"); 

--------------------------------------------------------------------------------------------------------------------
# Stored Procedure - With (OUT) Parameter
DELIMITER // 
CREATE PROCEDURE CustomersWithOrdersOutParam(IN param_status VARCHAR(50), OUT total INT)
                                            
BEGIN
	SELECT COUNT(*) INTO total
    FROM Orders
    WHERE status = param_status;

END // 

CALL CustomersWithOrdersOutParam("Shipped",@abc);
SELECT @abc as result;

----------------------------------------------------------------------------------------------------------------------
# Stored procedures with (INOUT) paramenter
DELIMITER // 
CREATE PROCEDURE Aashish(INOUT X INT, IN Y INT)

BEGIN

SET X=X+Y;

END //

SET @def=1;
CALL Aashish(@def,5);
SELECT @def AS Result; 

CALL Aashish(@def,5);
SELECT @def AS Result; 

CALL Aashish(@def,5);
SELECT @def AS Result; 

