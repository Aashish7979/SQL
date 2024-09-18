Create table students1 (student_no int, student_name varchar(20), age int);

Insert into students1 (student_no, student_name, age)
values ('1', 'Michael', '19'),
('2', 'Doug', '18'),
('3', 'Samantha', '21'),
('4', 'Pete', '20'), 
('5', 'Ralph', '19'), 
('6', 'Arnold', '22'), 
('7', 'Michael', '19'),
('8', 'Jack', '19'), 
('9', 'Rand', '17'),
('10', 'Sylvia', '20');

Select student_name
From students1
where age between '18' and '20'; 

Select *
From students1
Where student_name like '%ch%' 
or student_name like '%nd'; 


Select *
From students1
Where student_name like '%ae%' Or student_name like '%ph%'
And age != '19' ;


Select student_name
From students1
Order by age desc;


Select student_name
From students1
Order by age desc
Limit 4;

Select *
From students1
Where age <= '20' and (student_no between '3' and '5' or student_no = '7')
Or age > '20' and student_no >= '4';  


