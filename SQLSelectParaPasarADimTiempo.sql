/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[TerritoryID]
      ,[BillToAddressID]
      ,[ShipToAddressID]
      ,[ShipMethodID]
      ,[CreditCardID]
      ,[CreditCardApprovalCode]
      ,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[Comment]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  SELECT COUNT(*)
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]


  SELECT Distinct([OrderDate]),
		YEAR(OrderDate) AS Anio,
		DATEPART(QUARTER,OrderDate) as Trimestre,
		DATEPART(MONTH,OrderDate) as Mes,
		DATEPART(WEEK,OrderDate) as Semana,
		DATEPART(DAYOFYEAR,OrderDate) as DiaDeAnio,
		DATEPART(DAY,OrderDate) as DiaDeMes,
		DATEPART(WEEKDAY,OrderDate-1) as DiaDeSemana
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
