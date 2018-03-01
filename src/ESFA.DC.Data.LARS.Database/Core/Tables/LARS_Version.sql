CREATE TABLE [Core].[LARS_Version] (
    [MajorNumber]        INT           NOT NULL,
    [MinorNumber]        INT           NOT NULL,
    [MaintenanceNumber]  INT           NOT NULL,
    [MainDataSchemaName] VARCHAR (256) NULL,
    [RefDataSchemaName]  VARCHAR (256) NULL,
    [ActivationDate]     DATE          NOT NULL,
    [ExpiryDate]         DATE          NULL,
    [Description]        VARCHAR (500) NULL,
    [Comment]            VARCHAR (500) NULL,
    [Created_On]         DATETIME      NOT NULL,
    [Created_By]         VARCHAR (100) NOT NULL,
    [Modified_On]        DATETIME      NOT NULL,
    [Modified_By]        VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_Version] PRIMARY KEY CLUSTERED ([MajorNumber] ASC, [MinorNumber] ASC, [MaintenanceNumber] ASC)
);

