CREATE TABLE [moment].[Base] (
	[ID] BIGINT NOT NULL IDENTITY(1,1),
	[SenderID] NVARCHAR(128) NOT NULL,
	[Location] GEOGRAPHY NOT NULL,
	[MediaID] BIGINT NOT NULL,
	[Public] BIT NOT NULL,
	[CreateDate] DATETIME2 NOT NULL DEFAULT GETUTCDATE()	
);

ALTER TABLE [moment].[Base] WITH NOCHECK
ADD CONSTRAINT PK_Base_ID PRIMARY KEY CLUSTERED ([ID])
WITH (FILLFACTOR = 90);

ALTER TABLE [moment].[Base] WITH CHECK CHECK CONSTRAINT ALL;
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

CREATE TABLE [moment].[Branch] (
	[RecipientID] NVARCHAR(128) NOT NULL,
	[NoteID] BIGINT NOT NULL,
	[Found] BIT NOT NULL,
	[FoundDate] DATETIME2 NULL,
	[Shared] BIT NOT NULL
);

ALTER TABLE [moment].[Branch] WITH NOCHECK
ADD CONSTRAINT PK_Branch_RecipientID_NoteID PRIMARY KEY CLUSTERED ([RecipientID], [NoteID])
WITH(FILLFACTOR = 90);

ALTER TABLE [moment].[Branch] WITH CHECK CHECK CONSTRAINT ALL;
GO