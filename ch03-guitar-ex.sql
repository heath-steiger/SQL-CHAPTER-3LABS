SELECT *
	FROM Categories;


SELECT * 
	FROM Products;

-- #4 Exercise
SELECT ProductName, ListPrice, DiscountPercent,
	(ListPrice * (DiscountPercent/100)) AS DiscountAmount,
	(ListPrice - (ListPrice * (DiscountPercent/100))) As DiscountPrice
	FROM Products
ORDER BY DiscountPrice DESC;