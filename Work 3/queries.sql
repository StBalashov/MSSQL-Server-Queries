--1
SELECT
  FirstName,
  LastName,
  Employee.Title,
  Phone
FROM HumanResources.Employee AS Employee
INNER JOIN Person.Contact AS Contact
  ON Employee.ContactID = Contact.ContactID
WHERE Phone IS NOT NULL

--2
SELECT COUNT(*)
FROM HumanResources.Employee AS Employee
INNER JOIN Person.Contact AS Contact
  ON Employee.ContactID = Contact.ContactID
WHERE EmailAddress IS NOT NULL

--3
SELECT
  FirstName,
  LastName,
  EmailAddress
FROM Purchasing.VendorContact AS VendorContact
  JOIN Person.Contact AS Contact
    ON VendorContact.ContactID = Contact.ContactID
  JOIN Purchasing.Vendor AS Vendor
    ON VendorContact.VendorID = Vendor.VendorID
ORDER BY Name

--4
SELECT
  FirstName,
  LastName,
  Name
FROM Purchasing.VendorContact AS VendorContact
  JOIN Person.ContactType AS ContactType
    ON VendorContact.ContactTypeID = ContactType.ContactTypeID
  JOIN Person.Contact AS Contact
    ON VendorContact.ContactID = Contact.ContactID

--5
SELECT
  FirstName,
  LastName,
  ContactType.Name
FROM Purchasing.VendorContact as VendorContact
  INNER JOIN Person.ContactType as ContactType
    ON VendorContact.ContactTypeID = ContactType.ContactTypeID
  INNER JOIN Person.Contact as Contact
    ON VendorContact.ContactID = Contact.ContactID
  LEFT JOIN Purchasing.ProductVendor as ProductVendor
    ON VendorContact.VendorID = ProductVendor.VendorID
  INNER JOIN Production.Product as Product
    ON ProductVendor.ProductID = Product.ProductID
WHERE Product.ProductLine = 'M'
ORDER BY 1, 2 DESC

--6
SELECT
  Product.Name,
  Vendor.Name
FROM Production.Product AS Product
  LEFT JOIN Purchasing.ProductVendor AS ProductVendor
    ON Product.ProductID = ProductVendor.ProductID
  LEFT JOIN Purchasing.Vendor AS Vendor
    ON ProductVendor.VendorID = Vendor.VendorID
WHERE ProductLine = 'T'

--7
SELECT
  ProductLine,
  avg(Product.ListPrice)
FROM Production.Product
WHERE MakeFlag = 0
GROUP BY ProductLine
HAVING ProductLine IS NOT NULL

--8
SELECT Product.Name
FROM Sales.SalesOrderHeader AS SalesOrderHeader
  INNER JOIN Sales.SalesOrderDetail AS SalesOrderDetail
    ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
  INNER JOIN Production.Product AS Product
    ON SalesOrderDetail.ProductID = Product.ProductID
WHERE OrderDate = '01.02.2004'

--9
SELECT
  Product.Name,
  sum(OrderQty)
FROM Sales.SalesOrderDetail AS SalesOrderDetail
  INNER JOIN Production.Product AS Product
    ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY Product.Name

--10
SELECT
  FirstName,
  LastName,
  Phone
FROM Person.Contact as Contact
  INNER JOIN Sales.SalesOrderHeader as SalesOrderHeader
    ON Contact.ContactID = SalesOrderHeader.ContactID
WHERE Status = 1