--SELECT TOP 10 * FROM dbo.customer_reviews; 

-- Query to clean whitespace issues in ReviewText Coulmn

SELECT
	ReviewID,
	CustomerID,
	ProductID,
	ReviewDate,
	Rating,
	REPLACE(ReviewText, '  ', ' ') AS ReviewText
FROM
	dbo.customer_reviews;