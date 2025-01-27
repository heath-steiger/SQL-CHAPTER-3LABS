-- exercise   3
SELECT FirstName, LastName, Line1, City, State, ZipCode
	FROM Customers C
	JOIN Addresses A ON C.ShippingAddressID = A.AddressID
	ORDER BY LINE1 AND
	C.CustomerID = A.CustomerID;

-- exercise 5
SELECT P1.ProductName, P1.ListPrice
	FROM Products P1
	JOIN Products P2 ON P1.ListPrice = P2.ListPrice
 WHERE P1.ProductID != P2.ProductID
  ORDER BY P1.ListPrice;
-- exercise 7
SELECT *
	

SELECT *
	FROM Products
SELECT *
	FROM Customers;
SELECT *
	FROM Addresses;