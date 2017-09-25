CREATE TABLE [moment].[Moments] (
	[ID] BIGINT NOT NULL IDENTITY(1,1),
	[UserID] NVARCHAR(64) NOT NULL,
	[Latitude] NUMERIC(9,6) NOT NULL,
	[Longitude] NUMERIC(8,6) NOT NULL,
	[Public] BIT NOT NULL DEFAULT 1,
	[Hidden] BIT NOT NULL DEFAULT 0,
	[CreateDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE()	
);

ALTER TABLE [moment].[Moments] WITH NOCHECK
ADD CONSTRAINT PK_Moments_ID PRIMARY KEY CLUSTERED ([ID])
WITH (FILLFACTOR = 90);

ALTER TABLE [moment].[Moments] WITH CHECK CHECK CONSTRAINT ALL;
GO

----------------------------------------------------------------------------------------

CREATE TABLE [moment].[Media] (
	[MomentID] BIGINT NOT NULL,
	[Type] TINYINT NOT NULL,
	[MediaDir] NVARCHAR(256) NULL,
	[Message] NVARCHAR(256) NULL
);

ALTER TABLE [moment].[Media] WITH NOCHECK
ADD CONSTRAINT PK_Media_MomentID_Type PRIMARY KEY CLUSTERED ([MomentID], [Type])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Media] WITH CHECK CHECK CONSTRAINT ALL;
GO

----------------------------------------------------------------------------------------

CREATE TABLE [moment].[Finds] (
	[MomentID] BIGINT NOT NULL,
	[UserID] NVARCHAR(64) NOT NULL,
	[Found] BIT NOT NULL DEFAULT 0,
	[FindDate] DATETIME2 NULL
);

ALTER TABLE [moment].[Finds] WITH NOCHECK
ADD CONSTRAINT PK_Finds_MomentID_UserID PRIMARY KEY CLUSTERED ([MomentID], [UserID])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Finds] WITH CHECK CHECK CONSTRAINT ALL;
GO

----------------------------------------------------------------------------------------

CREATE TABLE [moment].[Shares] (
	[MomentID] BIGINT NOT NULL, 
	[UserID] NVARCHAR(64) NOT NULL,
	[All] BIT NOT NULL,
	[RecipientID] NVARCHAR(64) NULL
);

ALTER TABLE [moment].[Shares] WITH NOCHECK
ADD CONSTRAINT PK_Shares_MomentID_UserID PRIMARY KEY CLUSTERED ([MomentID], [UserID])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Shares] WITH CHECK CHECK CONSTRAINT ALL;
GO



