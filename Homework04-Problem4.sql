-- Problem 4: List all products with their subcategories and categories.
-- Partial results
-- ProductID    ProductName    SubcategoryName    CategoryName
-- 680    HL Road Frame - Black, 58    Road Frames    Components
-- 706    HL Road Frame - Red, 58    Road Frames    Components
-- 707    Sport-100 Helmet, Red    Helmets    Accessories
-- 708    Sport-100 Helmet, Black    Helmets    Accessories
-- 709    Mountain Bike Socks, M    Socks    Clothing

--select top 3 * from Production.Product
--select top 3 * from Production.ProductCategory
--select top 3 * from Production.ProductSubcategory

--Afisaza toate produsele, indiferent daca au sau nu completate categoria si/sau subcategoria
SELECT p.ProductID, p.Name AS "ProductName", ps.Name AS "SubcategoryName", pc.Name AS "CategoryName"
FROM Production.Product AS p
LEFT JOIN Production.ProductSubcategory AS ps
ON p.ProductSubcategoryID=ps.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS pc
ON pc.ProductCategoryID=ps.ProductCategoryID

--Afisaza numai produsele care au completate categoria sau subcategoria
SELECT p.ProductID, p.Name AS "ProductName", ps.Name AS "SubcategoryName", pc.Name AS "CategoryName"
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps
ON p.ProductSubcategoryID=ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc
ON pc.ProductCategoryID=ps.ProductCategoryID