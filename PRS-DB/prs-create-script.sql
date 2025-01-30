USE master
GO


DROP DATABASE IF EXISTS PRS

CREATE DATABASE PRS
GO

USE PRS
GO

-- User Table
CREATE TABLE [User](
	ID			INT				IDENTITY(1,1)	PRIMARY KEY,
	Username	VARCHAR(20)		NOT NULL,
	Password	VARCHAR(10)		NOT NULL,
	FirstName	VARCHAR(20)		NOT NULL,
	LastName	VARCHAR(20)		NOT NULL, 
	PhoneNumber VARCHAR(12)		NOT NULL,
	Email		VARCHAR(75)		NOT NULL, 
	Reviewer	BIT				NOT NULL, 
	Admin		BIT				NOT NULL
	CONSTRAINT UC_Uname UNIQUE (Username)
);

-- Vendor Table
CREATE TABLE Vendor(
	ID			INT				IDENTITY(1,1)	PRIMARY KEY,
	Code		VARCHAR(10)		NOT NULL,
	Name		VARCHAR(255)	NOT NULL,
	Address		VARCHAR(255)	NOT NULL,
	City		VARCHAR(255)	NOT NULL, 
	State		VARCHAR(2)		NOT NULL,
	Zip			VARCHAR(5)		NOT NULL, 
	PhoneNumber	VARCHAR(12)		NOT NULL, 
	Email		VARCHAR(100)	NOT NULL
		CONSTRAINT UC_vcode UNIQUE (Code)
);


-- Product Table
CREATE TABLE Product(
	ID				INT				IDENTITY(1,1)	PRIMARY KEY,
	VendorID		INT				NOT NULL,
	PartNumber		VARCHAR(50)		NOT NULL,
	Name			VARCHAR(150)	NOT NULL,
	Price			DECIMAL(10,2)	NOT NULL, 
	Unit			VARCHAR(255)	NULL,
	PhotoPath		VARCHAR(255)	NULL, 
		CONSTRAINT UC_vendor_part UNIQUE (VendorID,PartNumber),
		CONSTRAINT FK_Product_Vendor FOREIGN KEY (VendorID) REFERENCES Vendor(ID)
);


-- Request Table
CREATE TABLE Request(
	ID						INT				IDENTITY(1,1)	PRIMARY KEY,
	UserID					INT							NOT NULL,
	RequestNumber			VARCHAR(20)					NOT NULL,
	Description				VARCHAR(100)				NOT NULL,
	Justification			VARCHAR(255)				NOT NULL, 
	DateNeeded				DATE						NOT NULL,
	DeliveryMode			VARCHAR(25)					NOT NULL, 
	Status					VARCHAR(20) DEFAULT 'NEW'	NOT NULL, 
	Total  					DECIMAL(10,2) DEFAULT 0.0	NOT NULL,
	SubmittedDate			DATETIME					NOT NULL, 
	ReasonForRejection		VARCHAR(100)				NULL
		CONSTRAINT FK_Request_UserID FOREIGN KEY (UserID) REFERENCES [User](ID)
		);

CREATE TABLE LineItem(
	ID					INT				IDENTITY(1,1)	PRIMARY KEY,
	RequestID			INT				NOT NULL,
	ProductID			INT				NOT NULL,
	Quantity			INT				NOT NULL
	CONSTRAINT UC_req_pdt UNIQUE (RequestID,ProductID),
	CONSTRAINT FK_LineItem_product FOREIGN KEY (ProductID) REFERENCES Product(ID),
	CONSTRAINT FK_LineItem_Requst FOREIGN KEY (RequestID) REFERENCES Request(ID)
	);



---------------------------------------------------------------------------------------------
----------------------------------INSERTIONS-------------------------------------------------
----------------------------------LOTR THEME-------------------------------------------------

--UserInsert
Insert INTO [User](Username, Password, FirstName, LastName, PhoneNumber, Email, Reviewer, Admin)
		VALUES  ('FroBag', 'Iwilldoit', 'Frodo', 'Baggins', '101-302-5003', 'Frodo@TheOneRing.com',1,1),
			('Strider', 'ForFrodo', 'Aragorn','Elessar', '320-564-2012','KingAragorn@Gondor.com',1,0)



--VendorInsert
Insert INTO Vendor(Code, Name, Address, City, State, Zip, PhoneNumber, Email)
			VALUES('0012546891', 'White City', '4567 Minas Anor Ln', 'Minas Tirith', 'GO', '45789', '320-609-3218', 'Gondor@CallsForAid.com'),
				  ('1000056123', 'Imladris', '1878 River Dr', 'Rivendell', 'ER', '62354', '546-484-1532', 'Elrond@HalfElf.com'),
				  ('8542133545', 'Bag End', '8514 Sackville Ct', 'Shire', 'HO', '64686', '101-659-2357', 'Bilbo@BagEnd.com');



--ProductInsert
Insert INTO Product(VendorID, PartNumber, Name, Price, Unit)
			 Values(2, 000123, 'The One Ring', 10500.99, 1),
				   (3, 0101015, 'Tobacco Pipe', 100.00, 2),
				   (1, 220001,  'Uniform', 80.00, 1),
				   (2, 000001, 'Lembas Bread', 14.99, 5),
				   (2, 000023, 'Cloak', 65.00,1),
				   (1, 220003, 'Shield', 78.00, 1);
				  


--RequestInsert
Insert INTO Request(UserID, RequestNumber, Description, Justification, DateNeeded, DeliveryMode, Total, SubmittedDate)
			 Values(1, '01', 'The One Ring', 'Need to Destroy', '3018-10-20', 'Pick-Up', 10500.99, '3018-10-18')


--LineItemRequest
Insert INTO LineItem(RequestID, ProductID, Quantity)
			  Values(1, 1, 1);
