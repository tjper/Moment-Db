CREATE TABLE [user].[Users] (
	UserID NVARCHAR(64) NOT NULL,
	Email NVARCHAR(128) NOT NULL,
	FirstName NVARCHAR(64) NOT NULL,
	LastName NVARCHAR(64) NOT NULL,
	[Password] NVARCHAR(128) NOT NULL
);
GO

ALTER TABLE [user].[Users] WITH NOCHECK
ADD CONSTRAINT PK_Users_UserID PRIMARY KEY CLUSTERED (UserID)
WITH (FILLFACTOR = 90)
GO

ALTER TABLE [user].[Users] WITH CHECK CHECK CONSTRAINT ALL
GO

---------------------------------------------------------------------------------------------

CREATE TABLE [user].[Logins] (
	UserUserID NVARCHAR(64) NOT NULL,
	Success BIT NOT NULL,
	CreateDate DATETIME2 NOT NULL DEFAULT GETUTCDATE()
);
GO

ALTER TABLE [user].[Logins] WITH NOCHECK
ADD CONSTRAINT PK_Logins_UserUserID_CreateDate PRIMARY KEY CLUSTERED (UserUserID, CreateDate)
WITH(FILLFACTOR = 90);
GO



ALTER TABLE [user].[Logins] WITH CHECK CHECK CONSTRAINT ALL
GO