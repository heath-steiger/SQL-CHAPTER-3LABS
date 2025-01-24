--exercise 1
--Write a SELECT statement that returns all columns
--from the Vendors table inner-joined with the Invoices table

SELECT VendorName, InvoiceNumber
	FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.InvoiceID;

--exercise 2
--Write a SELECT statement that returns four columns--VendorName    From the Vendors table --InvoiceNumber     From the Invoices table--InvoiceDate     From the Invoices table--Balance     InvoiceTotal minus the sum of PaymentTotal and CreditTotalSELECT VendorName, InvoiceNumber, InvoiceDate, ( InvoiceTotal - (PaymentTotal + CreditTotal)) AS Balance	FROM Invoices I	JOIN Vendors V ON V.VendorID = I.InvoiceIDWHERE ( InvoiceTotal - (PaymentTotal + CreditTotal)) > 0ORDER BY VendorName ASC;--exercise 3SELECT VendorName, DefaultAccountNo, AccountDescription	FROM Vendors V	JOIN GLAccounts G ON V.DefaultAccountNo = G.AccountNoORDER BY AccountDescription, VendorName;--exercise 4SELECT VendorName, InvoiceNumber, InvoiceDate, ( InvoiceTotal - (PaymentTotal + CreditTotal)) AS Balance	FROM Invoices I, Vendors V WHERE I.InvoiceID = V.VendorID AND ( InvoiceTotal - (PaymentTotal + CreditTotal)) > 0ORDER BY VendorName ASC;--exercise 5SELECT VendorName as Vendor, InvoiceDate as Date, InvoiceNumber as number , InvoiceSequence AS #, InvoiceLineItemAmount AS LineItem	FROM Vendors V, Invoices i, InvoiceLineItems li	WHERE V.VendorID = I.VendorID AND I.InvoiceID = LI.InvoiceID ORDER BY Vendor, Date, number, #;  
 --exercise 6

SELECT DISTINCT V1.VendorID, V1.VendorName, (V1.VendorContactFName + ' ' + V1.VendorContactLName) as name 
	FROM Vendors V1
	JOIN Vendors V2 on V1.VendorID <> V2.VendorID
	AND (V1.VendorContactFName = V2.VendorContactFName)
ORDER BY name;

--exercise 7


SELECT G.AccountNo, G.AccountDescription
	FROM GLAccounts G
	LEFT JOIN InvoiceLineItems I
	on G.AccountNo = I.AccountNo
WHERE I.AccountNo IS NULL
ORDER BY AccountNo;




	
	 