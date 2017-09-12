ALTER TABLE [user].[Logins] WITH NOCHECK
ADD CONSTRAINT FK_Logins_UserUserID__Users_UserUserID FOREIGN KEY (UserUserID)
REFERENCES [user].[Users] (UserID)
GO

ALTER TABLE [user].[Logins] WITH CHECK CHECK CONSTRAINT ALL
GO
----------------------------------------------------------------------------------
