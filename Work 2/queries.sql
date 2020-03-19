--1
SELECT
  Name,
  ListPrice
FROM Production.Product
WHERE Style = 'W'
ORDER BY ListPrice

--2
SELECT Name
FROM Production.Product
WHERE MakeFlag = 0
ORDER BY Name

--3
SELECT
  FirstName,
  LastName,
  MiddleName
FROM Person.Contact
WHERE EmailPromotion = 1
ORDER BY 1, 2, 3

--4
SELECT Name
FROM Purchasing.Vendor
WHERE CreditRating = 2
ORDER BY Name DESC

--5
SELECT
  Name,
  Color
FROM Production.Product
WHERE MakeFlag = 1 AND Color IS NOT NULL
ORDER BY Color

--6
SELECT
  ProductLine,
  AVG(DaysToManufacture)
FROM Production.Product
GROUP BY ProductLine
HAVING ProductLine IS NOT NULL

--7
SELECT AVG(ListPrice)
FROM Production.Product
GROUP BY MakeFlag
HAVING MakeFlag <> 1

--8
SELECT
  CreditRating,
  Count(*)
FROM Purchasing.Vendor
GROUP BY CreditRating

--9
SELECT
  Name,
  OrderQty
FROM Production.Product as Product
  INNER JOIN Sales.SalesOrderDetail as SalesOrderDetail
    ON Product.ProductID = SalesOrderDetail.ProductID
ORDER BY 2

--10
SELECT Count(*)
FROM HumanResources.Employee
WHERE Gender = 'F' AND MaritalStatus = 'M'

--11
SELECT
  Gender,
  Sum(SickLeaveHours)
FROM HumanResources.Employee
GROUP BY Gender

--12
SELECT
  Title,
  Count(*)
FROM Person.Contact
GROUP BY Title
HAVING Title IS NOT NULL
ORDER BY 2 DESC

--13
SELECT
  MakeFlag,
  Avg(SafetyStockLevel)
FROM Production.Product
GROUP BY MakeFlag

--14
SELECT
  Name,
  DaysToManufacture
FROM Production.Product
WHERE MakeFlag = 1
ORDER BY DaysToManufacture, Name

--15
SELECT
  Style,
  Avg(ListPrice)
FROM Production.Product
GROUP BY Style
HAVING Style <> 'U'

--16
SELECT
  CreditRating,
  ActiveFlag,
  Count(*)
FROM Purchasing.Vendor
GROUP BY ActiveFlag, CreditRating
ORDER BY CreditRating

--17
SELECT
  SpecialOfferID,
  Min(UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING SpecialOfferID NOT IN (1, 8)
ORDER BY 1

--18
SELECT
  Title,
  Count(*)
FROM Person.Contact
GROUP BY Title
HAVING Title IN ('Mrs.', 'Ms', 'Ms.')