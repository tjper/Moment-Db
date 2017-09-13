USE [Moment-Db];
GO

EXEC sp_configure filestream_access_level, 2
RECONFIGURE
GO

ALTER DATABASE [Moment-Db]
ADD FILEGROUP FileStreamGroup
CONTAINS FILESTREAM;
GO

ALTER DATABASE [Moment-Db]
ADD FILE (
	NAME = 'Media',
	FILENAME = 'D:\Microsft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Moment-Media.ndf'
)
TO FILEGROUP FileStreamGroup;
GO