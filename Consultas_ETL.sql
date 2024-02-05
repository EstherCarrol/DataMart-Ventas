

/*Consulta para extraer datos de fecha*/
SELECT Distinct([OrderDate]) as TimeID,
		YEAR(OrderDate) AS Anio,
		DATEPART(QUARTER,OrderDate) as Trimestre,
		DATEPART(MONTH,OrderDate) as Mes
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]


/*Consulta para extraer datos para la dimensión Producto*/
 SELECT PRO.ProductID, PRO.Name, CAT.ProductCategoryID, PRO.ListPrice
 FROM Production.Product PRO
 INNER JOIN Production.ProductSubcategory SUB
 ON PRO.ProductSubcategoryID = SUB.ProductSubcategoryID
 INNER JOIN Production.ProductCategory CAT
 ON CAT.ProductCategoryID = SUB.ProductCategoryID
 ORDER BY PRO.ProductID ASC

 /* Consulta para extaer datos para la dimensión categoría*/
 SELECT 
 ProductCategoryID,Name
 FROM [AdventureWorks2019].[Production].[ProductCategory]
 ORDER BY ProductCategoryID ASC


 /* Consulta para extaer datos para el hecho ventas */
/* SELECT
 SDetail.SalesOrderDetailID,SOrder.CustomerID, SOrder.SalesPersonID, SDetail.ProductID, SOrder.TerritoryID, ST.BusinessEntityID,
 SDetail.LineTotal+SOrder.TaxAmt+SOrder.Freight as Total_venta
 FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] SOrder
 INNER JOIN Sales.SalesOrderDetail SDetail
 ON SOrder.SalesOrderID = SDetail.[SalesOrderID]
 INNER JOIN Sales.Store ST
 ON ST.SalesPersonID = SOrder.SalesPersonID*/


  /* Consulta para extaer datos para el hecho ventas */
 SELECT
 SOrder.SalesOrderID,SOrder.CustomerID, SOrder.SalesPersonID, SDetail.ProductID, SOrder.TerritoryID, CONVERT(DATE,SOrder.OrderDate) AS TimeID,ST.BusinessEntityID as StoreID,
SUM(SDetail.UnitPrice*SDetail.OrderQty*(1-SDetail.UnitPriceDiscount)) as Total_venta
 FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] SOrder
 INNER JOIN Sales.SalesOrderDetail SDetail
 ON SOrder.SalesOrderID = SDetail.[SalesOrderID]
 INNER JOIN Sales.Store ST
 ON ST.SalesPersonID = SOrder.SalesPersonID
 GROUP BY SOrder.SalesOrderID, SOrder.CustomerID, SOrder.SalesPersonID, SDetail.ProductID, SOrder.TerritoryID, ST.BusinessEntityID, SOrder.OrderDate

/*Consulta para extraer datos para dim_Empleado*/
SELECT Distinct
ssp.BusinessEntityID as EmployeeID,CONCAT(pp.FirstName,' ', pp.MiddleName, ' ', pp.LastName ) as FullName, Gender
FROM HumanResources.Employee he
INNER JOIN Person.Person pp
ON he.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Sales.SalesPerson ssp
ON he.BusinessEntityID = ssp.BusinessEntityID
INNER JOIN Sales.SalesTerritory Tr
ON ssp.TerritoryID = Tr.TerritoryID
GO

/*Consulta para extraer datos para Dim_Cliente*/
SELECT
SC.CustomerID, CONCAT(PER.FirstName,' ', PER.MiddleName, ' ', PER.LastName ) as FullName
FROM [AdventureWorks2019].[Sales].[Customer] SC
INNER JOIN [AdventureWorks2019].[Person].[Person] PER
ON PER.BusinessEntityID=SC.PersonID
ORDER BY SC.CustomerID ASC
GO

/*Consulta para extraer datos para Dim_Territorio*/
SELECT
Tr.TerritoryID, Tr.Name
FROM [AdventureWorks2019].[Sales].[SalesTerritory] Tr
ORDER BY TR.TerritoryID ASC
GO

/*Consulta para extraer datos para Dim_Tienda*/
SELECT DISTINCT 
st.[BusinessEntityID], st.[Name]
FROM [AdventureWorks2019].[Sales].[Store] st
ORDER BY st.[BusinessEntityID] ASC
GO

