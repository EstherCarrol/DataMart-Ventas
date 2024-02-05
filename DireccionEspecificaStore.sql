/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) PA.[AddressID]
      ,PA.[AddressLine1]
      ,PA.[AddressLine2]
      ,PA.[City]
      ,PA.[StateProvinceID]
      ,PA.[PostalCode]
      ,PA.[SpatialLocation]
      ,PA.[rowguid]
      ,PA.[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Address] PA
  INNER JOIN AdventureWorks2019.Person.BusinessEntityAddress BA
  on BA.AddressID = PA.AddressID
  INNER JOIN AdventureWorks2019.[Person].[Person] PER
  on PER.BusinessEntityID = BA.BusinessEntityID
  WHERE PER.PersonType ='SC'