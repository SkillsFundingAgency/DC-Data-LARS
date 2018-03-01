CREATE TABLE [Core].[LARS_StandardMetaData] (
    [StandardCode]             INT            NOT NULL,
    [RoleOverview]             NVARCHAR (MAX) NULL,
    [JobRoles]                 NVARCHAR (MAX) NULL,
    [Keywords]                 NVARCHAR (MAX) NULL,
    [EntryRequirements]        NVARCHAR (MAX) NULL,
    [Learning]                 NVARCHAR (MAX) NULL,
    [Qualifications]           NVARCHAR (MAX) NULL,
    [ProfessionalRegistration] NVARCHAR (MAX) NULL,
    [EffectiveFrom]            DATE           NULL,
    [EffectiveTo]              DATE           NULL,
    [Created_On]               DATETIME       NOT NULL,
    [Created_By]               VARCHAR (100)  NOT NULL,
    [Modified_On]              DATETIME       NOT NULL,
    [Modified_By]              VARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_CORE_LARS_StandardDescription] PRIMARY KEY CLUSTERED ([StandardCode] ASC) WITH (FILLFACTOR = 90)
);

