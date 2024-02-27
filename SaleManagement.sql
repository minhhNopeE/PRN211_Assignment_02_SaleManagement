CREATE DATABASE SaleManagement

USE SaleManagement


CREATE TABLE Member(
	MemberId INT PRIMARY KEY,
	Email	        VARCHAR(100)	NOT NULL,
	CompanyName		VARCHAR(40)		NOT NULL,
	City			VARCHAR(15)		NOT NULL,
	Country			VARCHAR(15)		NOT NULL,
	[Password]		VARCHAR(30)		NOT NULL
)

CREATE TABLE Product(
	ProductId		INT				PRIMARY KEY,
	CategoryId		INT				NOT NULL,
	ProductName		VARCHAR(40)		NOT NULL,
	[Weight]		VARCHAR(20)		NOT NULL,
	UnitPrice		money			NOT NULL,
	UnitsInStock		INT				NOT NULL
)

CREATE TABLE Orders(
	OrderId			INT				PRIMARY KEY,
	MemberId		INT				NOT NULL,
	OrderDate		datetime		NOT NULL,
	RequiredDate	datetime		NULL,
	ShippedDate		datetime		NULL,
	Freight			money			NULL,
)

CREATE TABLE OrderDetail(
	OrderId			INT				FOREIGN KEY REFERENCES Orders(OrderId),
	ProductId		INT				FOREIGN KEY REFERENCES Product(ProductId),
	UnitPrice		money			NOT NULL,
	Quantity		INT				NOT NULL,
	Discount		FLOAT			NOT NULL,
	PRIMARY KEY (OrderId, ProductId)
)

INSERT INTO dbo.Member (MemberId, Email, CompanyName, City, Country, [Password])
VALUES
(2,'minhadmindepzai@gmail.com','FPT','Hola','Viet Nam','Minh6464#'),
(3,'minhdao@gmail.com','NEU','Ha Noi','Viet nam','123'),
(4,'nhatnon@gmail.com','Oxford','Oxford','UK','123'),
(5,'minhdn123456@fpt.edu.vn','FPT','HCM','Viet Nam','123456')

INSERT INTO dbo.Product(ProductId, CategoryId, ProductName, [Weight], UnitPrice, UnitsInStock)
VALUES
(1,1,'Pork','12',125000,5),
(2,1,'Beef','1',90000,6),
(3,2,'Chicken Meat','2',80000,7),
(4,2,'Fish','5',100000,5),
(5,3,'Goat Meat','7',160000,2)

SELECT * FROM Member
SELECT * FROM Product

INSERT INTO dbo.Orders(OrderId,MemberId,OrderDate, RequiredDate, ShippedDate, Freight)
VALUES
(1,5,'2024-02-21','2024-02-26','2024-02-26',10000),
(2,5,'2024-02-22','2024-02-24','2024-02-25',0)

SELECT * FROM dbo.Orders

INSERT INTO dbo.OrderDetail(OrderId, ProductId, Quantity,UnitPrice, Discount)
VALUES
(1,1,2,125000,5),
(1,2,3,90000,10),
(2,3,1,80000,10),
(2,4,2,100000,5)

SELECT * FROM dbo.OrderDetail