CREATE DATABASE DataMart_Ventas
USE DataMart_Ventas
GO

/*Creación de la dimensión cliente*/
CREATE TABLE Dim_Cliente 
(
	CustomerID INT,
	Name_Cli NVARCHAR(100) NOT NULL,
	Last_Name NVARCHAR(50),

	CONSTRAINT PK_Cliente PRIMARY KEY(CustomerID)
)
GO

/*Creación de la dimensión categoria*/
CREATE TABLE Dim_Categoria
(
	Product_CategoryID INT,
	Name_Cat NVARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Categoria PRIMARY KEY(Product_CategoryID)
)
GO

/*Creación de la dimensión producto*/
CREATE TABLE Dim_Producto
(
	ProductID INT,
	Product_CategoryID INT NOT NULL,
	Name_Pro NVARCHAR(50) NOT NULL,
	Selling_Price MONEY,

	CONSTRAINT PK_Producto PRIMARY KEY(ProductID),
	CONSTRAINT FK_Pro_Cat FOREIGN KEY(Product_CategoryID) REFERENCES Dim_Categoria(Product_CategoryID)

)
GO


/*Creación de la dimensión ubicación*/
CREATE TABLE Dim_Ubicacion
(
	TerritoryID INT,
	CountryRegionCode NVARCHAR(4) NOT NULL,
	Name_Territory NVARCHAR(50) NOT NULL,
	Group_Territory NVARCHAR(50),

	CONSTRAINT PK_Ubicacion PRIMARY KEY(TerritoryID)

)
GO



/*Creación de la dimensión Tienda*/
CREATE TABLE Dim_Tienda
(
	StoreID INT,
	Name_Store NVARCHAR(4) NOT NULL,
	
	CONSTRAINT PK_Tienda PRIMARY KEY(StoreID)

)
GO


/*Creación de la dimensión Empleado*/
CREATE TABLE Dim_Empleado
(
	EmployeeID INT,
	Name_Empl NVARCHAR(100) NOT NULL,
	Last_Name_Empl NVARCHAR(50),
	Gender NCHAR(1) NOT NULL,
	Job_tittle NVARCHAR(50),
	
	CONSTRAINT PK_Empleado PRIMARY KEY(EmployeeID)
)
GO



/*Creación de la dimensión Tiempo*/
CREATE TABLE Dim_Tiempo
(
	TimeID INT IDENTITY(1,1),
	Anio INT NOT NULL,
	Trimestre INT NOT NULL,
	Mes INT NOT NULL,
		
	CONSTRAINT PK_Tiempo PRIMARY KEY(TimeID)
)
GO


/*Creación deL Hecho Ventas*/
CREATE TABLE Fact_Ventas
(
	SalesOrderID INT,
	CustomerID INT NOT NULL,
	ProductID INT NOT NULL,
	TerritoryID INT NOT NULL,
	StoreID INT NOT NULL,
	EmployeeID INT,
	TimeID INT NOT NULL,
	Total_Venta MONEY NOT NULL,

	CONSTRAINT PK_Ventas PRIMARY KEY(SalesOrderID,CustomerID,ProductID, TerritoryID,TimeID),

	CONSTRAINT FK_Ventas_Cli FOREIGN KEY(CustomerID) REFERENCES Dim_Cliente(CustomerID),
	CONSTRAINT FK_Ventas_Pro FOREIGN KEY(ProductID) REFERENCES Dim_Producto(ProductID),
	CONSTRAINT FK_Ventas_Ubi FOREIGN KEY(TerritoryID) REFERENCES Dim_Ubicacion(TerritoryID),
	CONSTRAINT FK_Ventas_Tienda FOREIGN KEY(StoreID) REFERENCES Dim_Tienda(StoreID),
	CONSTRAINT FK_Ventas_Empl FOREIGN KEY(EmployeeID) REFERENCES Dim_Empleado(EmployeeID),
	CONSTRAINT FK_Ventas_Tiempo FOREIGN KEY(TimeID) REFERENCES Dim_Tiempo(TimeID)
)
GO
