
CREATE TABLE [Staging].[LARS_CareerLearningPilot] (
    [LearnAimRef]    VARCHAR (8)     NOT NULL,
    [AreaCode]       VARCHAR (50)    NOT NULL,
    [EffectiveFrom]  DATE            NOT NULL,
    [EffectiveTo]    DATE            NULL,
    [MaxLoanAmount]  DECIMAL (10, 5) NULL,
    [SubsidyPercent] DECIMAL (10, 5) NULL,
    [SubsidyRate]    DECIMAL (10, 5) NULL,
    [Created_On]     DATETIME        NOT NULL,
    [Created_By]     VARCHAR (256)   NOT NULL,
    [Modified_On]    DATETIME        NOT NULL,
    [Modified_By]    VARCHAR (256)   NOT NULL,
    CONSTRAINT [PK_Staging_LARS_CLP_FundingID] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [AreaCode] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);

