-- p. 137

SELECT *
	FROM Invoices;

SELECT Invoicenumber, (INvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices;

SELECT COUNT(*)
	FROM Invoices;

-- how many invoices have a balance due?
SELECT COUNT(*) AS NumberOfInvoices, SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;

-- how many total invoices, avg inv total, total inv amount? for invoices after 7/1/22
SELECT 'After 7/1/2022' As SelectionDate,
		COUNT(*) AS NumberOfInvoices,
		AVG(InvoiceTotal) AS AvgInvoiceAmount,
		SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices
WHERE InvoiceDate > '2022-07-01';

-- p. 139 MIN and MAX
SELECT 'After 7/1/2022' As SelectionDate,
		COUNT(*) AS NumberOfInvoices,
		MAX(InvoiceTotal) AS HighestInvoiceAmount,
		MIN(InvoiceTotal) AS LowestInvoiceAmount
	FROM Invoices
WHERE InvoiceDate > '2022-07-01';

-- p. 139 First Or last vendor, alphabetically?
SELECT MIN(Vendorname) AS FirstVendor,
	MAX(VendorName) AS LastVendor,
	COUNT(VendorName) AS NumberOfVendors
  FROM Vendors;

-- p. 139 using DISTINCT in summary queries - distinct # of vendors
SELECT COUNT(DISTINCT VendorID) as NumberOfVendors,
		COUNT(*) AS NumberOfInvoices,
		AVG(InvoiceTotal) AS AvgInvoiceAmount,
		SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices

-- p. 141 Average Inv Amount by Vendor - avg over $2000?
SELECT VendorID, AVG(InvoiceTotal) AS AvgInvAmt
	FROM Invoices
  GROUP BY VendorID
  HAVING AVG(InvoiceTotal) > 2000
  ORDER BY AvgInvAmt DESC;

-- p. 143  # of invoice by vendor
SELECT VendorID, COUNT(*) AS InvoiceQty
	FROM Invoices
	GROUP BY VendorID;

-- p. 143 Vendors by state and city, inv qty and inv avg
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty, AVG(InvoiceTotal) AS InvoiceAvg
	FROM Invoices I
	JOIN Vendors V ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VendorState, VendorCity

-- limit the results using having clause
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty, AVG(InvoiceTotal) AS InvoiceAvg
	FROM Invoices I
	JOIN Vendors V ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
HAVING COUNT(*) >=2
ORDER BY VendorState, VendorCity;

-- p. 145 search condition in HAVING clause
SELECT VendorName, COUNT(*) AS InvoiceQty,
		AVG(InvoiceTotal) AS InvoiceAvg
	FROM Vendors V
	JOIN Invoices I on V.VendorID = I.VendorID
GROUP BY VendorName
HAVING AVG (InvoiceTotal) > 500
ORDER BY InvoiceQty DESC;

-- P.145 search condition in the WHERE clause
SELECT VendorName, COUNT(*) AS InvoiceQty,
		AVG(InvoiceTotal) AS InvoiceAvg
	FROM Vendors V
	JOIN Invoices I on V.VendorID = I.VendorID
WHERE InvoiceTotal > 500
GROUP BY VendorName
ORDER BY InvoiceQty DESC;

-- p. 149 Invoices by Vendor, grouped, to get inv vount and inv total, with summary

SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices
GROUP BY ROLLUP(VendorID);

-- rollup multiple columns: vendors from IA NJ ROLLUP by vendor state and city

SELECT VendorState, VendorCity, COUNT(*) AS Qtyvendors
	FROM Vendors
  WHERE VendorState IN ('IA', 'NJ')
  GROUP BY ROLLUP(VendorState, VendorCIty)
  ORDER BY VendorState DESC, VendorCity DESC;

-- P.151
SELECT VendorID, COUNT(*) as InvoiceCount,
		SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices
GROUP BY CUBE(VendorID);

SELECT VendorState, VendorCity, COUNT(*) AS Qtyvendors
	FROM Vendors
  WHERE VendorState IN ('IA', 'NJ')
  GROUP BY CUBE(VendorState, VendorCIty)
  ORDER BY VendorState DESC, VendorCity DESC;

--p. 153 grouping sets
SELECT VendorState, VendorCity, COUNT(*) AS Qtyvendors
	FROM Vendors
  WHERE VendorState IN ('IA', 'NJ')
  GROUP BY GROUPING SETS(VendorState, VendorCIty)
  ORDER BY VendorState DESC, VendorCity DESC;

 -- COMPOSITE GROUPING
 SELECT VendorState, VendorCity, VendorZipCode, COUNT(*) AS Qtyvendors
	FROM Vendors
  WHERE VendorState IN ('IA', 'NJ')
  GROUP BY GROUPING SETS((VendorState, VendorCIty), VendorZipCode, ())
  ORDER BY VendorState DESC, VendorCity DESC;

  --P. 155 
  SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, 
  SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
    COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	  AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAVG
	FROM Invoices;