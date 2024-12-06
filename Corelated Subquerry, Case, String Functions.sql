#Show the products from each product line if the buyPrice value is more than the avg buyprice value for that productLine. 
SELECT productName, productLine, buyPrice
FROM Products T1
WHERE buyPrice >= (SELECT AVG(buyPrice) FROM Products T2
				   WHERE T1.productLine = T2.ProductLine)
ORDER BY productLine, buyPrice DESC; 

#CASE STATEMENT
SELECT priceEach,
CASE
	WHEN priceEach BETWEEN 0 AND 100.99 THEN 'Low Price'
    WHEN priceEach BETWEEN 101 AND 200.99 THEN 'Medium Price'
	ELSE 'High Price' 
END AS price_status
FROM Orderdetails
ORDER BY priceEach DESC; 

#String function
#ASCII
SELECT ASCII('A') AS Result;

#CHAR Lenght
SELECT CHAR_LENGTH('India') AS Result; 

#CONCAT
SELECT CONCAT('The population of India', ' is ', '140 Crores.') AS Result; 

#Format 
SELECT FORMAT(20134.678,2) AS Result; 

#INSERT
SELECT INSERT('twitter.com',1,0,'www.') AS Result; 

#INSTR
SELECT INSTR('Good Morning','M') AS Result; 

#LOCATE
SELECT LOCATE('M','Good Morning') AS Result; 

#POSITION
SELECT POSITION('M'IN'Good Morning') AS Result; 

#Lower/Upper
SELECT Lower('Amazon') AS Result;
SELECT Upper('Amazon') AS Result; 

#LEFT/RIGHT
SELECT LEFT("United States of America", 13) as Result; 
SELECT Right("United States of America", 7) as Result; 

#LPAD/RPAD
SELECT LPAD('Shubham',11,'Mr. ') AS Result;
SELECT RPAD('Shubham ',11,'Sir') AS Result;

#LTRIM/RTRIM/TRIM
SELECT('        abc         ') AS Result; 
SELECT Ltrim('        abc         ') AS Result;
SELECT Rtrim('        abc         ') AS Result;
SELECT trim('        abc         ') AS Result; 

#Substring
SELECT Substring('United States of America',8) AS Result;
SELECT Substring('United States of America',8,6) AS Result;  
SELECT Substring('United States of America',-7) AS Result; 
SELECT Substring('United States of America',-17) AS Result; 

#Replace
SELECT Replace('USA is the powerful country. USA is one amoung the highest economies in the world.','USA','India') AS Result;

#Reverse
SELECT Reverse('MySql') AS Result; 

#Substring index
SELECT substring_index('www.twitter.com','.',2) AS Result; 
SELECT substring_index('www.twitter.com','.',-2) AS Result; 




