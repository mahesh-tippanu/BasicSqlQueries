create database employeedetails;
use employeedetails;
create table empTable 
(
EmployeeID int NOT NULL AUTO_INCREMENT,
Employee_Name varchar(255),
Phone_number varchar(255),
Address varchar(255),
Department varchar(255),
Gender char(1),
salary float,
Start_Date Date,
city varchar(255),
country varchar(255),
PRIMARY KEY (EmployeeID)
);

desc empTable;
set foreign_key_checks=0;
insert into empTable (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ('gayatri', '1234567890','kakinada','Engg', 'F', '30000.0', '2022-05-02', 'kakinada', 'India');
insert into empTable (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ("sirisha", "1234567890", "hyderbad", "Engg", "F", '30000.0','2022-05-05', "hyderbad", "India");
select * from empTable;
insert into empTable (Employee_Name, Phone_number,Address, Department, Gender, salary, Start_Date, city, country) values ("mahesh", "1234567890", "hyderbad", "Engg", "M", '30000.0','2022-04-10', "hyderbad", "India");
select * from empTable where Employee_Name = 'mahesh';
select salary as salary from empTable;
alter table empTable rename column salary to salary;
create table salary as select EmployeeID,Employee_Name,salary from empTable;
describe salary;
select * from salary;
update empTable set salary = '35000' where Employee_Name = 'gayatri';
select sum(salary) from empTable where Gender = 'F' group by Gender;
select sum(salary) from empTable where Gender = 'M' group by Gender;
select count(*) from empTable where Gender = 'M';
select count(*) from empTable where Gender = 'F';
select count(*) from empTable group by Gender;
select avg(salary) from empTable where Gender = 'M' group by Gender;
select avg(salary) from empTable where Gender = 'F' group by Gender;
select min(salary) from empTable where Gender = 'F' group by Gender;
select max(salary) from empTable where Gender = 'F' group by Gender;
select * from empTable order by salary desc;
select * from empTable order by salary asc;
select * from empTable;
SELECT * FROM empTable WHERE Start_Date = '2022-04-10';
create view view1 as select Employee_Name , Department from empTable where city = "kakinada";
select * from view1;
select * from empTable where country = "India" AND city = "hyderbad";
Select * from empTable where country = "America" OR city = "kakinada";
select * from empTable where NOT city = "hyderbad";
select * from empTable limit 3;
select * from empTable where city in ('hyderbad','kakinada');
select * from empTable where salary between 35000 AND 41000;
select EmployeeID as Id, Employee_Name as Name from empTable;
select * from empTable;


create table Orders(OrderId int Not Null, CustomerId int, OrderDate date);
create table Customers(CustomerId int Not Null, CustomerName varchar(255), country varchar(255),Mobile varchar(10));

create table emp(id int,name varchar(100),city varchar(100));
insert into emp(id, name, city) select EmployeeID,Employee_Name,city from empTable where country = 'India';
select * from emp;

SELECT * FROM employeedetails.Orders;
insert into Orders(OrderId,CustomerId,OrderDate) values('10308','3','2022-04-09');
insert into Orders(OrderId,CustomerId,OrderDate) values('10309','1','2022-05-05');
insert into Orders(OrderId,CustomerId,OrderDate) values('10310','5','2022-06-03');

SELECT OrderID FROM Orders UNION SELECT CustomerName FROM Customers;

SELECT * FROM employeedetails.Customers;
use employeedetails;

insert into Customers(CustomerId,CustomerName,country,Mobile) values('1','gayatri','India','9908742590');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('2','sirisha','India','9098456560');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('3','mahesh','India','9098781234');

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
Right JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
CROSS JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


create index byCity on empTable(EmployeeID, Employee_Name, city);
select * from byCity;
ALTER TABLE empTable DROP INDEX byCity;
show indexes from empTable;