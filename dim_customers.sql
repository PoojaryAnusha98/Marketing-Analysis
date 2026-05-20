--select top 10 * from dbo.customers;

--select top 10 * from dbo.geography;

-- Combined Customers and Geography table to enrich Customers information as per Geographic information

SELECT
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	g.Country,
	g.City
FROM 
	dbo.customers c
LEFT JOIN 
	dbo.geography g
ON 
	c.GeographyID = g.GeographyID;