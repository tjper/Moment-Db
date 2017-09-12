;WITH 
Users_cte AS(SELECT 'user_' + CONVERT(NVARCHAR(64), n) AS UserID, 'email_'+ CONVERT(NVARCHAR(128), n) + '@email.com' AS Email, 'FirstName_'+ CONVERT(NVARCHAR(64), n) AS FirstName, 'LastName_'+ CONVERT(NVARCHAR(64), n) AS LastName, 'password_' + CONVERT(NVARCHAR(128), n) AS [Password]
			 FROM [util].Num)

INSERT INTO [user].[Users] (UserID, Email, FirstName, LastName, [Password])
SELECT cte.UserID, cte.Email, FirstName, LastName, cte.[Password]
FROM Users_cte cte

