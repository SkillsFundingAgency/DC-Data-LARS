﻿CREATE TABLE [Staging].[LARS_ApprenticeshipFunding] (
    [ApprenticeshipType]            VARCHAR (50)    NOT NULL,
    [ApprenticeshipCode]            INT             NOT NULL,
    [ProgType]                      INT             NOT NULL,
    [PwayCode]                      INT             NOT NULL,
    [FundingCategory]               VARCHAR (50)    NOT NULL,
    [EffectiveFrom]                 DATE            NOT NULL,
    [EffectiveTo]                   DATE            NULL,
    [BandNumber]                    INT             NULL,
    [CoreGovContributionCap]        DECIMAL (10, 5) NULL,
    [1618Incentive]                 DECIMAL (10, 5) NULL,
    [1618ProviderAdditionalPayment] DECIMAL (10, 5) NULL,
    [1618EmployerAdditionalPayment] DECIMAL (10, 5) NULL,
    [1618FrameworkUplift]           DECIMAL (10, 5) NULL,
    [Duration]                      DECIMAL (10, 5) NULL,
    [CareLeaverAdditionalPayment]   DECIMAL (10, 5) NULL,
    [ReservedValue2]                DECIMAL (10, 5) NULL,
    [ReservedValue3]                DECIMAL (10, 5) NULL,
    [MaxEmployerLevyCap]            DECIMAL (10, 5) NULL,
    [FundableWithoutEmployer]       CHAR (1)        NULL,
    [Created_On]                    DATETIME        NOT NULL,
    [Created_By]                    VARCHAR (256)   NOT NULL,
    [Modified_On]                   DATETIME        NOT NULL,
    [Modified_By]                   VARCHAR (256)   NOT NULL,
    CONSTRAINT [PK_Staging_LARS_ApprenticshipFunding] PRIMARY KEY CLUSTERED ([ApprenticeshipType] ASC, [ApprenticeshipCode] ASC, [ProgType] ASC, [PwayCode] ASC, [FundingCategory] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_ApprenticeshipFunding TO [Lars_RW_User];
