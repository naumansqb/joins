USE northwind;

-- Question 1
SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName
FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID 
ORDER BY c.CategoryName ASC, p.ProductName ASC;

-- Question 2
SELECT p.ProductID, p.ProductName, p.UnitPrice, s.CompanyName
FROM products p 
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 75
ORDER BY (p.ProductName);

-- QUestion 3
SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName, s.CompanyName
FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID 
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
ORDER BY (p.ProductName);

-- Question 4
SELECT p.ProductName, c.CategoryName
FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductID = (SELECT MAX(p.UnitPrice) FROM products);


-- Question 5
SELECT o.OrderID, o.ShipName, o.ShipAddress
FROM orders o
INNER JOIN shippers s ON o.ShipVia = s.ShipperID
WHERE o.ShipCountry = "Germany";

-- Question 6
SELECT o.OrderID,o.OrderDate, o.ShipName, o.ShipAddress, s.CompanyName
FROM orders o
INNER JOIN shippers s ON o.ShipVia = s.ShipperID
INNER JOIN `order details` od ON o.OrderID = od.OrderID
WHERE od.ProductID = (SELECT ProductID FROM products p WHERE p.ProductName = "Sasquatch Ale");

