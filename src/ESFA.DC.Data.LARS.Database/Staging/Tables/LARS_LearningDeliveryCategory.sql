CREATE TABLE [Staging].[LARS_LearningDeliveryCategory] (
    [LearnAimRef]   VARCHAR (8)   NOT NULL,
    [CategoryRef]   INT           NOT NULL,
    [EffectiveFrom] DATE          NOT NULL,
    [EffectiveTo]   DATE          NULL,
    [Created_On]    DATETIME      NOT NULL,
    [Created_By]    VARCHAR (100) NOT NULL,
    [Modified_On]   DATETIME      NOT NULL,
    [Modified_By]   VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Staging_LARS_LearningDeliveryCategory] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [CategoryRef] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_LearningDeliveryCategory TO [Lars_RW_User];
