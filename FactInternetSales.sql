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