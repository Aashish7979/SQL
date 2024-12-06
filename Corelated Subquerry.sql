#Show the products from each product line if the buyPrice value is more than the avg buyprice value for that productLine. 
SELECT productName, productLine, buyPrice
FROM Products T1
WHERE buyPrice >= (SELECT AVG(buyPrice) FROM Products T2
				   WHERE T1.productLine = T2.ProductLine)
ORDER BY productLine, buyPrice DESC; 

#Case statements
SELECT priceEach, 
CASE 
	WHEN priceEach BETWEEN 0 AND 100.99 THEN 'Low Price'
    WHEN priceEach BETWEEN 101 AND 200.99 THEN 'Medium Price'
    ELSE 'High Price' 
END AS Price_Status
FROM Orderdetails
ORDER BY priceEach DESC; 

