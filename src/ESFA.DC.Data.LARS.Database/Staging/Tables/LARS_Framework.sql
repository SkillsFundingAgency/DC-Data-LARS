﻿CREATE TABLE [Staging].[LARS_Framework] (
    [FworkCode]              INT            NOT NULL,
    [ProgType]               INT            NOT NULL,
    [PwayCode]               INT            NOT NULL,
    [PathwayName]            VARCHAR (256)  NULL,
    [EffectiveFrom]          DATE           NULL,
    [EffectiveTo]            DATE           NULL,
    [SectorSubjectAreaTier1] DECIMAL (5, 2) NULL,
    [SectorSubjectAreaTier2] DECIMAL (5, 2) NULL,
    [DataSource]             VARCHAR (150)  NULL,
    [NASTitle]               VARCHAR (750)  NULL,
    [ImplementDate]          DATE           NULL,
    [IssuingAuthorityTitle]  VARCHAR (256)  NULL,
    [IssuingAuthority]       VARCHAR (15)   NULL,
    [DataReceivedDate]       DATE           NULL,
    [MI_FullLevel2]          INT            NULL,
    [MI_FullLevel2Percent]   DECIMAL (5, 2) NULL,
    [MI_FullLevel3]          INT            NULL,
    [MI_FullLevel3Percent]   DECIMAL (5, 2) NULL,
    [CurrentVersion]         VARCHAR (10)   NULL,
    [Created_On]             DATETIME       NOT NULL,
    [Created_By]             VARCHAR (100)  NOT NULL,
    [Modified_On]            DATETIME       NOT NULL,
    [Modified_By]            VARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_Staging_LARS_Framework] PRIMARY KEY CLUSTERED ([FworkCode] ASC, [ProgType] ASC, [PwayCode] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_Framework TO [Lars_RW_User];