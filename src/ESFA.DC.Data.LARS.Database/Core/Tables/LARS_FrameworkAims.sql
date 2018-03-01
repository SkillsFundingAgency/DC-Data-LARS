CREATE TABLE [Core].[LARS_FrameworkAims] (
    [FworkCode]              INT           NOT NULL,
    [ProgType]               INT           NOT NULL,
    [PwayCode]               INT           NOT NULL,
    [LearnAimRef]            VARCHAR (8)   NOT NULL,
    [EffectiveFrom]          DATE          NOT NULL,
    [EffectiveTo]            DATE          NULL,
    [FrameworkComponentType] INT           NULL,
    [Created_On]             DATETIME      NOT NULL,
    [Created_By]             VARCHAR (100) NOT NULL,
    [Modified_On]            DATETIME      NOT NULL,
    [Modified_By]            VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_FrameworkAims] PRIMARY KEY CLUSTERED ([ProgType] ASC, [FworkCode] ASC, [PwayCode] ASC, [LearnAimRef] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90),
	CONSTRAINT [FK_CoreFrameworkAims_CoreLearningDelivery] FOREIGN KEY ([LearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef]),

);

