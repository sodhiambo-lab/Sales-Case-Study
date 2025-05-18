use [ASSIGNMENT]
go

select * from [Sales Case Study]

SELECT
    FORMAT([Date], 'yyyy-MM-dd') AS formatted_date,
    Sales,
    Cost_Of_Sales,
    Quantity_Sold,
    ROUND(CAST(Sales AS FLOAT) / NULLIF(Quantity_Sold, 0), 2) AS unit_price,
    (SELECT ROUND(AVG(Sales), 2) FROM [Sales Case Study]) AS average_sales,
    ROUND(
        (Sales - Cost_Of_Sales) * 100.0 / NULLIF(Sales, 0),
        2
    ) AS gross_profit_percent,
	ROUND(
        ((SUM(Sales) - SUM(Cost_Of_Sales)) * 100.0) / NULLIF(SUM(Sales), 0),
        2
    ) AS gross_profit_percent_per_unit
FROM 
    [Sales Case Study]
group by FORMAT([Date], 'yyyy-MM-dd') ,
    Sales,
    Cost_Of_Sales,
    Quantity_Sold
