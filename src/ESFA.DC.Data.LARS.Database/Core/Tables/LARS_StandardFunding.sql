CREATE TABLE [Core].[LARS_StandardFunding] (
    [StandardCode]            INT             NOT NULL,
    [FundingCategory]         VARCHAR (50)    NOT NULL,
    [EffectiveFrom]           DATE            NOT NULL,
    [EffectiveTo]             DATE            NULL,
    [BandNumber]              INT             NULL,
    [CoreGovContributionCap]  DECIMAL (10, 5) NULL,
    [1618Incentive]           DECIMAL (10, 5) NULL,
    [SmallBusinessIncentive]  DECIMAL (10, 5) NULL,
    [AchievementIncentive]    DECIMAL (10, 5) NULL,
    [FundableWithoutEmployer] VARCHAR (50)    NULL,
    [Created_On]              DATETIME        NOT NULL,
    [Created_By]              VARCHAR (256)   NOT NULL,
    [Modified_On]             DATETIME        NOT NULL,
    [Modified_By]             VARCHAR (256)   NOT NULL,
    CONSTRAINT [PK_Core_LARS_StandardFunding] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [FundingCategory] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Core_LARS_StandardFunding_CoreStandard] FOREIGN KEY ([StandardCode]) REFERENCES [Core].[LARS_Standard] ([StandardCode]) ON DELETE CASCADE
);

