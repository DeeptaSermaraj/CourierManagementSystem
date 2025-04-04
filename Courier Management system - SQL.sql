CREATE DATABASE CouriersManagementSystem;
USE CouriersManagementSystem;

CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20),
    Address TEXT
);

CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100) NOT NULL,
    Cost DECIMAL(8, 2) NOT NULL
);

CREATE TABLE Courier (
    CourierID INT PRIMARY KEY AUTO_INCREMENT,
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    Weight DECIMAL(5, 2) NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pending',
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    DeliveryDate DATE,
    UserID INT,
    ServiceID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

INSERT INTO User (Name, Email, Password, ContactNumber, Address) VALUES
('Chhota Bheem', 'bheem@dholakpur.com', 'bheem123', '9876543210', 'Dholakpur Village'),
('Shinchan Nohara', 'shinchan@kasukabe.com', 'shinchan123', '9876543211', 'Kasukabe, Japan'),
('Doraemon', 'doraemon@future.com', 'doraemon123', '9876543212', 'Tokyo, Japan'),
('Ninja Hattori', 'hattori@ninja.com', 'hattori123', '9876543213', 'Shinobi Village'),
('Jackie Chan', 'jackie@kungfu.com', 'jackie123', '9876543214', 'Hong Kong'),
('Heidi', 'heidi@alps.com', 'heidi123', '9876543215', 'Swiss Alps'),
('Raju', 'raju@dholakpur.com', 'raju123', '9876543216', 'Dholakpur Village'),
('Chutki', 'chutki@dholakpur.com', 'chutki123', '9876543217', 'Dholakpur Village'),
('Kalia', 'kalia@dholakpur.com', 'kalia123', '9876543218', 'Dholakpur Village'),
('Indumati', 'indu@dholakpur.com', 'indu123', '9876543219', 'Dholakpur Village'),
('Nobita Nobi', 'nobita@future.com', 'nobita123', '9876543220', 'Tokyo, Japan'),
('Shizuka', 'shizuka@future.com', 'shizuka123', '9876543221', 'Tokyo, Japan'),
('Gian', 'gian@future.com', 'gian123', '9876543222', 'Tokyo, Japan'),
('Suneo', 'suneo@future.com', 'suneo123', '9876543223', 'Tokyo, Japan'),
('Dekisugi', 'dekisugi@future.com', 'dekisugi123', '9876543224', 'Tokyo, Japan');

INSERT INTO CourierServices (ServiceName, Cost) VALUES
('Standard Delivery', 100.00),
('Express Delivery', 250.00),
('Overnight Delivery', 500.00),
('Same-Day Delivery', 700.00),
('International Delivery', 1500.00),
('Heavy Parcel Delivery', 1200.00),
('Fragile Item Delivery', 800.00),
('Medical Supply Delivery', 900.00),
('Food Delivery', 300.00),
('Document Delivery', 200.00),
('Electronics Delivery', 1000.00),
('Gift Delivery', 600.00),
('Bulk Delivery', 2000.00),
('Eco-Friendly Delivery', 400.00),
('VIP Delivery', 3000.00);

INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate, UserID, ServiceID) VALUES
('Chhota Bheem', 'Dholakpur Village', 'Shinchan Nohara', 'Kasukabe, Japan', 2.5, 'In Transit', 'TRK123456', '2023-10-25', 1, 1),
('Doraemon', 'Tokyo, Japan', 'Ninja Hattori', 'Shinobi Village', 1.8, 'Delivered', 'TRK123457', '2023-10-20', 3, 2),
('Heidi', 'Swiss Alps', 'Jackie Chan', 'Hong Kong', 3.0, 'Pending', 'TRK123458', '2023-10-30', 6, 3),
('Raju', 'Dholakpur Village', 'Chutki', 'Dholakpur Village', 5.0, 'In Transit', 'TRK123459', '2023-10-26', 7, 4),
('Kalia', 'Dholakpur Village', 'Indumati', 'Dholakpur Village', 4.2, 'Delivered', 'TRK123460', '2023-10-22', 9, 5),
('Nobita Nobi', 'Tokyo, Japan', 'Shizuka Minamoto', 'Tokyo, Japan', 1.5, 'Pending', 'TRK123461', '2023-10-31', 11, 6),
('Gian', 'Tokyo, Japan', 'Suneo Honekawa', 'Tokyo, Japan', 6.0, 'In Transit', 'TRK123462', '2023-10-27', 13, 7),
('Dekisugi', 'Tokyo, Japan', 'Nobita Nobi', 'Tokyo, Japan', 2.0, 'Delivered', 'TRK123463', '2023-10-23', 15, 8),
('Shinchan Nohara', 'Kasukabe, Japan', 'Doraemon', 'Tokyo, Japan', 3.5, 'Pending', 'TRK123464', '2023-11-01', 2, 9),
('Jackie Chan', 'Hong Kong', 'Heidi', 'Swiss Alps', 7.0, 'In Transit', 'TRK123465', '2023-10-28', 5, 10),
('Chutki', 'Dholakpur Village', 'Raju', 'Dholakpur Village', 1.0, 'Delivered', 'TRK123466', '2023-10-24', 8, 11),
('Indumati', 'Dholakpur Village', 'Kalia', 'Dholakpur Village', 2.3, 'Pending', 'TRK123467', '2023-11-02', 10, 12),
('Shizuka', 'Tokyo, Japan', 'Gian', 'Tokyo, Japan', 4.7, 'In Transit', 'TRK123468', '2023-10-29', 12, 13),
('Suneo', 'Tokyo, Japan', 'Dekisugi', 'Tokyo, Japan', 3.8, 'Delivered', 'TRK123469', '2023-10-21', 14, 14),
('Ninja Hattori', 'Shinobi Village', 'Chhota Bheem', 'Dholakpur Village', 5.5, 'Pending', 'TRK123470', '2023-11-03', 4, 15);

