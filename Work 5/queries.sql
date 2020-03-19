--1
SELECT VendorID
FROM Purchasing.ProductVendor
WHERE ProductID IN (
  SELECT ProductID
  FROM Production.Product
  WHERE ProductLine = 'M'
)
ORDER BY VendorID

--2
SELECT Name
FROM Production.Product
WHERE ProductID IN (
  SELECT ProductVendor.ProductID
  FROM Purchasing.ProductVendor
)
ORDER BY Name

--3
SELECT
  CreditRating,
  count(*) AS Count
FROM Purchasing.Vendor
WHERE VendorID IN (
  SELECT VendorID
  FROM Purchasing.VendorAddress
    JOIN Person.Address
      ON VendorAddress.AddressID = Address.AddressID
  WHERE Address.City = 'New York'
)
GROUP BY CreditRating

--5
SELECT *
FROM HumanResources.Employee as CurrentEmployee
WHERE SickLeaveHours < (
  SELECT avg(SickLeaveHours)
  FROM HumanResources.Employee
  WHERE CurrentEmployee.Title = Title
)

--7
SELECT City
FROM Purchasing.Vendor
  JOIN Purchasing.VendorAddress
    ON Vendor.VendorID = VendorAddress.VendorID
  JOIN Person.Address
    ON VendorAddress.AddressID = Address.AddressID
GROUP BY City, CreditRating
HAVING CreditRating = 5

--8
SELECT
  City,
  count
FROM Purchasing.Vendor
  JOIN Purchasing.VendorAddress
    ON Vendor.VendorID = VendorAddress.VendorID
  JOIN Person.Address
    ON VendorAddress.AddressID = Address.AddressID
GROUP BY City
HAVING count(*) = 1

--11
SELECT CustomerID
FROM Sales.SalesOrderHeader AS OuterInfo
GROUP BY CustomerID
HAVING avg(SubTotal) > ALL (
  SELECT SubTotal
  FROM Sales.SalesOrderHeader AS InnerInfo
  WHERE OrderDate = '07.27.2004' AND InnerInfo.CustomerID = OuterInfo.CustomerID
)

