﻿CREATE TABLE [Core].[LARS_AnnualValue] (
    [LearnAimRef]                   VARCHAR (8)    NOT NULL,
    [EffectiveFrom]                 DATE           NOT NULL,
    [EffectiveTo]                   DATE           NULL,
    [BasicSkills]                   INT            NULL,
    [BasicSkillsBroadType]          INT            NULL,
    [BasicSkillsType]               INT            NULL,
    [BasicSkillsParticipation]      INT            NULL,
    [FullLevel2EntitlementCategory] INT            NULL,
    [FullLevel2Percent]             DECIMAL (5, 2) NULL,
    [FullLevel3EntitlementCategory] INT            NULL,
    [FullLevel3Percent]             DECIMAL (5, 2) NULL,
    [MI_FullLevel2]                 INT            NULL,
    [MI_FullLevel2Percent]          DECIMAL (5, 2) NULL,
    [MI_FullLevel3]                 INT            NULL,
    [MI_FullLevel3Percent]          DECIMAL (5, 2) NULL,
    [OfQualValid19Plus]             INT            NULL,
    [SfaApprovalStatus]             INT            NULL,
    [UKCESSector]                   INT            NULL,
    [UKCESSubSector]                VARCHAR (2)    NULL,
    [Created_On]                    DATETIME       NOT NULL,
    [Created_By]                    VARCHAR (100)  NOT NULL,
    [Modified_On]                   DATETIME       NOT NULL,
    [Modified_By]                   VARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_Core_LARS_AnnualValue] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CoreAnnualValue_CoreLearningDelivery] FOREIGN KEY ([LearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef])
    );