INSERT INTO Employee (Name, Email, ContactNumber, Role, Salary) VALUES
('Raju', 'raju@dholakpur.com', '9876543220', 'Delivery Boy', 20000.00),
('Jaggu', 'jaggu@dholakpur.com', '9876543221', 'Manager', 50000.00),
('Kalia', 'kalia@dholakpur.com', '9876543222', 'Warehouse Staff', 15000.00),
('Indumati', 'indu@dholakpur.com', '9876543223', 'Customer Support', 18000.00),
('Chutki', 'chutki@dholakpur.com', '9876543224', 'Delivery Boy', 20000.00),
('Nobita Nobi', 'nobita@future.com', '9876543225', 'IT Support', 25000.00),
('Shizuka', 'shizuka@future.com', '9876543226', 'HR Manager', 40000.00),
('Gian', 'gian@future.com', '9876543227', 'Security', 22000.00),
('Suneo', 'suneo@future.com', '9876543228', 'Accountant', 30000.00),
('Dekisugi', 'dekisugi@future.com', '9876543229', 'Developer', 35000.00),
('Heidi', 'heidi@alps.com', '9876543230', 'Delivery Boy', 20000.00),
('Jackie Chan', 'jackie@kungfu.com', '9876543231', 'Security', 22000.00),
('Ninja Hattori', 'hattori@ninja.com', '9876543232', 'Delivery Boy', 20000.00),
('Doraemon', 'doraemon@future.com', '9876543233', 'IT Support', 25000.00),
('Shinchan Nohara', 'shinchan@kasukabe.com', '9876543234', 'Customer Support', 18000.00);

INSERT INTO Location (LocationName, Address) VALUES
('Dholakpur Branch', 'Dholakpur Village, India'),
('Kasukabe Branch', 'Kasukabe, Japan'),
('Tokyo Branch', 'Tokyo, Japan'),
('Hong Kong Branch', 'Hong Kong'),
('Swiss Alps Branch', 'Swiss Alps'),
('Mumbai Branch', 'Mumbai, India'),
('Delhi Branch', 'Delhi, India'),
('Bangalore Branch', 'Bangalore, India'),
('Chennai Branch', 'Chennai, India'),
('Kolkata Branch', 'Kolkata, India'),
('New York Branch', 'New York, USA'),
('London Branch', 'London, UK'),
('Paris Branch', 'Paris, France'),
('Sydney Branch', 'Sydney, Australia'),
('Dubai Branch', 'Dubai, UAE');

INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate) VALUES
(1, 1, 100.00, '2023-10-24'),
(2, 2, 250.00, '2023-10-19'),
(3, 3, 500.00, '2023-10-29'),
(4, 4, 700.00, '2023-10-26'),
(5, 5, 1500.00, '2023-10-22'),
(6, 6, 1200.00, '2023-10-31'),
(7, 7, 800.00, '2023-10-27'),
(8, 8, 900.00, '2023-10-23'),
(9, 9, 300.00, '2023-11-01'),
(10, 10, 200.00, '2023-10-28'),
(11, 11, 1000.00, '2023-10-24'),
(12, 12, 600.00, '2023-11-02'),
(13, 13, 2000.00, '2023-10-29'),
(14, 14, 400.00, '2023-10-21'),
(15, 15, 3000.00, '2023-11-03');

SELECT * FROM User;

SELECT * FROM Courier WHERE UserID = 1;

SELECT * FROM Courier;

SELECT * FROM Courier WHERE CourierID = 1;

SELECT * FROM Courier WHERE CourierID = 1;

SELECT * FROM Courier WHERE Status != 'Delivered';

SELECT * FROM Courier WHERE DeliveryDate = '2023-10-25';

SELECT * FROM Courier WHERE Status = 'Pending';

SELECT CourierID, COUNT(*) AS TotalPackages 
FROM Courier 
GROUP BY CourierID;

SELECT CourierID, AVG(DATEDIFF(DeliveryDate, OrderDate)) AS AvgDeliveryTime 
FROM Courier 
GROUP BY CourierID;

ALTER TABLE Courier ADD COLUMN OrderDate DATE;


UPDATE Courier SET OrderDate = DATE_SUB(DeliveryDate, INTERVAL 2 DAY);


UPDATE Courier 
SET OrderDate = DATE_SUB(DeliveryDate, INTERVAL 2 DAY)
WHERE CourierID > 0; 

