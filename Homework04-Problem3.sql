-- Problem 3: List all customers and their respective sales territories.
-- Partial result
--CustomerID    FirstName    LastName    TerritoryName
--29485    Catherine    Abel    Southwest
--29486    Kim    Abercrombie    Central
--29487    Humberto    Acevedo    Northeast
--29484    Gustavo    Achong    Southeast
--29488    Pilar    Ackerman    Australia

--Orientare prin tabele
--select * from Person.Person --Person.Person 19.972 inregistrari
--select * from Sales.Customer --Sales.Customer 19.820 inregistrari
--select * from Sales.SalesTerritory --Sales.SalesTerritory 10 inregistrari

--Aplicare "reverse engineering", ceea ce nu e chiar fair play, in viata reala nu primin Partial result.
--Asa mi-am dat seama ca [Person.Person].[BusinessEntityID]<>[Sales.Customer].[PersonID]
--select * from Person.Person where FirstName = 'Catherine'
--select * from Sales.Customer where PersonID = 293
--select * from Sales.SalesTerritory

--Verificare
--select * from Person.Person where BusinessEntityID = 293
--select * from Sales.Customer where CustomerID = 29485
--select * from Sales.SalesTerritory where TerritoryID = 4


SELECT c.CustomerID, p.FirstName, p.LastName, st.Name AS "TerritoryName"
FROM Sales.Customer AS c
JOIN Person.Person AS p
ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesTerritory AS st
ON c.TerritoryID=st.TerritoryID