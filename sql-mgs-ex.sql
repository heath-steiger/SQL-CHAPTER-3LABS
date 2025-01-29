
--CHAPTER 2
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
	
--CHAPTER 6

-- exercise 1
SELECT DISTINCT(CategoryName)
	FROM Categories C 
	JOIN Products P ON C.CategoryID = P.CategoryID
ORDER BY CategoryName;

SELECT DISTINCT(CategoryName)
	FROM Categories  
	WHERE CategoryID IN
	(SELECT CategoryID
	  FROM Products)
ORDER BY CategoryName;

-- exercise 4
SELECT EmailAddress, O.OrderID, SUM((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal
	FROM Orders O
	JOIN Customers C ON C.CustomerID = O.CustomerID
	JOIN OrderItems OI ON O.OrderID = OI.OrderID
GROUP BY EmailAddress, O.OrderID
ORDER BY EmailAddress
	
SELECT EmailAddress, MAX(OrderTotal) AS LargestOrder
	FROM (SELECT EmailAddress, O.OrderID, SUM((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal
		FROM Orders O
		JOIN Customers C ON C.CustomerID = O.CustomerID
		JOIN OrderItems OI ON O.OrderID = OI.OrderID
	GROUP BY EmailAddress, O.OrderID) AS OrderTotals
GROUP BY EmailAddress; 

SELECT *
	FROM Orders
SELECT *
	FROM Customers;
SELECT *
	FROM OrderItems;