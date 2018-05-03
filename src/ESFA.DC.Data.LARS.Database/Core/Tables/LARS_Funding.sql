CREATE TABLE [Core].[LARS_Funding] (
    [LearnAimRef]     VARCHAR (8)     NOT NULL,
    [FundingCategory] VARCHAR (50)    NOT NULL,
    [EffectiveFrom]   DATE            NOT NULL,
    [EffectiveTo]     DATE            NULL,
    [RateWeighted]    DECIMAL (10, 5) NULL,
    [RateUnWeighted]  DECIMAL (10, 5) NULL,
    [WeightingFactor] VARCHAR (1)     NOT NULL,
    [Created_On]      DATETIME        NOT NULL,
    [Created_By]      VARCHAR (256)   NOT NULL,
    [Modified_On]     DATETIME        NOT NULL,
    [Modified_By]     VARCHAR (256)   NOT NULL,
    CONSTRAINT [PK_Core_LARS_Funding_FundingID] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [FundingCategory] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90),	
    CONSTRAINT [FK_Core_LARS_Funding_CoreLearningDelivery] FOREIGN KEY ([LearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef]) ON DELETE CASCADE
);

