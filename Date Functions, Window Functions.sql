Use classicmodels;

--Date Functions
Select NOW() As Result;
Select current_timestamp() As Result;

Select current_date() As Result;
Select current_time() As Result;

Select Date("2022-03-15 05:14:39") As result;
Select time("2022-03-15 05:14:39") As result;

Select date_add("2022-01-01",interval 5 Day) As result;
Select date_add("2022-01-01",interval -4 Day) As result;

Select date_format("2022-03-15", "%d-%m-%y") as result;
Select date_format("2022-03-15", "%d-%b-%y") as result;

Select date_format("2022-03-15 12:19:25", "%d-%m-%y %h:%i:%s %p") as result;

--Date diff
Select Datediff("2022-01-01", "2022-01-08") As Result;

Select Timestampdiff(Month,"2022-01-01", "2022-07-15") As Result;
Select Timestampdiff(Month,"2022-01-20", "2022-07-15") As Result;
Select Timestampdiff(Minute,"2022-01-01 00:00:00", "2022-01-01 02:15:21") As Result;

Select year(now()) as result;
Select Month(now()) as result;
Select Monthname(now()) as result;
Select Day(now()) as result;
Select Dayname(now()) as result;
Select week(now()) as Result; 

--Window function
# 1) ROW_NUMBER()
SELECT ROW_NUMBER() OVER () AS Row_No, 
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;

SELECT ROW_NUMBER() OVER (PARTITION BY ordernumber) AS Row_No, 
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 2) RANK()
SELECT RANK() OVER() AS Ranking,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
SELECT RANK() OVER(ORDER BY quantityOrdered) AS Ranking,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 3) DENSE_RANK()
SELECT DENSE_RANK() OVER(ORDER BY quantityOrdered) AS Dense_Ranking,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 4) PERCENT_RANK()
SELECT PERCENT_RANK() OVER(PARTITION BY quantityOrdered ORDER BY ordernumber) AS Percent_Ranking,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 5) CUME_DIST()
 SELECT CUME_DIST() OVER(PARTITION BY quantityOrdered ORDER BY ordernumber) AS Cumulative_Distr,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 6) NTILE()
 SELECT NTILE(4) OVER(ORDER BY ordernumber) AS NTILE_Function,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 7) LAG()
SELECT LAG(quantityOrdered,2) OVER() AS Previous_Value,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
SELECT LAG(quantityOrdered,1) OVER(PARTITION BY ordernumber) AS Previous_Value,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 8) LEAD()
SELECT LEAD(quantityOrdered,1) OVER() AS Next_Value,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
SELECT LEAD(quantityOrdered,1) OVER(PARTITION BY ordernumber) AS Next_Value,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 9) FIRST_VALUE()
SELECT FIRST_VALUE(quantityOrdered) OVER() AS First_Value_,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
SELECT FIRST_VALUE(quantityOrdered) OVER(PARTITION BY priceEach) AS First_Value_,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 10) LAST_VALUE()
SELECT LAST_VALUE(quantityOrdered) OVER() AS Last_Value_,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
SELECT LAST_VALUE(quantityOrdered) OVER(PARTITION BY ordernumber) AS Last_Value_,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 
 # 11) NTH_VALUE()
SELECT NTH_VALUE(quantityOrdered, 7) OVER() AS Nth_Value_,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
SELECT NTH_VALUE(quantityOrdered, 7) OVER(PARTITION BY ordernumber) AS Nth_Value_,
orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
 FROM orderdetails;
 
 /*--------------------------------------------------------------------------------------------------------*/
 