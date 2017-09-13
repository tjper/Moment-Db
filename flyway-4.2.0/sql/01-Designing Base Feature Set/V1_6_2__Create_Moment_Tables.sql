CREATE TABLE [moment].[Moments] (
	[ID] BIGINT NOT NULL IDENTITY(1,1),
	[SenderID] NVARCHAR(128) NOT NULL,
	[RecipientsID] BIGINT NOT NULL,
	[Location] GEOGRAPHY NOT NULL,
	[MediaID] BIGINT NOT NULL,
	[Public] BIT NOT NULL,
	[CreateDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
);

ALTER TABLE [moment].[Moments] WITH NOCHECK
ADD CONSTRAINT PK_Moments_CreateDate_ID PRIMARY KEY CLUSTERED ([CreateDate], [ID])
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

CREATE TABLE [moment].[Status] (
	[MomentID] BIGINT NOT NULL IDENTITY(1, 1),
	[RecipientID] NVARCHAR(128) NOT NULL,
	[Found] BIT NOT NULL,
	[FoundDate] DATETIME2 NULL,
	[Shared] BIT NOT NULL
);

ALTER TABLE [moment].[Status] WITH NOCHECK
ADD CONSTRAINT PK_Status_RecipientID_MomentID PRIMARY KEY CLUSTERED ([RecipientID], [MomentID])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Status] WITH CHECK CHECK CONSTRAINT ALL;
GO