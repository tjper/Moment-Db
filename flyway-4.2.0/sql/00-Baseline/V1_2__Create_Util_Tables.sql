------------------------------------------------------------------------------------------
CREATE TABLE [util].[Teams] (
	[Name] NVARCHAR(32) NOT NULL,
	Region NVARCHAR(32) NOT NULL
);
GO

ALTER TABLE [util].[Teams] WITH NOCHECK
ADD CONSTRAINT PK_Teams_Name PRIMARY KEY CLUSTERED ([Name]);
GO

ALTER TABLE [util].[Teams] WITH CHECK CHECK CONSTRAINT ALL
GO

------------------------------------------------------------------------------------------

CREATE TABLE [util].[DimDate] (
	[LongDate] DATETIME2 NOT NULL
);
GO

ALTER TABLE [util].[DimDate] WITH NOCHECK
ADD CONSTRAINT PK_DimDate_LongDate PRIMARY KEY CLUSTERED ([LongDate])
WITH(FILLFACTOR = 90);
GO

ALTER TABLE [util].[DimDate] WITH CHECK CHECK CONSTRAINT ALL
GO