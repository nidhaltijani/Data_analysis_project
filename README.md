# Data_analysis_project  

## Business request and user stories :  
The business request scenario for this project was an executive sales report for sales manager. we defined the user stories above to ensure the acceptance criteria of our project   
### User stories :  
As a sales manager I want to get a dashboard overview the internet sales so that I can follow better which customers are buying more and which Products sells the best  
As a sales representative I want an overview of the sales per customer so that I can follow the customers who buy more and to whom we can sell more  
As a sales representative I want an overview of the sales per product so that I can follow the products that are performing well  
As a sales manager I want an overview of the sales over time so that I can spot trends and seasonality    
## Data cleaning and transformation :  
To create our data model  we extracted the following tables that are related to our business request from the ***AdventureWorks DW***  
Below are the SQL codes used to clean and transform the data  
### DimDate:      
```   
SELECT 
    DateKey,
    FullDateAlternateKey AS Full_Date,
    EnglishDayNameOfWeek AS DayName,
    EnglishMonthName AS MonthName,
    LEFT(EnglishMonthName,3) AS MonthShort,--Useful for the graphs 
    MonthNumberOfYear AS MonthNumber,
    CalendarQuarter AS Quarter,
    CalendarYear AS Year
FROM DimDate
WHERE CalendarYear IN (2013,2014) -- analyzing only the data from 2013 and 2014
```     
### DimCustomer:   
```  
SELECT  [CustomerKey]
      ,[dc].[GeographyKey]
      ,[CustomerAlternateKey]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[FirstName]+ ' ' +[LastName] AS [FullNAME]
      ,[BirthDate]
      ,CASE upper([MaritalStatus])
        WHEN 'M' Then 'Married'
        WHEN 'S' Then 'Single'
        END AS [MaritalStatus]
      ,CASE upper([Gender])
        WHEN 'M' Then 'Male'
        WHEN 'F' then 'Female'
        END AS Gender
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation] AS Education
      ,[EnglishOccupation] AS Occupation
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
      ,[dg].[City] AS City
  FROM [dbo].[DimCustomer] AS dc
  left join DimGeography AS dg 
  on dc.GeographyKey=dg.GeographyKey
  ORDER BY CustomerKey ASC
```     
### DimProduct:    
```     
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
```        
### FactInternetSales:    
```  
SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      --,[CurrencyKey]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[UnitPriceDiscountPct]
      ,[DiscountAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [dbo].[FactInternetSales]
  WHERE LEFT (OrderDateKey, 4) IN (2013,2014) -- bringing only data of 2013 and 2014
```      
## Data model :   
After the cleaning process we exported the results into csv files and imported them to power BI to create the star schema data model below   

    


