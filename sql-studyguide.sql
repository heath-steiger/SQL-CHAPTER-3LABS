--Be able to recognize the correct SQL statements for requests like these:

--Display all rows and columns from a table and sort by a column in that table
SELECT *
	FROM Vendors
--Display all columns from a table but only those rows where a column contains either A or B or C
Select * 
	FROM Vendors
WHERE VendorPhone IS NULL
--A valid join of two tables
SELECT COUNT(VendorName)
	FROM Vendors v
	JOIN Invoices I ON v.vendorID = I.VendorID
--Know what NULL means
does not exist, no data
--Know what the aggregate functions (min, max, count, sum, avg) do

			--min= the smallest data, max=maximum data, count counts the amount of entrys in a column, sum adds all the entrys together, 
		--avg takes the avgerage amount of the table 
SELECT COUNT(VendorName), CONCAT(VendorContactLName, VendorContactFName)
	FROM Vendors
	Group by VendorContactFName, VendorContactLName
--Know what 'group by' and 'having' clauses do and when you can use them
			--having, specifies certain requirments for the columns, group by groups the columns by the 
			-- requirment set, if there are multiple numbers such as one it will group them all into one group
--Know the two ways of adding comments and what each one does
-- /*
--Know what columns from a table must be included in the INSERT column list
every
--Know the effects of executing UPDATE or DELETE
--will add/delete on the tables
--Know the function that will take two or more strings, join them together, and return one string
-- CONCAT