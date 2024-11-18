use classicmodels;

#InnerJoin 
Select c.customerNumber, c.customerName, sum(od.quantityOrdered) as total_order_qty 
from customers c
inner join orders o 
on c.customerNumber = o.customerNumber
inner join orderdetails od
on o.orderNumber = od.orderNumber
group by c.customerNumber
Having total_order_qty >= 1500
order by total_order_qty desc; 

#Create table Employee
Create table Employee(
Emp_ID INT,
Name VARCHAR(50)
); 

INSERT INTO Employee
VALUES(1,"A"),(2,"B"),(3,"C"),(4,"D"),(5,"E");

#Create table Projects
Create table Projects(
Project_ID INT,
Name VARCHAR(100),
E_ID int
);

INSERT INTO Projects
VALUES(1001,"CAS",5),
	(1002,"FMC",10),
    (1003,"GE Corp",3),
    (1004,"Westpack bank", 1); 
    
# LEFT, RIGHT and FULL Outer Joins 

Select e.Emp_ID, e.Name, p.Name
FROM Employee e
Left join Projects p
on e.Emp_ID = p.E_ID

UNION 

Select e.Emp_ID, e.Name, p.Name
From Employee e
Right join Projects p
on e.Emp_id = p.E_ID;

#Create table for Cross join 
Create table Laptop(
LP_Name Varchar(50)
);

Insert into Laptop
values("Dell"),("HP"); 

Create table Colours(
colour_Name varchar(50)
); 

Insert into colours 
values("Black"),("White"),("Grey");

Select * 
From Laptop 
Cross join Colours;

#SELF JOIN
Create table Class(
Roll_No INT,
St_Name VARCHAR(50),
Age INT, 
Teacher_ID INT,
T_Name VARCHAR (10) );

Insert into Class
values (1,"A",12,10,"P"),
	   (2,"B",10,2,"Q"),
       (3,"C",14,1,"R"),
       (4,"D",13,12,"S");
       
Select T1.Roll_No, T1.St_Name,T2.Teacher_ID,T2.T_Name 
from Class T1
Inner join Class T2
on T1.Roll_No=T2.Teacher_ID; 

