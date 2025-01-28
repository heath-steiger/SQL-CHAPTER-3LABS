-- Cha[ter 6 Demos

-- p. 161
-- Return all invoices whose total > avg invoice total
SELECT * 
	FROM Invoices;

SELECT AVG(InvoiceTotal)
	FROM Invoices

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal	
	FROM Invoices
Where InvoiceTotal > 
  (SELECT AVG(InvoiceTotal)
	FROM Invoices)
ORDER BY InvoiceTotal

-- P.163 A query that uses an inner join
-- Join Invoices to Vendors, Show Inv#, InvDate, InvTotal for invoice vendors from CA

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V ON I.VendorID = V.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

-- same query as a subquery
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
WHERE VendorID IN
	(SELECT VendorID
		FROM Vendors 
		WHERE VendorState = 'CA')
ORDER BY InvoiceDate;

--p. 165
-- Vendors without invoices
SELECT VendorID, VendorName, VendorState
	FROM Vendors
  WHERE VendorID NOT IN
   (SELECT DISTINCT VendorID FROM Invoices);

-- Same without Subquery
SELECT V.VendorID, VendorName, VendorState
	FROM Vendors V
	LEFT JOIN Invoices I ON V.VendorID = I.VendorID
  WHERE I.VendorID IS NULL;

--p. 167 Invoice payment details, see balance due where bd is less than avg bd
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
	FROM Invoices
  WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
  and (InvoiceTotal - PaymentTotal - CreditTotal) <
  (SELECT AVG(InvoiceTotal - PaymentTotal - CreditTotal)
	FROM Invoices
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0) 
ORDER BY InvoiceTotal DESC;
-- all invoices whose total are > vendor id 34's invoices
SELECT VendorName, InvoiceNumber, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V ON V.VendorID = I.VendorID
 WHERE InvoiceTotal > ALL
	(Select InvoiceTotal 
		FROM Invoices
	Where VendorID = 34)
	ORDER BY VendorName;


--p. 171
--Invoice Totals for vendorid 115
SELECT InvoiceTotal	
	FROM Invoices
  WHERE VendorID = 115;

--Invoices < any of vendor 115's
SELECT *	
	FROM Vendors V
  JOIN Invoices I ON I.VendorID = V.VendorID
  WHERE InvoiceTotal < ANY
  (SELECT InvoiceTotal	
	FROM Invoices
  WHERE VendorID = 115);

-- P. 173 query that uses a correlated subquery
SELECT VendorID, InvoiceNumber, InvoiceTotal
	FROM Invoices I1
   WHERE InvoiceTotal >
	(Select AVG(InvoiceTotal) FROM Invoices I2
	WHERE I2.VendorID = I1.VendorID)
ORDER BY VendorID, InvoiceTotal

--p. 175 WHERE ECISTS/NOT EXISTS
;SELECT VendorID, VendorName, VendorState
	FROM Vendors V
WHERE NOT EXISTS 
(SELECT *
	FROM Invoices I 
	WHERE I.VendorID = V.VendorID)