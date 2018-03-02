﻿CREATE TABLE [Staging].[LARS_LearningDelivery] (
    [LearnAimRef]                     VARCHAR (8)    NOT NULL,
    [EffectiveFrom]                   DATE           NOT NULL,
    [EffectiveTo]                     DATE           NULL,
    [LearnAimRefTitle]                VARCHAR (254)  NULL,
    [LearnAimRefType]                 VARCHAR (4)    NULL,
    [NotionalNVQLevel]                CHAR (1)       NULL,
    [NotionalNVQLevelv2]              VARCHAR (5)    NULL,
    [AwardOrgAimRef]                  VARCHAR (50)   NULL,
    [CertificationEndDate]            DATE           NULL,
    [OperationalStartDate]            DATE           NULL,
    [OperationalEndDate]              DATE           NULL,
    [EnglandFEHEStatus]               CHAR (1)       NULL,
    [CreditBasedFwkType]              INT            NULL,
    [QltyAssAgencyType]               INT            NULL,
    [OfQualGlhMin]                    INT            NULL,
    [OfQualGlhMax]                    INT            NULL,
    [DiplomaLinesOfLearning]          VARCHAR (5)    NULL,
    [FrameworkCommonComponent]        INT            NULL,
    [LTRCPWithProviderUpliftFactor]   INT            NULL,
    [EntrySubLevel]                   VARCHAR (8)    NULL,
    [SuccessRateMapCode]              VARCHAR (8)    NULL,
    [AccreditiedNotDfESApproved]      INT            NULL,
    [AccreditiedMayPossDfESApproved]  INT            NULL,
    [JointInvestmentProgrammeOnly]    INT            NULL,
    [OLASSOnly]                       INT            NULL,
    [UnemployedOnly]                  INT            NULL,
    [IndependentLivingSkills]         INT            NULL,
    [AdditionalOrSpecialistLearning]  INT            NULL,
    [EnglPrscID]                      INT            NULL,
    [Vocational]                      INT            NULL,
    [AwardOrgCode]                    VARCHAR (20)   NULL,
    [UnitType]                        VARCHAR (50)   NULL,
    [LearningDeliveryGenre]           VARCHAR (3)    NULL,
    [ApprovedEmployerSchemeFramework] INT            NULL,
    [FrameworkCompletionClassCode]    INT            NULL,
    [OfQualOfferedEngland]            INT            NULL,
    [OfqualPurpose]                   VARCHAR (2)    NULL,
    [OfqualSubPurpose]                VARCHAR (4)    NULL,
    [RgltnStartDate]                  DATE           NULL,
    [SourceQualType]                  VARCHAR (15)   NULL,
    [SourceSystemRef]                 VARCHAR (50)   NULL,
    [SourceURLRef]                    VARCHAR (50)   NULL,
    [SourceURLLinkType]               INT            NULL,
    [OccupationalIndicator]           INT            NULL,
    [AccessHEIndicator]               INT            NULL,
    [KeySkillsIndicator]              INT            NULL,
    [FunctionalSkillsIndicator]       INT            NULL,
    [GCEIndicator]                    INT            NULL,
    [GCSEIndicator]                   INT            NULL,
    [ASLevelIndicator]                INT            NULL,
    [A2LevelIndicator]                INT            NULL,
    [ALevelIndicator]                 INT            NULL,
    [QCFIndicator]                    INT            NULL,
    [QCFDiplomaIndicator]             INT            NULL,
    [QCFCertificateIndicator]         INT            NULL,
    [EFAEnglishGCSE]                  INT            NULL,
    [EFAMathsGCSE]                    INT            NULL,
    [EFACOFType]                      INT            NULL,
    [SFAFundedIndicator]              INT            NULL,
    [DanceAndDramaIndicator]          INT            NULL,
    [AvailabiltyStatus]               INT            NULL,
    [Note]                            VARCHAR (MAX)  NULL,
    [LearnDirectClassSystemCode1]     VARCHAR (12)   NULL,
    [LearnDirectClassSystemCode2]     VARCHAR (12)   NULL,
    [LearnDirectClassSystemCode3]     VARCHAR (12)   NULL,
    [RegulatedCreditValue]            INT            NULL,
    [SectorSubjectAreaTier1]          DECIMAL (5, 2) NULL,
    [SectorSubjectAreaTier2]          DECIMAL (5, 2) NULL,
    [MI_NotionalNVQLevel]             INT            NULL,
    [MI_NotionalNVQLevelv2]           DECIMAL (5, 2) NULL,
    [GuidedLearningHours]             INT            NULL,
    [DirectStudyHours]                INT            NULL,
    [DedicatedAssessmentHours]        INT            NULL,
    [TotalQualificationTime]          INT            NULL,
    [Created_On]                      DATETIME       NOT NULL,
    [Created_By]                      VARCHAR (100)  NOT NULL,
    [Modified_On]                     DATETIME       NOT NULL,
    [Modified_By]                     VARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_Core_LARS_LearningDelivery] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC)
);