SELECT CourierID, AVG(DATEDIFF(DeliveryDate, OrderDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID;

SELECT CourierID, AVG(DATEDIFF(DeliveryDate, OrderDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID;

SELECT * 
FROM Courier 
WHERE Weight BETWEEN 2.0 AND 5.0;

SELECT * 
FROM Courier 
WHERE CourierID IN (
    SELECT CourierID 
    FROM Payment 
    WHERE Amount > 50
);

SELECT * 
FROM Employee 
WHERE Name LIKE '%John%';

SELECT * 
FROM Courier 
WHERE CourierID IN (
    SELECT CourierID 
    FROM Payment 
    WHERE Amount > 50
);

SELECT EmployeeID, COUNT(*) AS TotalCouriersHandled
FROM Courier
GROUP BY EmployeeID;


ALTER TABLE Courier ADD COLUMN EmployeeID INT;


UPDATE Courier SET EmployeeID = 1 WHERE CourierID = 1;
UPDATE Courier SET EmployeeID = 2 WHERE CourierID = 2;
UPDATE Courier SET EmployeeID = 3 WHERE CourierID = 3;


SELECT EmployeeID, COUNT(*) AS TotalCouriersHandled
FROM Courier
GROUP BY EmployeeID;

SELECT LocationID, SUM(Amount) AS TotalRevenue
FROM Payment
GROUP BY LocationID;

SELECT LocationID, COUNT(*) AS TotalCouriersDelivered
FROM Payment
GROUP BY LocationID;

SELECT CourierID, AVG(DATEDIFF(DeliveryDate, OrderDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID
ORDER BY AvgDeliveryTime DESC
LIMIT 1;

SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID
HAVING TotalPayments < 1000;

SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID;

SELECT CourierID
FROM Payment
WHERE LocationID = 3
GROUP BY CourierID
HAVING SUM(Amount) > 1000;

SELECT CourierID
FROM Payment
WHERE PaymentDate > '2023-10-25'
GROUP BY CourierID
HAVING SUM(Amount) > 1000;

SELECT LocationID, SUM(Amount) AS TotalAmount
FROM Payment
WHERE PaymentDate < '2023-10-30'
GROUP BY LocationID
HAVING TotalAmount > 5000;

SELECT Payment.*, Courier.SenderName, Courier.ReceiverName
FROM Payment
INNER JOIN Courier ON Payment.CourierID = Courier.CourierID;

SELECT Payment.*, Location.LocationName
FROM Payment
INNER JOIN Location ON Payment.LocationID = Location.LocationID;

SELECT Payment.*, Courier.SenderName, Courier.ReceiverName, Location.LocationName
FROM Payment
INNER JOIN Courier ON Payment.CourierID = Courier.CourierID
INNER JOIN Location ON Payment.LocationID = Location.LocationID;

SELECT Payment.*, Courier.*
FROM Payment
INNER JOIN Courier ON Payment.CourierID = Courier.CourierID;

SELECT Courier.CourierID, Courier.SenderName, SUM(Payment.Amount) AS TotalPayments
FROM Payment
INNER JOIN Courier ON Payment.CourierID = Courier.CourierID
GROUP BY Courier.CourierID;

SELECT *
FROM Payment
WHERE PaymentDate = '2023-10-25';

SELECT Payment.*, Courier.*
FROM Payment
LEFT JOIN Courier ON Payment.CourierID = Courier.CourierID;

SELECT Payment.*, Location.*
FROM Payment
LEFT JOIN Location ON Payment.LocationID = Location.LocationID;

SELECT Courier.CourierID, Courier.SenderName, SUM(Payment.Amount) AS TotalPayments
FROM Payment
INNER JOIN Courier ON Payment.CourierID = Courier.CourierID
GROUP BY Courier.CourierID;

SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2023-10-20' AND '2023-10-30';

SELECT User.*, Courier.*
FROM User
LEFT JOIN Courier ON User.UserID = Courier.UserID;

SELECT Courier.*, CourierServices.*
FROM Courier
LEFT JOIN CourierServices ON Courier.ServiceID = CourierServices.ServiceID;

SELECT Employee.*, Payment.*
FROM Employee
LEFT JOIN Payment ON Employee.EmployeeID = Payment.CourierID;

SELECT User.*, CourierServices.*
FROM User
CROSS JOIN CourierServices;

SELECT Employee.*, Location.*
FROM Employee
CROSS JOIN Location;

SELECT Courier.*, User.Name AS SenderName, User.Address AS SenderAddress
FROM Courier
LEFT JOIN User ON Courier.UserID = User.UserID;

SELECT Courier.*, User.Name AS ReceiverName, User.Address AS ReceiverAddress
FROM Courier
LEFT JOIN User ON Courier.UserID = User.UserID;

SELECT Courier.*, CourierServices.*
FROM Courier
LEFT JOIN CourierServices ON Courier.ServiceID = CourierServices.ServiceID;

SELECT Employee.EmployeeID, Employee.Name, COUNT(Courier.CourierID) AS TotalCouriers
FROM Employee
LEFT JOIN Courier ON Employee.EmployeeID = Courier.EmployeeID
GROUP BY Employee.EmployeeID;

SELECT Location.LocationID, Location.LocationName, SUM(Payment.Amount) AS TotalPayments
FROM Location
LEFT JOIN Payment ON Location.LocationID = Payment.LocationID
GROUP BY Location.LocationID;

SELECT *
FROM Courier
WHERE SenderName = 'Chhota Bheem';

SELECT Role, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Role
HAVING TotalEmployees > 1;

SELECT *
FROM Payment
WHERE LocationID = 1;

SELECT *
FROM Courier
WHERE SenderAddress = 'Dholakpur Village';

SELECT Employee.EmployeeID, Employee.Name, COUNT(Courier.CourierID) AS TotalCouriersDelivered
FROM Employee
LEFT JOIN Courier ON Employee.EmployeeID = Courier.EmployeeID
GROUP BY Employee.EmployeeID;

SELECT Courier.*
FROM Courier
INNER JOIN Payment ON Courier.CourierID = Payment.CourierID
INNER JOIN CourierServices ON Courier.ServiceID = CourierServices.ServiceID
WHERE Payment.Amount > CourierServices.Cost;

SELECT *
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

SELECT Name
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

SELECT *
FROM Courier
WHERE CourierID IN (SELECT CourierID FROM Payment);

SELECT LocationID, LocationName
FROM Location
WHERE LocationID = (
    SELECT LocationID
    FROM Payment
    WHERE Amount = (SELECT MAX(Amount) FROM Payment)
);

SELECT *
FROM Courier
WHERE Weight > ALL (
    SELECT Weight
    FROM Courier
    WHERE SenderName = 'Chhota Bheem'
);




 

















