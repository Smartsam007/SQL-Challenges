

--1. List all suppliers in the UK 
SELECT * FROM Supplier
WHERE Country = 'UK';

--2. List the first name, last name, and city for all customers. Concatenate the first and last name separated by a space and a comma as a single column 
SELECT LastName + ', ' + FirstName AS FullName, City
FROM Customer;

--3. List all customers in Sweden 
SELECT * FROM Customer
WHERE Country = 'Sweden';

--4. List all suppliers in alphabetical order 
SELECT * FROM Supplier
ORDER BY CompanyName ASC;

--5. List all suppliers with their products 
SELECT s.CompanyName, p.ProductName
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
ORDER BY s.CompanyName;

--6. List all orders with customers information 
SELECT o.Id AS OrderId, o.OrderNumber, o.OrderDate, o.TotalAmount,
       c.FirstName, c.LastName, c.City, c.Country
FROM [Order] o
JOIN Customer c ON o.CustomerId = c.Id;


--7. List all orders with product name, quantity, and price, sorted by order number 
SELECT o.OrderNumber, p.ProductName, oi.Quantity, oi.UnitPrice
FROM OrderItem oi
JOIN [Order] o ON oi.OrderId = o.Id
JOIN Product p ON oi.ProductId = p.Id
ORDER BY o.OrderNumber;


--8. Using a case statement, list all the availability of products. When 0 then not available, else available

SELECT ProductName,
       CASE 
           WHEN IsDiscontinued = 0 THEN 'Available'
           ELSE 'Not Available'
       END AS Availability
FROM Product;




--9. Using case statement, list all the suppliers and the language they speak. The language they speak should be their country E.g if UK, then English 

SELECT CompanyName, Country,
       CASE Country
           WHEN 'UK' THEN 'English'
           WHEN 'USA' THEN 'English'
           WHEN 'Germany' THEN 'German'
           WHEN 'France' THEN 'French'
           WHEN 'Spain' THEN 'Spanish'
           WHEN 'Italy' THEN 'Italian'
           WHEN 'Sweden' THEN 'Swedish'
           WHEN 'Japan' THEN 'Japanese'
           WHEN 'Finland' THEN 'Finnish'
           WHEN 'Canada' THEN 'English/French'
           ELSE 'Unknown'
       END AS Language
FROM Supplier;




--10. List all products that are packaged in Jars 
SELECT ProductName, Package
FROM Product
WHERE Package LIKE '%jar%';


--11. List procucts name, unitprice and packages for products that starts with Ca 
SELECT ProductName, UnitPrice, Package
FROM Product
WHERE ProductName LIKE 'Ca%';


--12. List the number of products for each supplier, sorted high to low. 
SELECT s.CompanyName, COUNT(p.Id) AS ProductCount
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
GROUP BY s.CompanyName
ORDER BY ProductCount DESC;


--13. List the number of customers in each country. 
SELECT Country, COUNT(Id) AS CustomerCount
FROM Customer
GROUP BY Country;

--14. List the number of customers in each country, sorted high to low. 
SELECT Country, COUNT(Id) AS CustomerCount
FROM Customer
GROUP BY Country
ORDER BY CustomerCount DESC;

--15. List the total order amount for each customer, sorted high to low. 
SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customer c
JOIN [Order] o ON c.Id = o.CustomerId
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;


--16. List all countries with more than 2 suppliers. 
SELECT Country, COUNT(Id) AS SupplierCount
FROM Supplier
GROUP BY Country
HAVING COUNT(Id) > 2;




--17. List the number of customers in each country. Only include countries with more than 10 customers.
SELECT Country, COUNT(Id) AS CustomerCount
FROM Customer
GROUP BY Country
HAVING COUNT(Id) > 10;




--18. List the number of customers in each country, except the USA, sorted high to low. Only include countries with 9 or more customers. 
SELECT Country, COUNT(Id) AS CustomerCount
FROM Customer
WHERE Country <> 'USA'
GROUP BY Country
HAVING COUNT(Id) >= 9
ORDER BY CustomerCount DESC;


--19. List customer with average orders between $1000 and $1200. 
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AvgOrder
FROM Customer c
JOIN [Order] o ON c.Id = o.CustomerId
GROUP BY c.FirstName, c.LastName
HAVING AVG(o.TotalAmount) BETWEEN 1000 AND 1200;



--20. Get the number of orders and total amount sold between Jan 1, 2013 and Jan 31, 2013. 
SELECT COUNT(*) AS OrderCount, SUM(TotalAmount) AS TotalSales
FROM [Order]
WHERE OrderDate BETWEEN '2013-01-01' AND '2013-01-31';


