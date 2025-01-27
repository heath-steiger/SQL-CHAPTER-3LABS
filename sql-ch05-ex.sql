--exercise 1
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices
GROUP BY VendorID;

--exercise 2
SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
	FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.VendorID
	GROUP BY VendorName;

--exercise 3
SELECT VendorName, COUNT(InvoiceID) AS InvoiceCount , SUM(InvoiceTotal) AS InvoiceSum 
	FROM Vendors V
 	JOIN Invoices I ON V.VendorID = I.VendorID
	GROUP BY VendorName
ORDER BY InvoiceCount DESC;
SELECT *
	FROM Invoices

--exercise 4
SELECT G.AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts G
	JOIN InvoiceLineItems I ON G.AccountNo = I.AccountNo
	GROUP BY G.AccountDescription
	HAVING COUNT(*) > 1
	ORDER BY LineItemCount DESC;

--exercise 5 Modify the solution to exercise 4 to filter for invoices dated from
--October 1, 2022 to December 31, 2022.
SELECT G.AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts G
	JOIN InvoiceLineItems IL ON G.AccountNo = IL.AccountNo
	JOIN Invoices I ON IL.InvoiceID = I.InvoiceID
WHERE InvoiceDate BETWEEN '2022-10-01' AND '2022-12-31'
	GROUP BY G.AccountDescription
	HAVING COUNT(*) > 1
	ORDER BY LineItemCount DESC;

--exercise 6
SELECT AccountNo, SUM(InvoiceLineItemAmount)
	FROM InvoiceLineItems
  GROUP BY ROLLUP(AccountNo);

--exercise 7
SELECT VendorName, AccountDescription, COUNT(V.VendorID) AS LineItemCount, 
SUM(InvoiceLineItemAmount) AS LineItemSum 
	FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.VendorID
	JOIN InvoiceLineItems IL ON I.InvoiceID = IL.InvoiceID
	JOIN GLAccounts G ON IL.AccountNo = G.AccountNo
GROUP BY VendorName, AccountDescription
ORDER BY VendorName, AccountDescription;

--exercise 8 
SELECT VendorName, COUNT (DISTINCT AccountNo) AS TotalAccounts
	FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.VendorID
	JOIN InvoiceLineItems IL ON I.InvoiceID = IL.InvoiceID
GROUP BY VendorName
HAVING COUNT(DISTINCT AccountNo) >= 2


--exercise 9
SELECT VendorID, InvoiceDate, InvoiceTotal, 
	SUM(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorTotal, 
	COUNT(VendorID) OVER (PARTITION BY VendorID) AS VendorCount,
	AVG(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorAvg
  FROM Invoices;


SELECT *
	FROM GLAccounts;
SELECT *
	FROM InvoiceLineItems;
SELECT *
	FROM Invoices;
SELECT *
	FROM Vendors;

