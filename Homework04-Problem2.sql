-- Problem 2: List all orders placed by a specific customer (e.g., CustomerID = 29825) along with the order details.
-- Partial result
--SalesOrderID    OrderDate    ProductID    ProductName    OrderQty    UnitPrice    LineTotal
--43659    2011-05-31 00:00:00.000    776    Mountain-100 Black, 42    1    2024.994    2024.994000
--43659    2011-05-31 00:00:00.000    777    Mountain-100 Black, 44    3    2024.994    6074.982000
--43659    2011-05-31 00:00:00.000    778    Mountain-100 Black, 48    1    2024.994    2024.994000
--43659    2011-05-31 00:00:00.000    771    Mountain-100 Silver, 38    1    2039.994    2039.994000
--43659    2011-05-31 00:00:00.000    772    Mountain-100 Silver, 42    1    2039.994    2039.994000



--Rezolvat cu valorile pentru [LineTotal] aduse din [Sales.SalesOrderDetail],
--ceea ce nu intotdeauna reflecta realitatea deoarece unele produse au un discount
--la vanzare. [Sales.SalesOrderDetail].[UnitPriceDiscount] nu este peste tot 0.
SELECT
	soh.SalesOrderID,
	soh.OrderDate,
	sod.ProductID,
	p.Name AS "ProductName",
	sod.OrderQty,
	sod.UnitPrice,
	sod.LineTotal
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod
ON soh.SalesOrderID=sod.SalesOrderID
JOIN Production.Product AS p
ON p.ProductID=sod.ProductID
--WHERE soh.SalesOrderID = 43659
--Am sesizat greseala, filtrarea trebuia facuta dupa CustomerID / Sales.SalesOrderHeader AS soh
WHERE soh.CustomerID = 29825



/*
--Rezolvat cu valorile pentru [LineTotal] calculate pe baza produsului
--dintre [Sales.SalesOrderDetail].[OrderQty] si [Sales.SalesOrderDetail].[UnitPrice]
--fara a tine cont de discount, care daca este diferit de nu reflecta realitatea.
--SELECT
--	soh.SalesOrderID,
--	soh.OrderDate,
--	sod.ProductID,
--	p.Name AS "ProductName",
--	sod.OrderQty,
--	sod.UnitPrice,
--	LineTotal = sod.OrderQty * sod.UnitPrice
--FROM Sales.SalesOrderHeader AS soh
--JOIN Sales.SalesOrderDetail AS sod
--ON soh.SalesOrderID=sod.SalesOrderID
--JOIN Production.Product AS p
--ON p.ProductID=sod.ProductID
--WHERE soh.SalesOrderID = 43659



--Testare comenzi care au cel putin un produs cu discount
--Rezultat - 916 comenzi din 31.465, au cel putin un produs cu discount
--SELECT
--	soh.SalesOrderID,
--	sum(sod.UnitPriceDiscount) AS TestDiscount
--FROM Sales.SalesOrderHeader AS soh
--JOIN Sales.SalesOrderDetail AS sod
--ON soh.SalesOrderID=sod.SalesOrderID
--GROUP BY soh.SalesOrderID
--ORDER BY TestDiscount DESC



--Am incercat sa rezolv tinand cont si de discount la pretul unitar dar nici aceasta rezolvare
--nu reflecta realitatea
--SELECT
--	soh.SalesOrderID,
--	soh.OrderDate,
--	sod.ProductID,
--	p.Name AS "ProductName",
--	sod.OrderQty,
--	sod.UnitPrice,
--	sod.UnitPriceDiscount,
--	sod.LineTotal,
--	LineTotalCalc = sod.OrderQty * ( sod.UnitPrice - sod.UnitPrice*sod.UnitPriceDiscount ),
--	VerifyLineTotal = sod.LineTotal - sod.OrderQty * ( sod.UnitPrice - sod.UnitPrice*sod.UnitPriceDiscount )
--FROM Sales.SalesOrderHeader AS soh
--JOIN Sales.SalesOrderDetail AS sod
--ON soh.SalesOrderID=sod.SalesOrderID
--JOIN Production.Product AS p
--ON p.ProductID=sod.ProductID
--WHERE soh.SalesOrderID = 51131
*/
