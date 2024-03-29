CREATE DATABASE DataMart_Ventas
USE DataMart_Ventas
GO

/*Creaci�n de la dimensi�n cliente*/
CREATE TABLE Dim_Cliente 
(
	CustomerID INT,
	FullName_Cli NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY(CustomerID)
)
GO

/*Creaci�n de la dimensi�n categoria*/
CREATE TABLE Dim_Categoria
(
	Product_CategoryID INT,
	Name_Cat NVARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Categoria PRIMARY KEY(Product_CategoryID)
)
GO

/*Creaci�n de la dimensi�n producto*/
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


/*Creaci�n de la dimensi�n ubicaci�n*/
CREATE TABLE Dim_Ubicacion
(
	TerritoryID INT,
	Name_Territory NVARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Ubicacion PRIMARY KEY(TerritoryID)

)

GO



/*Creaci�n de la dimensi�n Tienda*/
CREATE TABLE Dim_Tienda
(
	StoreID INT,
	Name_Store NVARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Tienda PRIMARY KEY(StoreID)

)
GO


/*Creaci�n de la dimensi�n Empleado*/
CREATE TABLE Dim_Empleado
(
	EmployeeID INT,
	FullName_Empl NVARCHAR(100) NOT NULL,
	Gender NCHAR(1) NOT NULL,
	
	CONSTRAINT PK_Empleado PRIMARY KEY(EmployeeID)
)
GO



/*Creaci�n de la dimensi�n Tiempo*/
CREATE TABLE Dim_Tiempo
(
	TimeID DATE,
	Anio INT NOT NULL,
	Trimestre INT NOT NULL,
	Mes INT NOT NULL,
		
	CONSTRAINT PK_Tiempo PRIMARY KEY(TimeID)
)
GO


/*Creaci�n deL Hecho Ventas*/
CREATE TABLE Fact_Ventas
(
	SalesOrderID INT,
	CustomerID INT NOT NULL,
	EmployeeID INT,
	ProductID INT NOT NULL,
	TerritoryID INT NOT NULL,
	TimeID DATE NOT NULL,
	StoreID INT NOT NULL,
	Total_Venta MONEY NOT NULL,

	CONSTRAINT PK_Ventas PRIMARY KEY(SalesOrderID,CustomerID,EmployeeID,ProductID,TerritoryID, TimeID,StoreID),

	CONSTRAINT FK_Ventas_Cli FOREIGN KEY(CustomerID) REFERENCES Dim_Cliente(CustomerID),
	CONSTRAINT FK_Ventas_Pro FOREIGN KEY(ProductID) REFERENCES Dim_Producto(ProductID),
	CONSTRAINT FK_Ventas_Ubi FOREIGN KEY(TerritoryID) REFERENCES Dim_Ubicacion(TerritoryID),
	CONSTRAINT FK_Ventas_Tienda FOREIGN KEY(StoreID) REFERENCES Dim_Tienda(StoreID),
	CONSTRAINT FK_Ventas_Empl FOREIGN KEY(EmployeeID) REFERENCES Dim_Empleado(EmployeeID),
	CONSTRAINT FK_Ventas_Tiempo FOREIGN KEY(TimeID) REFERENCES Dim_Tiempo(TimeID)
)
GO
