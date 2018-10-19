CREATE TABLE [Staging].[LARS_Standard] (
    [StandardCode]              INT            NOT NULL,
    [Version]                   INT            NOT NULL,
    [StandardName]              VARCHAR (256)  NULL,
    [StandardSectorCode]        VARCHAR (25)   NULL,
    [NotionalEndLevel]          VARCHAR (5)    NULL,
    [EffectiveFrom]             DATE           NULL,
    [LastDateStarts]            DATE           NULL,
    [EffectiveTo]               DATE           NULL,
    [URLLink]                   VARCHAR (1200) NULL,
    [SectorSubjectAreaTier1]    DECIMAL (5, 2) NULL,
    [SectorSubjectAreaTier2]    DECIMAL (5, 2) NULL,
    [IntegratedDegreeStandard]  CHAR (1)       NULL,
    [OtherBodyApprovalRequired] VARCHAR (20)  NULL,
    [Created_On]                DATETIME       NOT NULL,
    [Created_By]                VARCHAR (100)  NOT NULL,
    [Modified_On]               DATETIME       NOT NULL,
    [Modified_By]               VARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_LARS_Standard] PRIMARY KEY CLUSTERED ([StandardCode] ASC)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_Standard TO [Lars_RW_User];
