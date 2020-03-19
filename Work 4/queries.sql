--1
SELECT
  CustomerID,
  BillAddress.AddressLine1 AS BillAddress,
  ShipAddress.AddressLine1 AS ShipAddress
FROM Sales.SalesOrderHeader AS SalesOrderHeader
  JOIN Person.Address AS BillAddress
    ON SalesOrderHeader.BillToAddressID = BillAddress.AddressID
  JOIN Person.Address AS ShipAddress
    ON SalesOrderHeader.ShipToAddressID = ShipAddress.AddressID
WHERE BillToAddressID <> ShipToAddressID

--2
SELECT DISTINCT Boss.EmployeeID
FROM HumanResources.Employee AS Boss
  JOIN HumanResources.Employee AS Employee
    ON Boss.EmployeeID = Employee.ManagerID
WHERE
  Boss.MaritalStatus = 'S' AND
  Employee.MaritalStatus = 'S' AND
  Boss.Gender <> Employee.Gender

--3
SELECT
  FirstSalesPerson.SalesPersonID  AS FirstPersonID,
  SecondSalesPerson.SalesPersonID AS SecondPersonID
FROM Sales.SalesPerson AS FirstSalesPerson
  JOIN Sales.SalesPerson AS SecondSalesPerson
    ON FirstSalesPerson.CommissionPct = SecondSalesPerson.CommissionPct
WHERE FirstSalesPerson.SalesPersonID <> SecondSalesPerson.SalesPersonID

--4
SELECT
  'Component' AS Type,
  ComponentID AS ID
FROM Production.BillOfMaterials
WHERE BillOfMaterialsID = 400
UNION
SELECT
  'Product' AS Type,
  ProductAssemblyID
FROM Production.BillOfMaterials
WHERE BillOfMaterialsID = 400

--5
SELECT
  '36-37' AS Range,
  BillOfMaterialsID
FROM Production.BillOfMaterials
WHERE PerAssemblyQty BETWEEN 36 AND 37
UNION
SELECT
  '38-40' AS Range,
  BillOfMaterialsID
FROM Production.BillOfMaterials
WHERE PerAssemblyQty BETWEEN 38 AND 40

--6
SELECT
  '1-3'    AS Range,
  COUNT(*) AS Count
FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 1 AND 3
UNION
SELECT
  '4-6'    AS Range,
  COUNT(*) AS Count
FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 4 AND 6

--7
SELECT
  FirstCustomer.CustomerID  AS FirstCustomerID,
  SecondCustomer.CustomerID AS SecondCustomerID,
  FirstAddress.City
FROM Sales.CustomerAddress AS FirstCustomer
  JOIN Sales.CustomerAddress AS SecondCustomer
    ON FirstCustomer.CustomerID <> SecondCustomer.CustomerID
  JOIN Person.Address AS FirstAddress
    ON FirstCustomer.AddressID = FirstAddress.AddressID
  JOIN Person.Address AS SecondAddress
    ON SecondAddress.AddressID = SecondCustomer.AddressID
WHERE FirstAddress.City = SecondAddress.City

--8
SELECT
  UnitMeasureCode AS Code,
  COUNT(*)        AS Count
FROM Production.BillOfMaterials
GROUP BY UnitMeasureCode
HAVING UnitMeasureCode IN ('EA', 'OZ')

--9
SELECT
  FirstVendor.VendorID  AS FirstVendorID,
  SecondVendor.VendorID AS SecondVendorID
FROM Purchasing.VendorAddress AS FirstVendor
  JOIN Purchasing.VendorAddress AS SecondVendor
    ON FirstVendor.VendorID <> SecondVendor.VendorID
  JOIN Person.Address AS FirstVendorAddress
    ON FirstVendor.AddressID = FirstVendorAddress.AddressID
  JOIN Person.Address AS SecondVendorAddress
    ON SecondVendor.AddressID = SecondVendorAddress.AddressID
WHERE
  FirstVendorAddress.City = SecondVendorAddress.City AND
  FirstVendorAddress.AddressLine1 = SecondVendorAddress.AddressLine1

--10
SELECT DISTINCT Boss.EmployeeID
FROM HumanResources.Employee AS Boss
  JOIN HumanResources.Employee AS Employee
    ON Boss.EmployeeID = Employee.ManagerID
WHERE
  Boss.MaritalStatus = 'S' AND
  Employee.MaritalStatus = 'S' AND
  Boss.Gender <> Employee.Gender