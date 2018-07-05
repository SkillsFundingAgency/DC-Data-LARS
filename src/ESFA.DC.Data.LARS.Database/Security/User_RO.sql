CREATE USER [Lars_RO_User]
    WITH PASSWORD = N'$(ROUserPassword)';
GO

GRANT CONNECT TO [Lars_RO_User]

GO
