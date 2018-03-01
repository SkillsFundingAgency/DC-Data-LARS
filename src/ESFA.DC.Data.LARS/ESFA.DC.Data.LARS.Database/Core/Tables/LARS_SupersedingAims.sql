﻿CREATE TABLE [Core].[LARS_SupersedingAims] (
    [OldLearnAimRef] VARCHAR (8)   NOT NULL,
    [NewLearnAimRef] VARCHAR (8)   NOT NULL,
    [Created_On]     DATETIME      NOT NULL,
    [Created_By]     VARCHAR (100) NOT NULL,
    [Modified_On]    DATETIME      NOT NULL,
    [Modified_By]    VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_SupersedingAims] PRIMARY KEY CLUSTERED ([OldLearnAimRef] ASC, [NewLearnAimRef] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CoreSupersedingAims_CoreLearningDelivery] FOREIGN KEY ([OldLearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef]),
    CONSTRAINT [FK_CoreSupersedingAims_CoreLearningDelivery1] FOREIGN KEY ([NewLearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef])
);

