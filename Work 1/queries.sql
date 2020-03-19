--1
SELECT Name
FROM Purchasing.Vendor
WHERE ActiveFlag = 1

--2
SELECT
  Name,
  CreditRating
FROM Purchasing.Vendor
WHERE CreditRating BETWEEN 2 AND 4

--3
SELECT
  Name,
  PurchasingWebServiceURL
FROM Purchasing.Vendor
WHERE PurchasingWebServiceURL IS NOT NULL

--4
SELECT DISTINCT FirstName
FROM Person.Contact
WHERE Title IN ('Mrs.', 'Ms', 'Ms.')

--5
SELECT
  Title,
  FirstName,
  LastName,
  MiddleName,
  EmailAddress
FROM Person.Contact
WHERE EmailPromotion = 1

--6
SELECT
  Title,
  FirstName,
  LastName,
  MiddleName,
  Phone
FROM Person.Contact
WHERE Phone LIKE '%016%'

--7
SELECT DISTINCT Size
FROM Production.Product
WHERE MakeFlag = 0

--8
SELECT Title
FROM HumanResources.Employee
WHERE Gender = 'M'

--9
SELECT
  Title,
  HireDate
FROM HumanResources.Employee
WHERE HireDate = '04.01.2000'

--10
SELECT
  Title,
  HireDate
FROM HumanResources.Employee
WHERE HireDate BETWEEN '01.03.1999' AND '31.01.2000'

--11
SELECT NationalIDNumber
FROM HumanResources.Employee
WHERE (VacationHours + SickLeaveHours) > 100

--12
SELECT Name
FROM Production.Product
WHERE Size = 40 AND SizeUnitMeasureCode = 'CM'

--13
SELECT Name
FROM Production.Product
WHERE ProductLine != 'T'

--14
SELECT Name
FROM Production.Product
WHERE MakeFlag = 1 AND DaysToManufacture > 3

--15
SELECT DISTINCT Size
FROM Production.Product
WHERE MakeFlag = 0