;WITH 
L1 AS(SELECT 1 AS N FROM [util].[Num]),
L2 AS(SELECT 1 AS N FROM [L1] AS B CROSS JOIN [L1] AS A),
Nums_cte AS(SELECT TOP 150000 ROW_NUMBER() OVER(PARTITION BY N ORDER BY (SELECT NULL)) AS N FROM L2),
seed_cte AS(SELECT N, HASHBYTES('SHA1', CONVERT(NVARCHAR, N)) AS randomizer FROM Nums_cte),

Logins_cte AS(SELECT 'user_' + CONVERT(NVARCHAR(64), CEILING(RAND(cte.N) * 10000 /*# of UserID(s)*/)) AS UserUserID,
					 CASE WHEN (RAND(cte.randomizer) < .2) THEN 0 ELSE 1 END AS Success,
					 DATEADD(SECOND, DATEDIFF(SECOND, '2017-01-01', GETUTCDATE()) * RAND(cte.N), '2017-01-01') AS [CreateDate]
			  FROM seed_cte cte)

INSERT INTO [user].[Logins] (UserUserID, Success, [CreateDate])
SELECT cte.UserUserID,
	   cte.Success,
	   cte.CreateDate
FROM Logins_cte cte







