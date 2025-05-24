CREATE DATABASE DealershipDB;

USE DealershipDB;


CREATE TABLE Customers(
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Email VARCHAR(255),
    Phone_Number VARCHAR(255),
    Address VARCHAR(255)
);

INSERT INTO Customers(first_name, last_name, email, phone_number, address)
VALUES
 ("Dennis", "Butterworth", "DButt@hotmail.com", "749548", "7, Home House, GT5 Y6P"),
 ("Mary", "Butterworth", "MButt@hotmail.com", "544364", "7, Home House, GT5 Y6P"),
 ("Lucas", "Ericas", "LucEri@askjeeves.com", "546645", "11, School House, HM4 Y77"),
 ("Rose", "Tyler", "RTyler@gmail.com", "676758", "67, Flat H, VT5 I99"),
 ("Milly", "Monarch", "MiMoNaRcH@hotmail.com", "4535643", "77, Old Road House, GP5 T6T"),
 ("Daniel", "von Runstadt", "DvR@yahoo.com", "564767", "7, Gob House, GO5 YH0");
 
 
CREATE TABLE Cars(
    Car_ID INT AUTO_INCREMENT PRIMARY KEY,
    Make VARCHAR(255),
    Model VARCHAR(255),
    ModelYear YEAR,
    Price FLOAT,
    CarStatus VARCHAR(255),
    VIN_Number VARCHAR(255)
);

INSERT INTO Cars(Make, Model, ModelYear, Price, CarStatus, VIN_Number)
VALUES
("Alpine", "A110", 2023, 48450, "Like New", "A 110"),
("Audi", "A1", 2024, 14645, "New", "CAS 150"),
("Alpine", "A290", 2025, 33490, "New", "A 290"),
("Bugatti", "Veyron", 2020, 2700000, "New", "BVS 050"),
("Chrysler", "Grand Voyager", 2010, 695, "Used", "KUH0 NSF");
    

CREATE TABLE Dealership_Locations(
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location_Name VARCHAR(255),
    Adress VARCHAR(255),
    Phone_Number VARCHAR(255)
);

INSERT INTO Dealership_Locations (Location_ID, Location_Name, Adress, Phone_Number)
VALUES
(1, "Blaze Motors", "123 King Street, London", "02079461234"),
(2, "Southside Garage", "50 River Avenue, Manchester", "01613456789"),
(3, "Accelerated Autos", "77 Sunset Road, Liverpool", "01512233445"),
(4, "Luxe Wheels ", "10 Wind Lane, Birmingham", "01216784567"),
(5, "Apex Drives", '106  Urswick Road, Bristol', '01816784567');

 
CREATE TABLE Employees(
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location_ID INT,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Email VARCHAR(255),
    Phone_Number VARCHAR(255),
    Hire_Date DATE,
    Position VARCHAR(255),
    FOREIGN KEY (Location_ID) REFERENCES Dealership_Locations(Location_ID)
);

INSERT INTO Employees (Employee_ID, Location_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Position)
VALUES
(1, 1, 'Alice', 'Johnson', 'alice.johnson@gmail.com', '07123456789', '2021-03-15', 'Sales Associate'),
(2, 2, 'Ben', 'Smith', 'ben.smith@yahoo.com', '07234567890', '2019-07-10', 'Manager'),
(3, 3, 'Catherine', 'Lee', 'catherine.lee@hotmail.com', '07345678901', '2020-11-22', 'Sale Assistant'),
(4, 4, 'David', 'Brown', 'david.brown@yahoo.com', '07456789012', '2022-01-05', 'Receptionist'),
(5, 5, 'Mark', 'Williams', 'mark.williams@gmail.com', '07567890123', '2018-09-30', 'Sale Associate');


