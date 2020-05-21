-- What are the sales, product costs, profit, number of orders & quantity ordered for internet sales by product
-- category and ranked by sales?


SELECT 	prodcat.EnglishProductCategoryName,
		SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
		SUM(fis.ProductStandardCost) ProductCosts,
		(SUM(fis.UnitPrice*fis.OrderQuantity)-SUM(fis.ProductStandardCost))  AS 'Profit',
		COUNT(fis.SalesOrderNumber) AS 'Number of Orders',
		SUM(fis.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
from FactInternetSales fis 
INNER JOIN DimProduct dp ON dp.ProductKey=fis.ProductKey
INNER JOIN DimProductSubcategory subcat ON subcat.ProductSubcategoryKey = dp.ProductSubcategoryKey
INNER JOIN DimProductCategory prodcat ON prodcat.ProductCategoryKey = subcat.ProductCategoryKey
GROUP BY prodcat.EnglishProductCategoryName;



-- 2. What are the sales, product costs, profit, number of orders & quantity ordered for reseller sales by product
-- category and ranked by sales?

SELECT 	prodcat.EnglishProductCategoryName,
		SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
		SUM(fis.ProductStandardCost) ProductCosts,
		(SUM(fis.UnitPrice*fis.OrderQuantity)-SUM(fis.ProductStandardCost))  AS 'Profit',
		COUNT(fis.SalesOrderNumber) AS 'Number of Orders',
		SUM(fis.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
from FactResellerSales fis 
INNER JOIN DimProduct dp ON dp.ProductKey=fis.ProductKey
INNER JOIN DimProductSubcategory subcat ON subcat.ProductSubcategoryKey = dp.ProductSubcategoryKey
INNER JOIN DimProductCategory prodcat ON prodcat.ProductCategoryKey = subcat.ProductCategoryKey
GROUP BY prodcat.EnglishProductCategoryName;




-- 3. What are the sales, product costs, profit, number of orders & quantity ordered for both internet & reseller sales
-- by product category and ranked by sales?


with cte as (
	select ProductKey,UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, DiscountAmount from FactInternetSales
	union 
	select ProductKey, UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, DiscountAmount from FactResellerSales
	)

SELECT 	prodcat.EnglishProductCategoryName,
		SUM(cte.UnitPrice*cte.OrderQuantity) Sales,
		SUM(cte.ProductStandardCost) ProductCosts,
		(SUM(cte.UnitPrice*cte.OrderQuantity)-SUM(cte.ProductStandardCost))  AS 'Profit',
		COUNT(cte.SalesOrderNumber) AS 'Number of Orders',
		SUM(cte.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(cte.UnitPrice*cte.OrderQuantity) DESC) AS 'Rank'
from cte
INNER JOIN DimProduct dp ON dp.ProductKey=cte.ProductKey
INNER JOIN DimProductSubcategory subcat ON subcat.ProductSubcategoryKey = dp.ProductSubcategoryKey
INNER JOIN DimProductCategory prodcat ON prodcat.ProductCategoryKey = subcat.ProductCategoryKey
GROUP BY prodcat.EnglishProductCategoryName;



-- 4. What are the sales, product costs, profit, number of orders & quantity ordered for product category Accessories
-- broken-down by Product Hierarchy (Category, Subcategory, Model & Product) for both internet & reseller sales?

with cte as (
	select ProductKey,UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, DiscountAmount from FactInternetSales
	union 
	select ProductKey, UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, DiscountAmount from FactResellerSales
)

SELECT 	prodcat.EnglishProductCategoryName, subcat.EnglishProductSubcategoryName, dp.ModelName,dp.EnglishProductName,
		SUM(cte.UnitPrice*cte.OrderQuantity) Sales,
		SUM(cte.ProductStandardCost) ProductCosts,
		(SUM(cte.UnitPrice*cte.OrderQuantity)-SUM(cte.ProductStandardCost))  AS 'Profit',
		COUNT(cte.SalesOrderNumber) AS 'Number of Orders',
		SUM(cte.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(cte.UnitPrice*cte.OrderQuantity) DESC) AS 'Rank'
from cte
INNER JOIN DimProduct dp ON dp.ProductKey=cte.ProductKey
INNER JOIN DimProductSubcategory subcat ON subcat.ProductSubcategoryKey = dp.ProductSubcategoryKey
INNER JOIN DimProductCategory prodcat ON prodcat.ProductCategoryKey = subcat.ProductCategoryKey
WHERE prodcat.EnglishProductCategoryName='Accessories'
GROUP BY prodcat.EnglishProductCategoryName, subcat.EnglishProductSubcategoryName, dp.ModelName,dp.EnglishProductName;



-- 5. What are the sales, product costs, profit, number of orders & quantity ordered for both internet & reseller sales
-- by country and ranked by sales?

with cte as (
	select ProductKey,UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, SalesTerritoryKey from FactInternetSales
	union 
	select ProductKey, UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, SalesTerritoryKey from FactResellerSales
	)

SELECT 	st.SalesTerritoryCountry,
		SUM(cte.UnitPrice*cte.OrderQuantity) Sales,
		SUM(cte.ProductStandardCost) ProductCosts,
		(SUM(cte.UnitPrice*cte.OrderQuantity)-SUM(cte.ProductStandardCost))  AS 'Profit',
		COUNT(cte.SalesOrderNumber) AS 'Number of Orders',
		SUM(cte.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(cte.UnitPrice*cte.OrderQuantity) DESC) AS 'Rank'
from cte
INNER JOIN DimProduct dp ON dp.ProductKey=cte.ProductKey
INNER JOIN DimSalesTerritory st ON st.SalesTerritoryKey=cte.SalesTerritoryKey
GROUP BY st.SalesTerritoryCountry;



-- 6. What are the sales, product costs, profit, number of orders & quantity ordered for France by city and ranked by
-- sales for both internet & reseller sales?


with cte as (
	select ProductKey,UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, SalesTerritoryKey from FactInternetSales
	union 
	select ProductKey, UnitPrice, ProductStandardCost, SalesOrderNumber, OrderQuantity, SalesTerritoryKey from FactResellerSales
	)

SELECT 	dg.City,
		SUM(cte.UnitPrice*cte.OrderQuantity) Sales,
		SUM(cte.ProductStandardCost) ProductCosts,
		(SUM(cte.UnitPrice*cte.OrderQuantity)-SUM(cte.ProductStandardCost))  AS 'Profit',
		COUNT(cte.SalesOrderNumber) AS 'Number of Orders',
		SUM(cte.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(cte.UnitPrice*cte.OrderQuantity) DESC) AS 'Rank'
from cte
INNER JOIN DimProduct dp ON dp.ProductKey=cte.ProductKey
INNER JOIN DimSalesTerritory st ON st.SalesTerritoryKey=cte.SalesTerritoryKey
INNER JOIN DimGeography dg ON dg.SalesTerritoryKey=st.SalesTerritoryKey 
WHERE st.SalesTerritoryCountry='France'
GROUP BY dg.City;



-- 7. What are the top ten resellers by reseller hierarchy (business type, reseller name) ranked by sales?

SELECT top 10 dimre.BusinessType,
           dimre.ResellerName,
           SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
           RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
FROM FactResellerSales fis
INNER JOIN DimReseller dimre ON dimre.ResellerKey=fis.ResellerKey
GROUP BY dimre.BusinessType,
         dimre.ResellerName;



-- 8. What are the top ten (internet) customers ranked by sales?


SELECT TOP 10 c.LastName,
           c.FirstName,
           SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
           RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
FROM FactInternetSales fis
INNER JOIN DimCustomer c ON c.CustomerKey=fis.CustomerKey
GROUP BY c.LastName,
         c.FirstName;


-- 9. What are the sales, product costs, profit, number of orders & quantity ordered by Customer Occupation?
-- InternetSales Assumed

SELECT 	c.EnglishOccupation,
		SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
		SUM(fis.ProductStandardCost) ProductCosts,
		(SUM(fis.UnitPrice*fis.OrderQuantity)-SUM(fis.ProductStandardCost))  AS 'Profit',
		COUNT(fis.SalesOrderNumber) AS 'Number of Orders',
		SUM(fis.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
from FactInternetSales fis 
INNER JOIN DimProduct dp ON dp.ProductKey=fis.ProductKey
INNER JOIN DimCustomer c ON c.CustomerKey=fis.CustomerKey
GROUP BY c.EnglishOccupation;



-- 10. What are the ranked sales of the sales people (employees)?
-- ResellerSales Assumed

SELECT fis.EmployeeKey,
       e.LastName,
       e.FirstName,
       SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
       RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
FROM FactResellerSales fis
INNER JOIN DimEmployee e ON e.EmployeeKey=fis.EmployeeKey
GROUP BY e.LastName,
         e.FirstName,
         fis.EmployeeKey;




-- 11. What are the sales, discount amounts (promotion discounts), profit and promotion % of sales for Reseller Sales
-- by Promotion Hierarchy (Category, Type & Name) – sorted descending by sales.?


SELECT 	dimprom.EnglishPromotionCategory, dimprom.EnglishPromotionType, dimprom.EnglishPromotionName,
		SUM(fis.UnitPrice*fis.OrderQuantity) Sales,
		SUM(DiscountPct * fis.UnitPrice*fis.OrderQuantity) AS Discount,
		(SUM(fis.UnitPrice*fis.OrderQuantity)-SUM(fis.ProductStandardCost))  AS 'Profit',
		SUM((fis.UnitPrice*fis.OrderQuantity)/100) AS 'Promotion %',
		RANK() OVER(ORDER BY SUM(fis.UnitPrice*fis.OrderQuantity) DESC) AS 'Rank'
from FactResellerSales fis 
INNER JOIN DimProduct dp ON dp.ProductKey=fis.ProductKey
INNER JOIN DimPromotion dimprom ON dimprom.PromotionKey = fis.PromotionKey
GROUP BY dimprom.EnglishPromotionCategory, dimprom.EnglishPromotionType, dimprom.EnglishPromotionName;




-- 12. What are the sales, product costs, profit, number of orders & quantity ordered by Sales Territory Hierarchy
-- (Group, Country, region) and ranked by sales for both internet & reseller sales?


with cte as (
	select ProductKey, UnitPrice, TotalProductCost, SalesOrderNumber, OrderQuantity, ProductStandardCost, SalesTerritoryKey from FactInternetSales
	union 
	select ProductKey, UnitPrice, TotalProductCost, SalesOrderNumber, OrderQuantity, ProductStandardCost, SalesTerritoryKey from FactResellerSales
	)
SELECT 	st.SalesTerritoryGroup, st.SalesTerritoryCountry, st.SalesTerritoryRegion,
		SUM(cte.UnitPrice*cte.OrderQuantity) Sales,
		SUM(cte.ProductStandardCost) ProductCosts,
		(SUM(cte.UnitPrice*cte.OrderQuantity)-SUM(cte.ProductStandardCost))  AS 'Profit',
		COUNT(cte.SalesOrderNumber) AS 'Number of Orders',
		SUM(cte.OrderQuantity) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(cte.UnitPrice*cte.OrderQuantity) DESC) AS 'Rank'
from cte
INNER JOIN DimProduct dp ON dp.ProductKey=cte.ProductKey
INNER JOIN DimSalesTerritory st on cte.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY st.SalesTerritoryGroup, st.SalesTerritoryCountry, st.SalesTerritoryRegion;



-- 13. What are the sales by year by sales channels (internet, reseller & total)?

SELECT YEAR(fis.OrderDate) AS Years,
       SUM(fis.UnitPrice*fis.OrderQuantity) AS SalesInternet,
       SUM(frs.UnitPrice*frs.OrderQuantity) AS SalesReseller,
       sum(fis.UnitPrice*fis.OrderQuantity+frs.UnitPrice*frs.OrderQuantity) AS Total
FROM dbo.FactInternetSales fis
INNER JOIN dbo.FactResellerSales frs ON frs.ProductKey=fis.ProductKey
INNER JOIN DimProduct dp ON dp.ProductKey=fis.ProductKey
WHERE YEAR(fis.OrderDate)=YEAR(frs.OrderDate)
GROUP BY YEAR(fis.OrderDate);




-- 14. What are the total sales by month (& year)?


with cte as (
	select ProductKey, UnitPrice, OrderQuantity, OrderDate from FactInternetSales
	union
	select ProductKey, UnitPrice, OrderQuantity, OrderDate from FactResellerSales
	)
SELECT 	DATENAME(MONTH, cte.OrderDate) AS 'Month',
		YEAR(cte.OrderDate) AS 'Year',
		SUM(cte.UnitPrice*cte.OrderQuantity) AS 'Sales'
FROM cte
GROUP BY YEAR(cte.OrderDate), DATENAME(MONTH, cte.OrderDate)
order by YEAR(cte.OrderDate) desc;






