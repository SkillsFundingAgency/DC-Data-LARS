CREATE USER [Lars_RW_User]
    WITH PASSWORD = N'$(LarsRWUserPassword)';
GO

GRANT CONNECT TO [Lars_RW_User]

GO
