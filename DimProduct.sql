SELECT [ProductKey]
      ,[ProductAlternateKey]
      ,[dps].[ProductSubcategoryKey] AS ProductSubCategoryKey
      ,[dps].[EnglishProductSubcategoryName] AS ProductSubCategory
      ,[dpc].ProductCategoryKey AS ProductCategoryKey
      ,[dpc].[EnglishProductCategoryName] AS ProductCategory
      ,[EnglishProductName] AS Product
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[DaysToManufacture]
      ,[EnglishDescription] AS [Description]
      ,[StartDate]
      ,[EndDate]
      ,ISNULL([Status],'Outdated') AS [Status]
  FROM [dbo].[DimProduct] AS dp 
  left join [dbo].[DimProductSubcategory] AS dps
  on [dp].[ProductSubcategoryKey]=[dps].[ProductCategoryKey]
  left join [dbo].[DimProductCategory] AS dpc 
  on [dps].[ProductCategoryKey]=[dpc].[ProductCategoryKey]