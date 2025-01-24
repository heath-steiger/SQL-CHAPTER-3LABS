--Chapter 4 Demos


-- Vendors and Invoices tables
SELECT *
	FROM Vendors;

SELECT *
	FROM Invoices
ORDER BY VendorID;


-- p 103. join vendors and invoices
SELECT InvoiceNumber, VendorName
	FROM Invoices
	JOIN Vendors ON Vendors.VendorID = Invoices.VendorID;
-- All Vendors who have been invoiced

--p. 105 - aliases in joins

SELECT InvoiceNumber, VendorName
	FROM Invoices AS Inv
	JOIN Vendors AS Ven ON Ven.VendorID = Inv.VendorID;

-- a little simpler
SELECT InvoiceNumber, VendorName
	FROM Invoices AS I
	JOIN Vendors AS V ON V.VendorID = I.VendorID;

-- simplest form
SELECT InvoiceNumber, VendorName
	FROM Invoices I
	JOIN Vendors V ON V.VendorID = I.VendorID;

-- add in a caluclated column, where and order by
SELECT InvoiceNumber, VendorName, InvoiceDueDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
	FROM Invoices I
	JOIN Vendors V ON V.VendorID = I.VendorID
 WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
ORDER BY InvoiceDueDate DESC;

-- p. 107 fully qualified object names
SELECT *
	FROM Ap.dbo.Vendors
--p. 109 joining on multiple things
--invoices to invoicelineitems and invoicetotal to invoicelineitemamount
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
	FROM Invoices I
	JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
	 AND I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber;

-- changing 2nd condition to a where clause
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
	FROM Invoices I
	JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
  WHERE I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber;


--p. 111 Vendors Table - self join
-- vendors from cities in common with other vendors
SELECT DISTINCT V1.VendorName, V1.VendorCity, V1.VendorState
	FROM Vendors V1
	JOIN Vendors V2 ON V1.VendorCity = V2.VendorCity
					AND V1.VendorState = V2.VendorState
					AND V1.VendorID <> V2.VendorID
ORDER BY V1.VendorState, V1.VendorCity;
--p. 113 

--p. 115 implicit join - vendors and invoices (vendors who have invoices)
SELECT InvoiceNumber, VendorName
	FROM Invoices I, Vendors V
WHERE V.VendorID = I.VendorID;

-- which vendors have we invoiced?
-- which vendors have we not done business with?
SELECT *
	FROM Invoices
-- which vendors have spent the most money with us?

--vendors & invoices - left outter join
-- we want all data from vendors and invoiec data if exists
SELECT VendorName, InvoiceNumber, InvoiceTotal
	FROM Vendors V
	LEFT JOIN Invoices I ON V.VendorId = I.VendorID
ORDER BY VendorName;

-- same thing as right outter joing
SELECT VendorName, InvoiceNumber, InvoiceTotal
	FROM Invoices I
	Right JOIN Vendors V ON V.VendorId = I.VendorID
ORDER BY VendorName;

--vendors and invioces - left outter join where InvoiceNumber is NULL
-- Which vendors have we not done vusiness with (don't appear in the invoices table)?
SELECT VendorName, InvoiceNumber, InvoiceTotal
	FROM Vendors V
	LEFT JOIN Invoices I ON V.VendorId = I.VendorID
WHERE InvoiceNumber IS NULL
ORDER BY VendorName;