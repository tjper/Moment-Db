CREATE TABLE [moment].[Moments] (
	[ID] BIGINT NOT NULL IDENTITY(1,1),
	[SenderID] NVARCHAR(64) NOT NULL,
	[Location] GEOGRAPHY NOT NULL,
	[MediaID] BIGINT NOT NULL,
	[Public] BIT NOT NULL,
	[CreateDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE()	
);

ALTER TABLE [moment].[Moments] WITH NOCHECK
ADD CONSTRAINT PK_Moments_ID PRIMARY KEY CLUSTERED ([ID])
WITH (FILLFACTOR = 90);

ALTER TABLE [moment].[Moments] WITH CHECK CHECK CONSTRAINT ALL;
GO

----------------------------------------------------------------------------------------

CREATE TABLE [moment].[Media] (
	[ID] [uniqueidentifier] ROWGUIDCOL NOT NULL UNIQUE DEFAULT NEWSEQUENTIALID() ,
	[Type] BINARY(1) NOT NULL,
	[Media] VARBINARY(MAX) FILESTREAM NULL,
	[Message] NVARCHAR(256) NULL
);

ALTER TABLE [moment].[Media] WITH NOCHECK
ADD CONSTRAINT PK_Media_ID PRIMARY KEY CLUSTERED ([ID])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Media] WITH CHECK CHECK CONSTRAINT ALL;
GO

----------------------------------------------------------------------------------------

CREATE TABLE [moment].[Leaves] (
	[ID] BIGINT NOT NULL IDENTITY(1,1), 
	[RecipientID] NVARCHAR(64) NOT NULL,
	[MomentID] BIGINT NOT NULL,
	[Found] BIT NOT NULL,
	[FoundDate] DATETIME2 NULL
);

ALTER TABLE [moment].[Leaves] WITH NOCHECK
ADD CONSTRAINT PK_Leaves_ID PRIMARY KEY CLUSTERED (ID)
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Leaves] WITH CHECK CHECK CONSTRAINT ALL;
GO

----------------------------------------------------------------------------------------

CREATE TABLE [moment].[Shares] (
	[LeaveID] BIGINT NOT NULL,
	[RecipientID] NVARCHAR(64) NOT NULL
);

ALTER TABLE [moment].[Shares] WITH NOCHECK
ADD CONSTRAINT PK_Shares_LeaveID_RecipientID PRIMARY KEY CLUSTERED ([LeaveID], [RecipientID])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Shares] WITH CHECK CHECK CONSTRAINT ALL;
GO