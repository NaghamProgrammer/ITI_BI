-- lab 5 part 2 adventure works database

SELECT SalesOrderID, ShipDate
FROM Sales.SalesOrderHeader
WHERE ShipDate BETWEEN '2002-07-28' AND '2014-07-29';



SELECT ProductID, Name
FROM Production.Product
WHERE StandardCost < 110.00;




SELECT ProductID, Name
FROM Production.Product
WHERE Weight IS NULL;



SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IN ('Silver', 'Black', 'Red');


SELECT ProductID, Name
FROM Production.Product
WHERE Name LIKE 'B%';


UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3;


SELECT ProductDescriptionID, Description
FROM Production.ProductDescription
WHERE Description LIKE '%[_]%';



SELECT OrderDate, SUM(TotalDue) AS TotalDueSum
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2001-07-01' AND '2014-07-31'
GROUP BY OrderDate
ORDER BY OrderDate;


SELECT DISTINCT HireDate
FROM HumanResources.Employee
ORDER BY HireDate;


SELECT AVG(DISTINCT ListPrice) AS AvgUniqueListPrice
FROM Production.Product;



SELECT 
    'The ' + Name + ' is only! ' + CAST(ListPrice AS VARCHAR) AS ProductInfo
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 120
ORDER BY ListPrice;



