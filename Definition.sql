--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).

create table Employees
(
ID int ,
Name varchar,
Salary decimal
)

--Add a new column named "Department" to the "Employees" table with data type varchar(50).

alter table Employees
add Department varchar(50)

--Remove the "Salary" column from the "Employees" table.

exec sp_rename 'Employees.Salary' , 'Salary_amount' 

--	Rename the "Department" column in the "Employees" table to "DeptName".

exec sp_rename  'Employees.Department' , 'DeptName'

--	Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).

create table Projects
(
ProjectID int ,
ProjectName varchar,
)

--	Add a primary key constraint to the "Employees" table for the "ID" column

alter table Employees
alter column ID int not null;

ALTER TABLE Employees
add  PRIMARY KEY (ID);

--	Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").

alter table Projects
alter column ProjectID int not null

alter table Projects
add primary key (ProjectID)

alter table Employees
add constraint fk_num 
foreign key (ID) references Projects(ProjectID)

--	Remove the foreign key relationship between "Employees" and "Projects."

alter table Employees
drop constraint fk_num

--	Add a unique constraint to the "Name" column in the "Employees" table.

alter table Employees
add unique (Name)

--Create a table named "Customers" with columns for CustomerID (integer),
--FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).

create table Customers
(
CustomerID int ,
FirstName varchar ,
LastName varchar ,
Email varchar ,
Status varchar ,
);

--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.

alter table Customers
add constraint fullName unique (FirstName,LastName)

--Add a default value of 'Active' for the "Status" column in the "Customers" 
--table, where the default value should be applied when a new record is inserted.

alter table Customers
add constraint st  DEFAULT 'Active' for Status

--Create a table named "Orders" with columns for OrderID (integer),
--CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).

create table Orders
(
OrderID int not null,
CustomerID int not null,
OrderDate datetime ,
TotalAmount decimal,
)

--Add a check constraint to the "TotalAmount" column in the "Orders" table
--to ensure that it is greater than zero.

alter table Orders
add constraint ch_total check (TotalAmount>0)

--Create a schema named "Sales" and move the "Orders" table into this schema.

create schema Sales
go

alter schema Sales transfer object ::Orders

--Rename the "Orders" table to "SalesOrders."

exec sp_rename 'Sales.Orders' , 'SalesOrders'