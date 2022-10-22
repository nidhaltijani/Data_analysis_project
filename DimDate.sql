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