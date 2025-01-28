--exercise 1SELECT DISTINCT VendorName 	FROM Vendors v	WHERE VendorID IN 	 (SELECT VendorID		FROM Invoices)	ORDER BY VendorName;--exercise 2SELECT InvoiceTotal, InvoiceNumber	FROM Invoices WHERE PaymentTotal > (SELECT AVG(PaymentTotal)		FROM Invoices	WHERE PaymentTotal <> 0);--exercise 3SELECT InvoiceTotal, InvoiceNumber	FROM Invoices WHERE PaymentTotal > ALL (SELECT TOP 50 PERCENT PaymentTotal		FROM Invoices	WHERE PaymentTotal <> 0	ORDER BY PaymentTotal);--exercise 4SELECT AccountNo, AccountDescription
	FROM GLAccounts G
  WHERE NOT EXISTS
  (SELECT *
	FROM InvoiceLineItems I
	WHERE I.AccountNo = G.AccountNo)
ORDER BY AccountNo;

--exercise 5
SELECT Vendorname, I.InvoiceID, InvoiceSequence, InvoiceLineItemAmount
	FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.VendorID
	JOIN InvoiceLineItems IL ON I.InvoiceID = IL.InvoiceID
	WHERE IL.InvoiceID IN
		(SELECT InvoiceID
			FROM InvoiceLineItems
			WHERE InvoiceSequence > 1)--Write a SELECT statement that returns a single value that represents --the sum of the largest unpaid invoices submitted by each vendor.--Use a derived table that returns MAX(InvoiceTotal) grouped by VendorID, --filtering for invoices with a balance due.
--exercise 6SELECT SUM(InvoiceMax) AS SumOfMaximums	FROM	(SELECT VendorID, MAX(InvoiceTotal) AS InvoiceMax 				FROM Invoices			 WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0	GROUP BY VendorID) AS MaxInvoice 

 Select VendorID, MAX(InvoiceTotal) as maximum
	from Invoices 
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
	GROUP BY VendorID

--exercise 7
SELECT VendorName, VendorCity, VendorState
	FROM Vendors
	WHERE VendorState + VendorCity NOT IN
	(SELECT VendorState + VendorCity
	 FROM Vendors
	 GROUP BY vendorState + VendorCity
	 HAVING COUNT(*) > 1)
ORDER BY VendorState, VendorCity;

--exercise 8
SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V ON I.VendorID = V.VendorID
	WHERE InvoiceDate =
		(Select MIN(InvoiceDate) 
			FROM Invoices I2
			WHERE I2.VendorID = I.VendorID)
	ORDER BY VendorName;

SELECT DISTINCT VendorName,(SELECT MIN(InvoiceDate) FROM Invoices i WHERE i.VendorID = v.VendorID) AS LatestInvFROM Vendors v ORDER BY LatestInv DESC; 	 
 SELECT *
	FROM Invoices	ORDER BY InvoiceDateSELECT * 	FROM InvoiceLineItems	SELECT DISTINCT VendorName 	FROM Vendors v   JOIN Invoices i ON v.VendorID = i.VendorID   ORDER BY VendorName;