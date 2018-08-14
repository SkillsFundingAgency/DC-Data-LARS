CREATE TABLE [Staging].[LARS_StandardFunding] (
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
    CONSTRAINT [PK_Staging_LARS_StandardFunding] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [FundingCategory] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_StandardFunding TO [Lars_RW_User];
