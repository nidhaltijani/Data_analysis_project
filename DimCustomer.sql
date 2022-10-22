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