CREATE TABLE [Core].[LARS_StandardAims] (
    [StandardCode]          INT           NOT NULL,
    [LearnAimRef]           VARCHAR (8)   NOT NULL,
    [EffectiveFrom]         DATE          NOT NULL,
    [EffectiveTo]           DATE          NULL,
    [StandardComponentType] INT           NULL,
    [Created_On]            DATETIME      NOT NULL,
    [Created_By]            VARCHAR (100) NOT NULL,
    [Modified_On]           DATETIME      NOT NULL,
    [Modified_By]           VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_StandardAims] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [LearnAimRef] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Core_LARS_StandardAims_CoreLearningDelivery] FOREIGN KEY ([LearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef]) ON DELETE CASCADE,
    CONSTRAINT [FK_Core_LARS_StandardAims_CoreStandard] FOREIGN KEY ([StandardCode]) REFERENCES [Core].[LARS_Standard] ([StandardCode]) ON DELETE CASCADE
);