CREATE TABLE Sales(
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
    Car_ID INT,
    Customer_ID INT,
    Employee_ID INT,
    Sale_Date DATE,
    Final_Price FLOAT,
    FOREIGN KEY (Car_ID) REFERENCES Cars(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

INSERT INTO Sales (Car_ID, Customer_ID, Employee_ID, Sale_Date, Final_Price) 
VALUES
(1, 1, 1, "2024-09-12", 25499.99),
(2, 2, 2, "2024-10-18", 31999.00),
(3, 3, 3, "2024-11-05", 18999.50),
(4, 4, 4, "2025-01-22", 27995.75),
(5, 5, 5, "2025-02-15", 34500.00);

DROP TABLE Sales;

CREATE TABLE Sales(
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
    Car_ID INT,
    Customer_ID INT,
    Employee_ID INT,
    Sale_Date DATE,
    Final_Price FLOAT,
    FOREIGN KEY (Car_ID) REFERENCES Cars(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

INSERT INTO Sales (Car_ID, Customer_ID, Employee_ID, Sale_Date, Final_Price) 
VALUES
(1, 1, 1, "2024-09-12", 25499.99),
(2, 2, 2, "2024-10-18", 31999.00),
(3, 3, 3, "2024-11-05", 18999.50),
(4, 4, 4, "2025-01-22", 27995.75),
(5, 5, 5, "2025-02-15", 34500.00);


CREATE TABLE Records(
    Record_ID INT PRIMARY KEY,
    Car_ID INT,
    Service_Date VARCHAR(255),
    Service_Description VARCHAR(255),
    Service_Price FLOAT,
    Employee_ID INT,
    FOREIGN KEY (Car_ID) REFERENCES Cars(Car_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

INSERT INTO Records (Record_ID, Car_ID, Service_Date, Service_Description, Service_Price, Employee_ID)
VALUES
(1, 1, "2024-12-01", "Brake inspection and pad replacement", 250.00, 3),
(2, 2, "2025-01-15", "Oil change", 120.00, 5),
(3, 3, "2025-02-20", "Battery replacement", 180.50, 2),
(4, 4, "2025-03-10", "Full engine diagnostics", 300.00, 4),
(5, 5, "2024-11-25", "Interior cleaning and detailing", 90.00, 1);


CREATE TABLE Car_Test(
    Test_ID INT AUTO_INCREMENT PRIMARY KEY,
    Car_ID    INT,
    Customer_ID  INT,
    Feedback VARCHAR(500),
    Feedback_Date Date,
    FOREIGN KEY (Car_ID) REFERENCES Cars(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Car_Test (Car_ID, Customer_ID, Feedback, Feedback_Date) 
VALUES
(1, 1, "Loved the handling and acceleration. Very smooth drive.", "2024-09-10"),
(2, 2, "Interior was impressive, but ride felt stiff.", "2024-10-15"),
(3, 3, "Great car for city driving. Compact and efficient.", "2024-11-01"),
(4, 4, "Very quiet engine, but limited rear visibility.", "2025-01-20"),
(5, 5, "Felt powerful and secure on the motorway.", "2025-02-12");

DROP TABLE Car_test;

CREATE TABLE Car_Test(
    Test_ID INT AUTO_INCREMENT PRIMARY KEY,
    Car_ID INT,
    Customer_ID INT,
    Feedback VARCHAR(500),
    Feedback_Date Date,
    FOREIGN KEY (Car_ID) REFERENCES Cars(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Car_Test (Car_ID, Customer_ID, Feedback, Feedback_Date) 
VALUES
(1, 1, "Loved the handling and acceleration. Very smooth drive.", "2024-09-10"),
(2, 2, "Interior was impressive, but ride felt stiff.", "2024-10-15"),
(3, 3, "Great car for city driving. Compact and efficient.", "2024-11-01"),
(4, 4, "Very quiet engine, but limited rear visibility.", "2025-01-20"),
(5, 5, "Felt powerful and secure on the motorway.", "2025-02-12");

CREATE TABLE Employee_Sales (
    Employee_ID INT,
    Sale_ID INT,
    Role VARCHAR(100),  -- Optional: e.g., 'Lead', 'Support', 'Finance'
    PRIMARY KEY (Employee_ID, Sale_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (Sale_ID) REFERENCES Sales(Sale_ID)
);

INSERT INTO Employee_Sales (Employee_ID, Sale_ID, Role) 
VALUES
(1, 1, "Lead"),
(2, 1, "Support"),
(2, 2, "Lead"),
(3, 3, "Lead"),
(4, 3, "Finance");


SELECT * FROM Cars;
SELECT * FROM Customers;
SELECT * FROM Dealership_Locations;
SELECT * FROM Employees;
SELECT * FROM Records;
SELECT * FROM Car_Test;
SELECT * FROM Sales;


ALTER TABLE Dealership_Locations
RENAME COLUMN Adress TO Address;


SELECT * FROM Sales
INNER JOIN Customers ON Sales.Customer_ID = Customers.Customer_ID;

SELECT Sale_ID, First_Name, Last_Name, Email 
FROM Sales
INNER JOIN Customers ON Sales.Customer_ID = Customers.Customer_ID;


SELECT * FROM Cars
WHERE Price > 50000;
 
SELECT * FROM Dealership_Locations
WHERE Adress LIKE "%London%";

SELECT * FROM Car_Test
WHERE Feedback_Date < "2025-01-01";


SELECT Make, ModelYear, Price 
FROM Cars
ORDER BY Price DESC; 

SELECT Customer_ID, First_Name, Last_Name
FROM Customers
ORDER BY Last_Name ASC;

SELECT Record_ID, Service_Description, Service_Price
FROM Records
ORDER BY Service_Price ASC;


-- cars sold and total amount of money made per employee
-- useful theoretically but not for this small project
SELECT Employees.Employee_ID, Employees.First_Name, Employees.Last_Name,
COUNT(Sales.Sale_ID) AS Total_Sales,
SUM(Sales.Final_Price) AS Total_Revenue
-- combine employees and sales table
FROM Sales
JOIN Employees ON Sales.Employee_ID = Employees.Employee_ID
GROUP BY Employees.Employee_ID;


SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM customers WHERE customer_ID = 1;
 
SELECT AVG(price) FROM cars;


SELECT es.Sale_ID, e.First_Name, e.Last_Name, es.Role
FROM Employee_Sales es
JOIN Employees e ON es.Employee_ID = e.Employee_ID
ORDER BY es.Sale_ID;


CREATE TRIGGER update_car_status 
AFTER INSERT ON Sales
FOR EACH ROW UPDATE Cars SET CarStatus = 'Sold' WHERE Car_ID = NEW.Car_ID;