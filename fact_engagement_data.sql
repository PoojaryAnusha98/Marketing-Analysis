--SELECT TOP 10 * FROM dbo.engagement_data;


SELECT
	EngagementID,
	ContentID,
	CampaignID,
	ProductID,
	UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) AS ContentType,
	Likes,
	LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
	RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,
	FORMAT(CONVERT(date,EngagementDate), 'MM.dd.yyyy') AS EngagementDate
FROM
	dbo.engagement_data
WHERE
	ContentType != 'newsletter';