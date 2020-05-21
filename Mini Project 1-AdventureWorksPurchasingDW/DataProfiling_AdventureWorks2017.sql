-- What are the sales, product costs, profit, number of orders & quantity ordered for internet sales by product
-- category and ranked by sales?


SELECT pc.Name,
       SUM(sod.OrderQty*sod.UnitPrice) Sales,
       SUM(p.StandardCost) ProductCosts,
       (SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost)) AS 'Profit',
       COUNT(sod.SalesOrderID) AS 'Number of Orders',
       SUM(sod.OrderQty) AS 'Quantity ordered',
       RANK() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID
AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID = ps.ProductCategoryID
WHERE sh.OnlineOrderFlag=1
GROUP BY pc.Name;




-- 2. What are the sales, product costs, profit, number of orders & quantity ordered for reseller sales by product
-- category and ranked by sales?


SELECT  pc.Name,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sod.SalesOrderID) AS 'Number of Orders',
		SUM(sod.OrderQty) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
from Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID = ps.ProductCategoryID
WHERE sh.OnlineOrderFlag='0'
GROUP BY pc.Name;

-- 3. What are the sales, product costs, profit, number of orders & quantity ordered for both internet & reseller sales
-- by product category and ranked by sales?

SELECT  pc.Name,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sod.SalesOrderID) AS 'Number of Orders',
		SUM(sod.OrderQty) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
from Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID = ps.ProductCategoryID
WHERE sh.OnlineOrderFlag IN (0,1)
GROUP BY pc.Name;


-- 4. What are the sales, product costs, profit, number of orders & quantity ordered for product category Accessories
-- broken-down by Product Hierarchy (Category, Subcategory, Model & Product) for both internet & reseller sales?


SELECT  pc.Name, ps.Name,pm.Name, p.Name,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sod.SalesOrderID) AS 'Number of Orders',
		SUM(sod.OrderQty) AS 'Quantity ordered',
		ROW_NUMBER() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
from Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID = ps.ProductCategoryID
INNER JOIN Production.ProductModel pm ON pm.ProductModelId = p.ProductModelId
WHERE sh.OnlineOrderFlag IN (0,1) AND pc.Name='Accessories'
GROUP BY pc.Name, ps.Name,pm.Name, p.Name;

-- 5. What are the sales, product costs, profit, number of orders & quantity ordered for both internet & reseller sales
-- by country and ranked by sales?


SELECT  cr.Name,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sod.SalesOrderID) AS 'Number of Orders',
		SUM(sod.OrderQty) AS 'Quantity ordered',
		RANK() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
from Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID = ps.ProductCategoryID
INNER JOIN Sales.SalesTerritory t ON t.TerritoryID=sh.TerritoryID
INNER JOIN Person.CountryRegion cr ON t.CountryRegionCode=cr.CountryRegionCode
WHERE sh.OnlineOrderFlag IN (0,1)
GROUP BY  cr.Name;


-- 6. What are the sales, product costs, profit, number of orders & quantity ordered for France by city and ranked by
-- sales for both internet & reseller sales?

SELECT  a.City,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sod.SalesOrderID) AS 'Number of Orders',
		SUM(sod.OrderQty) AS 'Quantity ordered',
		ROW_NUMBER() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
from Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Sales.SalesTerritory t ON t.TerritoryID=sh.TerritoryID
INNER JOIN Person.CountryRegion cr ON t.CountryRegionCode=cr.CountryRegionCode
INNER JOIN Person.StateProvince state ON state.CountryRegionCode=cr.CountryRegionCode
INNER JOIN Person.Address a ON a.StateProvinceID= state.StateProvinceID
WHERE sh.OnlineOrderFlag IN (0,1) AND cr.Name='France'
GROUP BY  a.City;


-- 7. What are the top ten resellers by reseller hierarchy (business type, reseller name) ranked by sales?

SELECT top 10 vdemo.BusinessType,
           vdemo.Name,
           SUM(sod.UnitPrice*sod.OrderQty) AS 'Sales',
           ROW_NUMBER() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader soh ON soh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.Customer c ON c.CustomerId=soh.CustomerId
INNER JOIN Sales.Store s ON s.BusinessEntityID=c.StoreID
INNER JOIN Sales.vStoreWithDemographics vdemo ON vdemo.BusinessEntityID=s.BusinessEntityID
WHERE soh.OnlineOrderFlag=0
  AND vdemo.Name=s.Name
GROUP BY vdemo.BusinessType,
         vdemo.Name;



-- 8. What are the top ten (internet) customers ranked by sales?


SELECT top 10 vdemo.LastName,
           vdemo.FirstName,
           SUM(sod.UnitPrice*sod.OrderQty) AS 'Sales',
           ROW_NUMBER() OVER(ORDER BY SUM(sod.OrderQty*sod.UnitPrice) DESC) AS 'Rank'
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader soh ON soh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.Customer c ON c.CustomerId=soh.CustomerId
INNER JOIN Sales.vIndividualCustomer vdemo ON vdemo.BusinessEntityID=c.CustomerId
WHERE soh.OnlineOrderFlag=1
GROUP BY vdemo.FirstName,
         vdemo.LastName;


-- 9. What are the sales, product costs, profit, number of orders & quantity ordered by Customer Occupation?


SELECT  vdemo.Occupation,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sod.SalesOrderID) AS 'Number of Orders',
		SUM(sod.OrderQty) AS 'Quantity ordered'
from Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader soh ON soh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON pp.ProductID = sp.ProductID
INNER JOIN Production.Product p ON p.ProductID = sod.ProductID
INNER JOIN Sales.Customer c ON c.CustomerId=soh.CustomerId
INNER JOIN Sales.SalesPerson s ON s.TerritoryID=soh.TerritoryID
INNER JOIN Person.Person per ON per.BusinessEntityID=c.PersonID
INNER JOIN Sales.vPersonDemographics vdemo ON vdemo.BusinessEntityID=per.BusinessEntityID
WHERE vdemo.Occupation IS NOT NULL
GROUP BY vdemo.Occupation;



-- 10. What are the ranked sales of the sales people (employees)?


SELECT vdemo.FirstName AS FirstName,
       vdemo.LastName AS LastName,
       sum(sp.SalesYTD) AS TotalSales,
       ROW_NUMBER() OVER (ORDER BY sum(sp.SalesYTD) DESC) AS Rank_by_Sales
FROM Sales.SalesPerson sp
INNER JOIN sales.vSalesPerson vdemo ON vdemo.BusinessEntityID=sp.BusinessEntityID
GROUP BY vdemo.FirstName,
         vdemo.LastName;




-- 11. What are the sales, discount amounts (promotion discounts), profit and promotion % of sales for Reseller Sales
-- by Promotion Hierarchy (Category, Type & Name) – sorted descending by sales.?


SELECT 	prodcat.ProductCategoryID as Category,
		prodcat.Name as ProductCategoryName,
		sum(sod.OrderQty*sod.UnitPrice)as Sales,
		(sum(sod.OrderQty*sod.UnitPrice)-SUM(prod.StandardCost)) as Profit,
		sum(specialop.DiscountPct*100) as DiscountAmount,
		sum(specialop.DiscountPct%((sod.OrderQty*sod.UnitPrice))) as promotionPercentSales,
		ROW_NUMBER() OVER(ORDER BY (sum(sod.OrderQty*sod.UnitPrice)) DESC) as RankBySales
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID=soh.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sop ON sop.ProductID=sod.ProductID AND sop.ProductID=sod.ProductID
INNER JOIN Sales.SpecialOffer specialop ON specialop.SpecialOfferID=sop.SpecialOfferID 
INNER JOIN Production.ProductProductPhoto as ppp ON ppp.ProductID=sop.ProductID
INNER JOIN Production.Product as prod ON prod.ProductID = sop.ProductID
INNER JOIN Production.ProductSubcategory AS prodsub ON prodsub.ProductSubcategoryID=prod.ProductSubcategoryID
INNER JOIN Production.ProductCategory as prodcat ON prodcat.ProductCategoryID=prodsub.ProductCategoryID
WHERE soh.OnlineOrderFlag='0'
GROUP BY prodcat.Name,prodcat.ProductCategoryID;


-- 12. What are the sales, product costs, profit, number of orders & quantity ordered by Sales Territory Hierarchy
-- (Group, Country, region) and ranked by sales for both internet & reseller sales?


SELECT  t.[Group],cr.Name, cr.CountryRegionCode,
		SUM(sod.OrderQty*sod.UnitPrice) Sales,
		SUM(p.StandardCost) ProductCosts,
		(SUM(sod.OrderQty*sod.UnitPrice)-SUM(p.StandardCost))  AS 'Profit',
		COUNT(sh.SalesOrderID) AS 'Number of Orders',
		COUNT(sod.OrderQty) AS 'Quantity ordered'
from Sales.SalesOrderDetail sod 
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON PP.ProductID = sod.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.WorkOrder wo ON wo.ProductID = p.ProductID
INNER JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SalesTerritory t ON t.TerritoryID=sh.TerritoryID
INNER JOIN Person.CountryRegion cr ON t.CountryRegionCode=cr.CountryRegionCode
WHERE sh.OnlineOrderFlag IN (0,1)
GROUP BY t.[Group],cr.Name, cr.CountryRegionCode;


-- 13. What are the sales by year by sales channels (internet, reseller & total)?

SELECT SUM(sod.OrderQty*sod.UnitPrice) Sales,
       YEAR(soh.OrderDate) AS 'Year',
       CASE
           WHEN soh.OnlineOrderFlag=0 THEN 'Reseller Sales'
           ELSE 'Internet Sales'
       END AS 'Channel'
FROM sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID=sod.SalesOrderID
INNER JOIN Sales.SpecialOfferProduct sp ON sp.SpecialOfferID = sod.SpecialOfferID AND sp.ProductID=sod.ProductID
INNER JOIN Production.ProductProductPhoto pp ON PP.ProductID = sod.ProductID
INNER JOIN Production.Product p ON p.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID=ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID=ps.ProductCategoryID
GROUP BY YEAR(soh.OrderDate), soh.OnlineOrderFlag
ORDER BY YEAR(soh.OrderDate), soh.OnlineOrderFlag;



-- 14. What are the total sales by month (& year)?

SELECT DATENAME(MONTH, sh.OrderDate) AS SalesMonth,
       YEAR(sh.OrderDate) AS SalesYear,
       sum(so.OrderQty*so.UnitPrice) AS TotalSales
FROM Sales.SalesOrderDetail so
INNER JOIN Sales.SalesOrderHeader sh ON so.SalesOrderID = sh.SalesOrderID
where sh.OnlineOrderFlag IN (0,1)
GROUP BY YEAR(sh.OrderDate), DATENAME(MONTH, sh.OrderDate)
order by YEAR(sh.OrderDate) desc;